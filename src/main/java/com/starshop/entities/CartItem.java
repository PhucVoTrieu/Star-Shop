package com.starshop.entities;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "CartItems")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CartItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	
	@ManyToOne(fetch = FetchType.EAGER) // Một sản phẩm có thể thuộc nhiều CartItem
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

	private int quantity;
	
	 @JsonIgnore 
	@ManyToOne
    @JoinColumn(name = "cart_id", nullable = false)
    private ShoppingCart shoppingCart;
}
