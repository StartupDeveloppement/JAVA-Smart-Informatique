package com.ingesup.smarti.model;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.ingesup.smarti.entities.LigneCommande;
import com.ingesup.smarti.entities.Produit;

public class Panier {

private static final long serialVersionUID = 1L;
	
	private Map<Long, LigneCommande> articles=new HashMap<Long, LigneCommande>();
	public void ajouterArticle(Produit p,int quantite){
	LigneCommande art=articles.get(p.getIdProduit());
	if(art!=null) art.setQuantite(art.getQuantite()+quantite);
	else 
		articles.put(p.getIdProduit(), new LigneCommande(p, quantite));
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
}
