package com.ingesup.smarti.metier;



import java.util.List;

import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.entities.Client;
import com.ingesup.smarti.entities.Commande;
import com.ingesup.smarti.entities.Panier;
import com.ingesup.smarti.entities.Produit;

public interface IInternauteCatalogueMetier {
    
    public List<Categorie> listCategories();

    public Categorie getCategorie(Long idCat);

    public List<Produit> listProduits();

    public List<Produit> produitsParMotCle(String mc);

    public List<Produit> produitsParCategorie(String nomCategorie);

    public List<Produit> produitsSelectionnes();

    public Produit getProduit(Long idP);

    public Commande enregistrerCommande(Panier p, Client c);
}




