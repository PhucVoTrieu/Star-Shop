package com.starshop.services;

import java.util.List;
import java.util.Optional;

import com.starshop.entities.FlowerColor;
import com.starshop.entities.FlowerRecipient;

public interface FlowerRecipientService {

	void deleteAll();

	void deleteById(Long id);

	List<FlowerRecipient> findAll();

	Optional<FlowerRecipient> findById(Long id);

	

}
