package com.ingesup.smarti.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
//import java.util.List;

//import javax.servlet.http.HttpSession;
//import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.ui.ModelMap;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.SessionAttributes;

//import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.entities.Client;
import com.ingesup.smarti.model.Panier;
import com.ingesup.smarti.entities.Produit;
import com.ingesup.smarti.metier.IInternauteCatalogueMetier;

@Controller
//@RequestMapping(value = "/adminInt")
@SessionAttributes("panier") 
public class AdminInternauteController {
	
	@Autowired
	private IInternauteCatalogueMetier metier;
	
	
	@RequestMapping(value = "/internaute")
	public String internaute(Model model){
		if(model.asMap().get("panier")==null){ 
			if(model.asMap().get("panier")==null){ 
				model.addAttribute("panier", new Panier()); 
				}
			model.addAttribute("categories", metier.listCategories()); 
			model.addAttribute("produits", metier.produitsSelectionnes()); 
			
			}
		return "internaute";
	}
	
	@RequestMapping("/shop") 
	public String shop(Model model){ 
		
			model.addAttribute("categories", metier.listCategories()); 
			model.addAttribute("produits", metier.produitsSelectionnes()); 
			
		return "internaute"; 
	}
	
	
	@RequestMapping(value="/chercher")
	public String chercher(@RequestParam(value="motCle")String mc, Model model){
		model.addAttribute("mc", mc);	
		model.addAttribute("produits", metier.produitsParMotCle(mc));
		model.addAttribute("categories", metier.listCategories());
		//model.addAttribute("produits", metier.produitsSelectionnes());
		return "internaute";
	}
	
	@RequestMapping("/panier") 
	public String panier(Model model){ 
					 	
		return "panier"; 
	}
	
	@RequestMapping(value="/enregistrerCommande") 
	public String checkout(Model model,@RequestParam Panier p,@RequestParam Client c){ 
		model.addAttribute("client", new Client());
		metier.enregistrerCommande(p, c);	 	
		return "enregistrerCommande"; 
	}
	
	@RequestMapping(value="/shopItem" ,method=RequestMethod.GET) 
	public String getProduit(@RequestParam("idP") Long idP,Model model){ 
		 
				 
			model.addAttribute("categories", metier.listCategories()); 
			model.addAttribute("produit", metier.getProduit(idP));
		
			return "internaute"; 
	}
	
	@RequestMapping(value="/produitParCat")
	public String produitParCat(@RequestParam(value="nomCat")Long idCat, Model model) throws IOException{
		model.addAttribute("nomCat", idCat);
		model.addAttribute("produits", metier.produitsParCategorie(idCat));
		model.addAttribute("categories", metier.listCategories());
		//model.addAttribute("produits", metier.produitsSelectionnes());
		return "internaute";
	}

	
	@RequestMapping(value = "photoPro", produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] photoPro(Long idP) throws IOException {
	     Produit p = metier.getProduit(idP);
	     File f = new File(System.getProperty("java.io.tmpdir")+"/PRO_"+idP+"_"+p.getPhoto());
	     return IOUtils.toByteArray(new FileInputStream(f));
	}
	
	@RequestMapping(value="/ajouterArticle") 
	public String ajouterArticle(@RequestParam Long idProduit,@RequestParam(defaultValue="1") int quantite,Model model){ 
		Panier panier=null; 
		if(model.asMap().get("panier")==null){ 
			panier=new Panier(); 
			model.addAttribute("panier", panier); 
			} 
		else 
			panier=(Panier) model.asMap().get("panier"); 
		panier.ajouterArticle(metier.getProduit(idProduit), quantite); 
		model.addAttribute("produits", metier.listProduits()); 
		model.addAttribute("produits", metier.produitsSelectionnes()); 
		return "panier"; 
		} 
	
	@RequestMapping(value="/deleteItem")
	public String deleteItem(@RequestParam Long idProduit,Model model,Panier panier){
		if(model.asMap().get("panier")==null){
			return "panier";
		}
		else
				panier=(Panier) model.asMap().get("panier");
		        panier.deleteItem(idProduit);
		        model.addAttribute("produits", metier.listProduits()); 
				model.addAttribute("produits", metier.produitsSelectionnes());
		return "panier";
	}
	
	@RequestMapping(value="/editItem")
	public String editItem(@RequestParam Long idProduit,Model model,Panier panier){
		if(model.asMap().get("panier")==null){
			return "panier";
		}
		else
				panier=(Panier) model.asMap().get("panier");
		        panier.editItem(idProduit);
		        model.addAttribute("produits", metier.listProduits()); 
				model.addAttribute("produits", metier.produitsSelectionnes());
		return "panier";
	}
	
	@RequestMapping(value="/shop/ajouterArticle") 
	public String ajouter(@RequestParam("idP") Long idP,@RequestParam Long idProduit,@RequestParam(defaultValue="1") int quantite,Model model){ 
		Panier panier=null; 
		if(model.asMap().get("panier")==null){ 
			panier=new Panier(); 
			model.addAttribute("panier", panier); 
			} 
		else 
			panier=(Panier) model.asMap().get("panier"); 
		panier.ajouterArticle(metier.getProduit(idProduit), quantite); 
		model.addAttribute("categories", metier.listCategories()); 
		model.addAttribute("produit", metier.getProduit(idP)); 
		return "panier"; 
		} 
}
