
package com.starshop.entities;

import jakarta.persistence.*;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "addresses")
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String province;
	
	private String district;
	
	private String commune;
	
	private String streetName;
	
	private int streetNumber;
	
	@ManyToOne
    @JoinColumn(name = "buyer_id")
    private Buyer buyer;
}
