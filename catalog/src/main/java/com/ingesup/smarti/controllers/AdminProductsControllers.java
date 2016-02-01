package com.ingesup.smarti.controllers;


import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.entities.Produit;
import com.ingesup.smarti.metier.IAdminProduitCatalogueMetier;

@Controller
@RequestMapping(value = "/adminPro")

public class AdminProductsControllers {
	
	@Autowired
	public IAdminProduitCatalogueMetier metier;
	
	
	@RequestMapping(value="/produit")
	public String produit(Model model){
		model.addAttribute("produit", new Produit());
		model.addAttribute("produits", metier.listProduits());
		model.addAttribute("categories",metier.listCategories());
		return "produit";
	}
	
	
	@RequestMapping(value = "/savePro")
	public String savePro(@Valid Produit p, BindingResult bindingResult, Model model, MultipartFile file) throws IOException{
		if (bindingResult.hasErrors()) {
			model.addAttribute("categories", metier.listCategories());
            model.addAttribute("produits", metier.listProduits());
            return "produit";
        }
		if (!file.isEmpty()) {
			String path=System.getProperty("java.io.tmpdir");
			p.setPhoto(file.getOriginalFilename());
			Long idP=null;
			if(p.getIdProduit()==null){
				idP=metier.ajouterProduit(p, p.getCategorie().getIdCategorie());
			} else{
				metier.modifierProduit(p);
				idP=p.getIdProduit();
			}
			file.transferTo(new File(path+"/Pro_"+idP+"_"+file.getOriginalFilename()));
        }else{
        	if(p.getIdProduit()==null){
        	metier.ajouterProduit(p, p.getCategorie().getIdCategorie());}
        	else metier.modifierProduit(p);
        }
		model.addAttribute("produit", new Produit());
		model.addAttribute("produits", metier.listProduits());
		model.addAttribute("categories", metier.listCategories());
		return "produit";
	}
	@RequestMapping(value = "photoPro", produces = MediaType.IMAGE_JPEG_VALUE)
    @ResponseBody
    public byte[] photoPro(Long idP) throws IOException {
        Produit p = metier.getProduit(idP);
        File f = new File(System.getProperty("java.io.tmpdir")+"/PRO_"+idP+"_"+p.getPhoto());
        return IOUtils.toByteArray(new FileInputStream(f));
    }
	 @RequestMapping(value = "/editPro")
	    public String editPro(Long idP, Model model)throws IOException{
	    	Produit p = metier.getProduit(idP);
	    	model.addAttribute("produit", p);	
	    	model.addAttribute("produits", metier.listProduits());
	    	model.addAttribute("categories", metier.listCategories());
	    	return "produit";
	    }
	    
	 @RequestMapping(value = "/deletePro")
	    public String deletePro(Long idP, Model model) throws IOException {
	    	metier.supprimerProduit(idP);
	    	model.addAttribute("produit", new Produit());
	        model.addAttribute("produits", metier.listProduits());
	        model.addAttribute("categories", metier.listCategories());
	        return "produit";
	    }
}
