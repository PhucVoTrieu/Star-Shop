package com.starshop.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starshop.entities.OrderItem;
import com.starshop.repositories.OrderItemRepostiory;
import com.starshop.services.OrderItemService;

@Service
public class OrderItemServiceImpl implements OrderItemService{
	@Autowired
	OrderItemRepostiory itemRepostiory;

	@Override
	public <S extends OrderItem> S save(S entity) {
		return itemRepostiory.save(entity);
	}

	@Override
	public void deleteById(Long id) {
		itemRepostiory.deleteById(id);
	}
	
}
