package com.starshop.controllers;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.starshop.entities.User;
import com.starshop.model.LoginResponse;
import com.starshop.model.LoginUserModel;
import com.starshop.model.RegisterUserModel;
import com.starshop.services.AuthenticationService;
import com.starshop.services.JwtService;

import jakarta.servlet.http.HttpServletResponse;

@RequestMapping("/auth")
@RestController
public class AuthenticationController {
	private final JwtService jwtService;
	private final AuthenticationService authenticationService;

	public AuthenticationController(JwtService jwtService, AuthenticationService authenticationService) {
		this.jwtService = jwtService;
		this.authenticationService = authenticationService;
	}

	@PostMapping("/signup")
	@Transactional
	public ResponseEntity<User> register(@RequestBody RegisterUserModel registerUser) {
		User registeredUser = authenticationService.signup(registerUser);
		return ResponseEntity.ok(registeredUser);
	}

	@PostMapping(path = "/login")
	@Transactional
	public ResponseEntity<LoginResponse> authenticate(@RequestBody LoginUserModel loginUser) {
		User authenticatedUser = authenticationService.authenticate(loginUser);
		String jwtToken = jwtService.generateToken(authenticatedUser);
		
		ResponseCookie cookie = ResponseCookie.from("jwtToken", jwtToken)
	            .maxAge(3600)     // Cookie tồn tại 1 giờ
	            .path("/")        // Áp dụng cho toàn bộ ứng dụng
	            .build();
		
		LoginResponse loginResponse = new LoginResponse();
		loginResponse.setToken(jwtToken);
		loginResponse.setExpiresIn(jwtService.getExpirationTime());
		 // Tạo header
	    HttpHeaders headers = new HttpHeaders();
	    headers.add(HttpHeaders.SET_COOKIE, cookie.toString());

	    // Tạo đối tượng LoginResponse
	   // LoginResponse loginResponse = new LoginResponse(jwtToken, 3600L);

	    // Trả về ResponseEntity với header
	    return new ResponseEntity<>(loginResponse, headers, HttpStatus.OK);
	    
		//return ResponseEntity.ok(loginResponse).(HttpHeaders.SET_COOKIE, cookie.toString());
	}
	
	@PostMapping("/logout")
	public ResponseEntity<Void> logout(HttpServletResponse response) {
	    // Xóa cookie jwtToken
	    ResponseCookie cookie = ResponseCookie.from("jwtToken", "")
	            .maxAge(0)  // Hết hạn ngay lập tức
	            .path("/")  // Áp dụng cho toàn bộ ứng dụng
	            .build();

	    HttpHeaders headers = new HttpHeaders();
	    headers.add(HttpHeaders.SET_COOKIE, cookie.toString());
	    return ResponseEntity.noContent().headers(headers).build();
	}

}