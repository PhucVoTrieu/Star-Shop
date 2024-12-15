package com.starshop.services;

import java.util.List;
import java.util.Optional;

import com.starshop.entities.FlowerColor;

public interface FlowerColorService {

	void deleteById(Long id);

	Optional<FlowerColor> findById(Long id);

	List<FlowerColor> findAll();

}
