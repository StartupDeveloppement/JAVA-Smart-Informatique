package com.ingesup.smarti.metier;


import com.ingesup.smarti.entities.Categorie;

public interface IAdminCategorieCatalogueMetier extends IAdminProduitCatalogueMetier {

    public Long ajouterCategorie(Categorie c);

    public void supprimerCategorie(Long idCat);

    public void modifierCategorie(Categorie c);
}







