package com.ingesup.smarti.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.entities.Client;
import com.ingesup.smarti.entities.Panier;
import com.ingesup.smarti.entities.Produit;
import com.ingesup.smarti.metier.IInternauteCatalogueMetier;

@Controller
@RequestMapping(value = "/adminInt")
public class AdminInternauteController {
	
	@Autowired
	private IInternauteCatalogueMetier metier;
	
	
	@RequestMapping(value="/internaute")
	public String internaute(Model model){
		model.addAttribute("categories", metier.listCategories());
		model.addAttribute("produits", metier.listProduits());
		return "internaute";
	}
	
	
	@RequestMapping(value="/produitParCat")
	public String produitParCat(@RequestParam String nomCategorie, Model model) throws IOException{
		model.addAttribute("categories", metier.listCategories());
		model.addAttribute("produits", metier.produitsParCategorie(nomCategorie));
		model.addAttribute("produits", metier.listProduits());
		return "internaute";
	}
	
//	@RequestMapping(value="/chercher")
//	public String chercher(@Valid String mc, Model model){
//		model.addAttribute("mc", mc);
//		model.addAttribute("categories", metier.listCategories());
//		model.addAttribute("produits", metier.produitsParMotCle(mc));
//		return "internaute";
//	}
	
	@RequestMapping(value = "photoPro", produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] photoPro(Long idP) throws IOException {
	     Produit p = metier.getProduit(idP);
	     File f = new File(System.getProperty("java.io.tmpdir")+"/PRO_"+idP+"_"+p.getPhoto());
	     return IOUtils.toByteArray(new FileInputStream(f));
	}
	
}
