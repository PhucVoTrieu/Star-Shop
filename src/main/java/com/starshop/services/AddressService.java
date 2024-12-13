package com.starshop.services;

import java.util.Optional;

import com.starshop.entities.Address;
import com.starshop.entities.Buyer;

public interface AddressService {

	Address findByBuyer(Buyer buyer);

	void deleteAll();

	void deleteById(Long id);

	Optional<Address> findById(Long id);

	<S extends Address> S save(S entity);


	
}
