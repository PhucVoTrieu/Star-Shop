package com.starshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.starshop.entities.FlowerRecipient;

@Repository
public interface FlowerRecipientRepository extends JpaRepository<FlowerRecipient, Long>{

}
