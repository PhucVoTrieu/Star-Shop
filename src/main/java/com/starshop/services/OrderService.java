package com.starshop.services;

import java.util.Optional;

import com.starshop.entities.Order;

public interface OrderService {

	Optional<Order> findById(Long id);

	<S extends Order> S save(S entity);

}
