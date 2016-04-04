package com.ingesup.smarti.model;

//import javax.persistence.Entity;
//import javax.persistence.Table;

import com.ingesup.smarti.entities.Produit;

//@Entity
//@Table(name="LigneCommande")
public class LigneCommande {

	private Produit produit; 
	private int quantite;
	
	public Produit getProduit() {
		return produit;
	}
	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public LigneCommande(Produit produit, int quantite) {
		super();
		this.produit = produit;
		this.quantite = quantite;
	}
}
