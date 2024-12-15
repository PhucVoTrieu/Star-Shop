package com.starshop.services.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starshop.entities.FlowerColor;
import com.starshop.repositories.FlowerColorRepository;
import com.starshop.services.FlowerColorService;
import com.starshop.services.FlowerRecipientService;

@Service
public class FlowerColorServiceImpl implements FlowerColorService{
	@Autowired
	FlowerColorRepository colorRepository;

	@Override
	public List<FlowerColor> findAll() {
		return colorRepository.findAll();
	}

	@Override
	public Optional<FlowerColor> findById(Long id) {
		return colorRepository.findById(id);
	}

	@Override
	public void deleteById(Long id) {
		colorRepository.deleteById(id);
	}

	
}
