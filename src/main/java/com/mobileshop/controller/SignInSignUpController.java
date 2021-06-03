package com.mobileshop.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignInSignUpController {

	@GetMapping(value="/signin")
	public String signin(HttpServletResponse response) throws IOException{
		return "signinsignup/SignIn";
	}
	@GetMapping(value="/signup")
	public String signup(HttpServletResponse response) throws IOException{
		return "signinsignup/SignUp";
	}
	
}

