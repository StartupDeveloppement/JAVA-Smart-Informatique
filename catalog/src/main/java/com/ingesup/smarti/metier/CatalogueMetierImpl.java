package com.ingesup.smarti.metier;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ingesup.smarti.dao.ICatalogueDAO;
import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.entities.Client;
import com.ingesup.smarti.entities.Commande;
import com.ingesup.smarti.entities.LigneCommande;
import com.ingesup.smarti.entities.Panier;
import com.ingesup.smarti.entities.Produit;
import com.ingesup.smarti.entities.Role;
import com.ingesup.smarti.entities.User;

@Transactional
public class CatalogueMetierImpl implements IAdminCategorieCatalogueMetier {

    private ICatalogueDAO dao;
    
    public void setDao(ICatalogueDAO dao) {
        this.dao = dao;
    }

    @Override
    public Long ajouterProduit(Produit p, Long idCat) {
        dao.ajouterProduit(p, idCat);
        return p.getIdProduit();
    }

    @Override
    public void supprimerProduit(Long idP) {
        dao.supprimerProduit(idP);
    }

    @Override
    public void modifierProduit(Produit p) {
        dao.modifierProduit(p);
        
    }

    @Override
    public List<Categorie> listCategories() {
        
        return dao.listCategories();
    }

    @Override
    public Categorie getCategorie(Long idCat) {
        return dao.getCategorie(idCat);
    }

    @Override
    public List<Produit> listProduits() {
        // TODO Auto-generated method stub
        return dao.listProduits();
    }

    @Override
    public List<Produit> produitsParMotCle(String mc) {
        // TODO Auto-generated method stub
        return dao.produitsParMotCle(mc);
    }

    @Override
    public List<Produit> produitsParCategorie(Long idCat) {
        // TODO Auto-generated method stub
        return dao.produitsParCategorie(idCat);
    }

    @Override
    public List<Produit> produitsSelectionnes() {
        // TODO Auto-generated method stub
        return dao.produitsSelectionnes();
    }

    @Override
    public Produit getProduit(Long idP) {
        // TODO Auto-generated method stub
        return dao.getProduit(idP);
    }

    @Override
    public Commande enregistrerCommande(Panier panier, Client client) {
        // TODO Auto-generated method stub
        return dao.enregistrerCommande(panier, client);
    }

    @Override
    public Long ajouterCategorie(Categorie c) {
        // TODO Auto-generated method stub
        dao.ajouterCategorie(c);
        return c.getIdCategorie();
    }

    @Override
    public void supprimerCategorie(Long idCat) {
        dao.supprimerCategorie(idCat);
        
    }

    @Override
    public void modifierCategorie(Categorie c) {
        dao.modifierCategorie(c);
    }

    @Override
    public void ajouterUser(User u) {
        dao.ajouterUser(u);
    }

    @Override
    public void attribuerRole(Role r, Long userID) {
        dao.attribuerRole(r, userID);
    }
}








