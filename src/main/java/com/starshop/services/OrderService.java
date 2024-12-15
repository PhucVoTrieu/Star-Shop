package com.starshop.services;

import java.util.List;
import java.util.Optional;

import com.starshop.entities.Buyer;
import com.starshop.entities.Order;

import jakarta.validation.Valid;

public interface OrderService {

	Optional<Order> findById(Long id);

	


	<S extends Order> S save(S entity);




	boolean hasBuyerPurchasedProduct(Buyer buyer, Long productId);




	List<Order> findAll();

}
