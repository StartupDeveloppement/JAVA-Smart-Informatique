package com.ingesup.smarti.controllers;



import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ingesup.smarti.dao.CatalogueDAOImpl;
import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.metier.IAdminCategorieCatalogueMetier;

@Controller
@RequestMapping(value = "/adminCat")
public class AdminCategoriesController {
	
    @Autowired
    private IAdminCategorieCatalogueMetier metier;


     @RequestMapping(value="/index")
     public String index(Model model){
     model.addAttribute("categorie", new Categorie());
     model.addAttribute("categories", metier.listCategories());
     return "index";
     }
    
    @RequestMapping(value = "/saveCat")
    public String saveCat(@Valid Categorie c, BindingResult bindingResult, Model model, MultipartFile file)
            throws IOException {
        if (bindingResult.hasErrors()) {
            model.addAttribute("categories", metier.listCategories());
            return "index";
        }
        if (!file.isEmpty()) {
            BufferedImage bi = ImageIO.read(file.getInputStream());
            c.setPhoto(file.getBytes());
            c.setNomPhoto(file.getOriginalFilename());
        }
        metier.ajouterCategorie(c);
        model.addAttribute("categorie", new Categorie());
        model.addAttribute("categories", metier.listCategories());
        return "index";
    }  

    @RequestMapping(value = "photoCat", produces = MediaType.IMAGE_JPEG_VALUE)
    @ResponseBody
    public byte[] photoCat(Long idCat) throws IOException {
        Categorie c = metier.getCategorie(idCat);
        return IOUtils.toByteArray(new ByteArrayInputStream(c.getPhoto()));
    }

    
//  @RequestMapping(value = "/editCat")
//  @ResponseBody
//  public String editCat(@Valid Categorie c, BindingResult bindingResult, Model model, MultipartFile file)throws IOException {
//  	Long idCategorie = Integer.parseInt(request.getParameter("idCategorie"));
//      Categorie categorie = CatalogueDAOImpl.get(idCategorie);
//      model.addAttribute("categorie", categorie);
//      return "index"; 
//  }
  
//  @RequestMapping(value = "/deleteCat")
//  public String deleteCategorie(@Valid Long idCat, Model model, MultipartFile file)
//  {
//  	metier.supprimerCategorie(idCat);
//      return "index";
//  }
}











