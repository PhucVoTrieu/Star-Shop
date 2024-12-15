package com.starshop.entities;

import java.util.List;


import com.starshop.*;
import com.starshop.enums.Role;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Entity
@Data
@DiscriminatorValue("BUYER")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder
public class Buyer extends User{

  

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String phoneNumber;

    @OneToMany(mappedBy = "buyer")
    private List<Order> orders;

    @OneToOne(mappedBy = "buyer", cascade = CascadeType.ALL, orphanRemoval = true)
    private ShoppingCart shoppingCart; // Một Buyer có một ShoppingCart
    
    @OneToMany(mappedBy = "buyer", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Address> addresses;

    @OneToMany(mappedBy = "buyer", cascade = CascadeType.ALL)
    private List<Favorite> favorites;
    
    @Override
    public String getRole() {
        return Role.BUYER.name();
    }

	@Override
	public String toString() {
		return "Buyer []";
	}
}
