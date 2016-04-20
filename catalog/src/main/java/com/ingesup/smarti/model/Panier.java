package com.ingesup.smarti.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.ingesup.smarti.entities.LigneCommande;
import com.ingesup.smarti.entities.Produit;

public class Panier implements Serializable {

private static final long serialVersionUID = 1L;
	
	private Map<Long, LigneCommande> articles=new HashMap<Long, LigneCommande>();
	public void ajouterArticle(Produit p,int quantite){
	LigneCommande art=articles.get(p.getIdProduit());
	if(art!=null && art.getQuantite()<p.getQuantite()) art.setQuantite(art.getQuantite()+quantite);
	else
		art.setQuantite(art.getQuantite());
		//articles.put(p.getIdProduit(), new LigneCommande(p, quantite));
}
	public Collection<LigneCommande> getArticles(){
	return articles.values();
	}
	public double getTotal(){
	double total=0;
	Collection<LigneCommande> items=getArticles();
	for(LigneCommande art:items){
	total+=art.getQuantite()*art.getProduit().getPrix();
	}
	return total;
	}
	
	public void deleteItem(Long idProduit){
		articles.remove(idProduit);
		}
	
	public int getSize(){
		int nb=0;
		Collection<LigneCommande> items=getArticles();
		for(LigneCommande art:items){
		nb+=art.getQuantite();
		}
		return nb;
		}
		
	public void plus(Produit p,int quantite){
		LigneCommande art=articles.get(p.getIdProduit());
		//int art=0;
		//if(art.getQuantite()>1)
		if(art.getQuantite()<p.getQuantite())
			art.setQuantite(art.getQuantite()+quantite);
		else
			art.setQuantite(art.getQuantite());
		
	}
	public void minus(Produit p,int quantite){
		LigneCommande art=articles.get(p.getIdProduit());
		//int art=0;
		if(art.getQuantite()>1)
			art.setQuantite(art.getQuantite()-quantite);
		else
			art.setQuantite(art.getQuantite());
		
	}
}
			
