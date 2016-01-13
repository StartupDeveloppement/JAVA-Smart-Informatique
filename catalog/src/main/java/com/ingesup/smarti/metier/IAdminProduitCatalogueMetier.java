package com.ingesup.smarti.metier;

import com.ingesup.smarti.entities.Produit;

public interface IAdminProduitCatalogueMetier extends IInternauteCatalogueMetier {

    public Long ajouterProduit(Produit p, Long idCat);

    public void supprimerProduit(Long idP);

    public void modifierProduit(Produit p);
}







