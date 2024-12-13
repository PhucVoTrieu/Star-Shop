package com.starshop.services.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starshop.entities.Address;
import com.starshop.entities.Buyer;
import com.starshop.repositories.AddressRepository;
import com.starshop.repositories.BuyerRepository;
import com.starshop.services.AddressService;

@Service
public class AddressServiceImpl implements AddressService{
	@Autowired
	AddressRepository addressRepository;
	
	
	@Override
	public Address findByBuyer(Buyer buyer) {
		return addressRepository.findByBuyer(buyer);
	}


	@Override
	public <S extends Address> S save(S entity) {
		return addressRepository.save(entity);
	}


	@Override
	public Optional<Address> findById(Long id) {
		return addressRepository.findById(id);
	}


	@Override
	public void deleteById(Long id) {
		addressRepository.deleteById(id);
	}


	@Override
	public void deleteAll() {
		addressRepository.deleteAll();
	}


}
