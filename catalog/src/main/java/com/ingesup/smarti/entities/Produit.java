package com.ingesup.smarti.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="PRODUITS")
public class Produit implements Serializable{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long idProduit;
    @NotEmpty
    @Size(min=4, max=20)
    private String designation;
    @NotEmpty
    @Size(min=4, max=60)
    private String description;
    private double prix;
    private int quantite;
    private boolean selected;						
    private String photo;
    @ManyToOne  // un ou plusieurs produits correspondent � private String nomPhoto;une cattegorie
    @JoinColumn(name="idCategorie")
    private Categorie categorie;
    public Long getIdProduit() {
        return idProduit;
    }
	public void setIdProduit(Long idProduit) {
        this.idProduit = idProduit;
    }
    public String getDesignation() {
        return designation;
    }
    public void setDesignation(String designation) {
        this.designation = designation;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public double getPrix() {
        return prix;
    }
    public void setPrix(double prix) {
        this.prix = prix;
    }
    public int getQuantite() {
        return quantite;
    }
    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    public boolean isSelected() {
        return selected;
    }
    public void setSelected(boolean selected) {
        this.selected = selected;
    }
    public String getPhoto() {
        return photo;
    }
    public void setPhoto(String photo) {
        this.photo = photo;
    }
    public Categorie getCategorie() {
        return categorie;
    }
    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }
    public Produit() {
        super();
    }
    public Produit(String designation, String description, double prix, int quantite, boolean selected, String photo) {
        super();
        this.designation = designation;
        this.description = description;
        this.prix = prix;
        this.quantite = quantite;
        this.selected = selected;
        this.photo = photo;
    }
    
    
    
}



