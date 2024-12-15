package com.starshop.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starshop.entities.FlowerRecipient;
import com.starshop.repositories.FlowerRecipientRepository;
import com.starshop.services.FlowerRecipientService;
@Service
public class FlowerRecipientServiceImpl implements FlowerRecipientService{
	@Autowired
	FlowerRecipientRepository flowerRecipientRepository;

	@Override
	public List<FlowerRecipient> findAll() {
		return flowerRecipientRepository.findAll();
	}

	@Override
	public Optional<FlowerRecipient> findById(Long id) {
		return flowerRecipientRepository.findById(id);
	}

	@Override
	public void deleteById(Long id) {
		flowerRecipientRepository.deleteById(id);
	}

	@Override
	public void deleteAll() {
		flowerRecipientRepository.deleteAll();
	}


	
	
}
