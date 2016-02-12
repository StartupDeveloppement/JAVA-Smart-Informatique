/*package com.ingesup.smarti.entities;



import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Panier implements Serializable {

    private Map<Long, LigneCommande> items = new HashMap<Long, LigneCommande>();
    
    public void ajouterArticle(Produit produit, int quantite){
    	LigneCommande lc = items.get(produit.getIdProduit());
        if(lc!=null){
        	lc.setQuantite(lc.getQuantite()+quantite);
        } else {
        	items.put(produit.getIdProduit(), new LigneCommande(quantite, produit));
        }
    }
    public Collection<LigneCommande> getItems(){
        return items.values();
    }
    public double getTotal(){
        double total = 0;
        Collection<LigneCommande> items =getItems();
        for (LigneCommande lc : items) {
        	total+=lc.getQuantite()*lc.getProduit().getPrix();
        }
        return total;
    }
    
    public int getSize(){
    	int nb=0;
    	Collection<LigneCommande> items=getItems();
    	for(LigneCommande lc:items){
    	nb+=lc.getQuantite();
    	}
    	return nb;
    }
    
    public void deleteItem(Long idProduit){
        items.remove(idProduit);
    }
    
    
}


*/