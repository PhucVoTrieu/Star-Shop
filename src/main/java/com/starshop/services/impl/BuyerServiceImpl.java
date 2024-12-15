package com.starshop.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starshop.entities.Buyer;
import com.starshop.repositories.BuyerRepository;
import com.starshop.services.BuyerService;

@Service
public class BuyerServiceImpl implements BuyerService{
	@Autowired
	BuyerRepository buyerRepository;

	@Override
	public List<Buyer> findAll() {
		return buyerRepository.findAll();
	}

	@Override
	public Optional<Buyer> findById(int id) {
		return buyerRepository.findById(id);
	}

	@Override
	public Buyer findBuyerByEmail(String email) {
		return buyerRepository.findBuyerByEmail(email);
	} 
	
}
