package com.ingesup.smarti;



import org.testng.annotations.Test;

import com.ingesup.smarti.entities.Categorie;
import com.ingesup.smarti.entities.Produit;
import com.ingesup.smarti.metier.IAdminCategorieCatalogueMetier;

import org.testng.annotations.BeforeTest;

import static org.testng.Assert.assertTrue;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.testng.annotations.AfterTest;

public class TestCatalogue {
    
    ClassPathXmlApplicationContext applicationContext;
    @BeforeTest
    public void beforeTest() {
        applicationContext = new ClassPathXmlApplicationContext(
                new String[] { "applicationContext.xml" });
    }

    @Test
    public void fCategories() {
        try {
            IAdminCategorieCatalogueMetier metier = (IAdminCategorieCatalogueMetier) applicationContext.getBean("metier");
            List<Categorie> cts1 = metier.listCategories();
            metier.ajouterCategorie(new Categorie("Ordinateur", "ordinateur", null, "image1.jpg"));
            metier.ajouterCategorie(new Categorie("Impri", "imprimantes", null, "image.jpg"));
            List<Categorie> cts2 = metier.listCategories();
            assertTrue(cts1.size()+2 == cts2.size());
        } catch (Exception e) {

            assertTrue(false, e.getMessage());
        }
    }

    @Test
    public void fProduits() {
        try {
            IAdminCategorieCatalogueMetier metier = (IAdminCategorieCatalogueMetier) applicationContext.getBean("metier");
            List<Produit> prods1 = metier.listProduits();
            metier.ajouterProduit(new Produit("HP45ERT", "HP789", 6000, 50, true, null), 1L);
            metier.ajouterProduit(new Produit("AZERTY", "ACER789", 12000, 42, true, null), 1L);
            List<Produit> prods2 = metier.listProduits();
            assertTrue(prods1.size()+2 == prods2.size());
            
        } catch (Exception e) {

            assertTrue(false, e.getMessage());
        }
    }
    @AfterTest
    public void afterTest() {
    }

}











