package com.starshop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LoginResponse {
	private String token;
	private Long expiresIn;
	private String role; 
	public String getToken() {
		return token;
	}
}
