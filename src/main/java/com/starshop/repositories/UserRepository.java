package com.starshop.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.starshop.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
		Optional<User>findByEmail(String email);
}
