package com.starshop.services;

import com.starshop.entities.OrderItem;

public interface OrderItemService {

	void deleteById(Long id);

	<S extends OrderItem> S save(S entity);
	
}
