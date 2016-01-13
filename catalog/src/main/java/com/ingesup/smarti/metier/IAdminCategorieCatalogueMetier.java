package com.ingesup.smarti.metier;

import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.entities.Role;
import com.ingesup.smarti.entities.User;

public interface IAdminCategorieCatalogueMetier extends IAdminProduitCatalogueMetier {

    public Long ajouterCategorie(Categorie c);

    public void supprimerCategorie(Long idCat);

    public void modifierCategorie(Categorie c);

    public void ajouterUser(User u);

    public void attribuerRole(Role r, Long userID);
}







