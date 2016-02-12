package com.ingesup.smarti.dao;


import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.entities.Client;
import com.ingesup.smarti.entities.Commande;
import com.ingesup.smarti.entities.LigneCommande;
//import com.ingesup.smarti.entities.Panier;
import com.ingesup.smarti.entities.Produit;
import com.ingesup.smarti.entities.Role;
import com.ingesup.smarti.entities.User;

public class CatalogueDAOImpl implements ICatalogueDAO {
    
    @PersistenceContext
    EntityManager em;
    
    @Override
    public Long ajouterCategorie(Categorie c) {
        em.persist(c);
        return c.getIdCategorie();
    }

    @Override
    public List<Categorie> listCategories() {
        Query req=em.createQuery("select c from Categorie c");
        return req.getResultList();
    }

    @Override
    public Categorie getCategorie(Long idCat) {
        return em.find(Categorie.class, idCat);        
    }

    @Override
    public void supprimerCategorie(Long idCat) {
        Categorie c = em.find(Categorie.class, idCat);
        em.remove(c);
    }

    @Override
    public void modifierCategorie(Categorie c) {
        em.merge(c);
    }

    @Override
    public Long ajouterProduit(Produit p, Long idCat) {
        Categorie c = em.find(Categorie.class, idCat);
        p.setCategorie(c);
        em.persist(p);
        return p.getIdProduit();
    }

    @Override
    public List<Produit> listProduits() {
        Query req = em.createQuery("select p from Produit p");
        return req.getResultList();
    }

    @Override
    public List<Produit> produitsParMotCle(String mc) {
        Query req = em.createQuery("select p from Produit p where p.designation like :x or p.description like :x");
        req.setParameter("x", "%"+mc+"%");
        return req.getResultList();
    }

    @Override
    public List<Produit> produitsParCategorie(Long idCat) {
        Query req = em.createQuery("select p from Produit p where p.categorie.idCategorie =:x");
        req.setParameter("x", idCat);
        return req.getResultList();
    }

    @Override
    public List<Produit> produitsSelectionnes() {
        Query req = em.createQuery("select p from Produit p where p.selected=true");
        return req.getResultList();
    }

    @Override
    public Produit getProduit(Long idP) {
        return em.find(Produit.class, idP);
    }

    @Override
    public void supprimerProduit(Long idP) {
        Produit p = em.find(Produit.class, idP);
        if(p == null) 
            throw new RuntimeException("produit introuvable");
        else
            em.remove(p);
    }

    @Override
    public void modifierProduit(Produit p) {
        em.merge(p);
    }

    @Override
    public void ajouterUser(User u) {
        em.persist(u);
    }

    @Override
    public void attribuerRole(Role r, Long userID) {
        User u = em.find(User.class, userID);
        u.getRoles().add(r); // ajout du role à l'utilisateur
        em.persist(r);
    }

	@Override
	public Long ajouterLigneCommande(LigneCommande lc, Long idP) {
		Produit p = em.find(Produit.class, idP);
        lc.setProduit(p);
        em.persist(lc);
		return lc.getId();
	}

	@Override
	public List<LigneCommande> listLignes() {
		Query req = em.createQuery("select lc from LigneCommande lc");
        return req.getResultList();
	}

//    @Override
//    public Commande enregistrerCommande(Panier panier, Client client) {
//        em.persist(client);
//        Commande cmd = new Commande();
//        cmd.setDateCommande(new Date());
//        cmd.setItems(panier.getItems()); // recuperation de la liste pour stocker
//                                    // dans la commande
//        for (LigneCommande lc : panier.getItems()) {
//            em.persist(lc);
//        }
//        em.persist(cmd);
//        return cmd;
//    }

}




