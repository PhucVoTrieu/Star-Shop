package com.starshop.services;

import java.util.List;
import java.util.Optional;

import com.starshop.entities.Buyer;

public interface BuyerService {

	Optional<Buyer> findById(int buyerID);

	Buyer findBuyerByEmail(String email);

	List<Buyer> findAll();

}
