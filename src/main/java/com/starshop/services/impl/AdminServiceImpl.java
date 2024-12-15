package com.starshop.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starshop.entities.Admin;
import com.starshop.repositories.AdminRepository;
import com.starshop.services.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Override
	public <S extends Admin> S save(S entity) {
		return adminRepository.save(entity);
	}
	@Autowired
	AdminRepository adminRepository;
	@Override
	public boolean existAdminAccount() {
		return adminRepository.findAll().size()!=0;
	}
}
