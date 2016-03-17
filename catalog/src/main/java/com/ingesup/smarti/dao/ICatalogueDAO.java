package com.ingesup.smarti.dao;

import java.util.List;

import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.entities.Client;
import com.ingesup.smarti.entities.Commande;
import com.ingesup.smarti.entities.LigneCommande;
import com.ingesup.smarti.entities.Panier;
import com.ingesup.smarti.entities.Produit;
import com.ingesup.smarti.entities.Role;
import com.ingesup.smarti.entities.User;



public interface ICatalogueDAO {
    
    public Long ajouterCategorie(Categorie c);
    public List<Categorie> listCategories();
    public Categorie getCategorie(Long idCat);
    public void supprimerCategorie(Long idCat);
    public void modifierCategorie(Categorie c);
    
    public Long ajouterProduit(Produit p, Long idCat);
    public List<Produit> listProduits();
    public List<Produit> produitsParMotCle(String mc);
    public List<Produit> produitsParCategorie(Long idCat);
    public List<Produit> produitsSelectionnes();
    public Produit getProduit(Long idP);
    public void supprimerProduit(Long idP);
    public void modifierProduit(Produit p);
    
    public void ajouterUser(User u);
    public void attribuerRole(Role r, Long userID);

    public Commande enregistrerCommande(Panier panier, Client client);

}



