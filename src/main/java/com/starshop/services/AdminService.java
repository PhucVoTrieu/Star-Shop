package com.starshop.services;

import com.starshop.entities.Admin;

public interface AdminService {

	boolean existAdminAccount();

	<S extends Admin> S save(S entity);



}
