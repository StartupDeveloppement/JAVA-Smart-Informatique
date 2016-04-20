package com.ingesup.smarti.entities;
import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="CLIENTS")
public class Client  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id 
	@GeneratedValue(strategy=GenerationType.AUTO) 
	private Long idClient; 
	private String nomClient; 
	 
	private String adresse; 
	
	private String email; 
	
	private String tel; 
	
	@OneToMany(mappedBy="client") 
	private Collection<Commande> commandes;

}
