package com.mobileshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mobileshop.model.UserModel;
import com.mobileshop.service.UserService;

@RestController
@RequestMapping("/api")
public class ApiController {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/user/{id}")
	public ResponseEntity<?> getUser(@PathVariable String id) {
		try {
			UserModel user = userService.getUser(id);
			return ResponseEntity.ok(user);
		} catch (Exception ex) {
			ex.printStackTrace();
			return ResponseEntity.status(500).body(null);
		}
		
	}
}
