package com.ingesup.smarti.entities;



import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Panier implements Serializable {
	private Map<Long, LigneCommande> items = new HashMap<Long, LigneCommande>();
    
	public void addArticle(Produit produit, int quantite)
	{
		if(items.get(produit.getIdProduit())==null)
				{
					LigneCommande lc = new LigneCommande();
					lc.setProduit(produit);
					lc.setQuantite(quantite);
					lc.setPrix(produit.getPrix());
			
				}else{
					LigneCommande lc = items.get(produit.getIdProduit());
					lc.setQuantite(lc.getQuantite()+quantite);
				}
	}
	
	public Collection<LigneCommande> getItems()
	{
		return items.values();
	}
	
	public double getTotal()
	{
		double total = 0;
		
		for(LigneCommande lc : items.values())
		{
			total+=lc.getPrix()*lc.getQuantite();
		}
		return total;
	}
	
	public int getSize()
	{
		return items.size();
	}
	
	
	
	public void deleteItem(Long idProduit)
	
	{
		items.remove(idProduit);
		
	}
}


