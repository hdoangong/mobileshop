package com.mobileshop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mobileshop.model.BookModel;
import com.mobileshop.model.ProductModel;
import com.mobileshop.model.RoleModel;
import com.mobileshop.model.UserModel;
import com.mobileshop.service.BookService;
import com.mobileshop.service.ProductService;
import com.mobileshop.service.RoleService;
import com.mobileshop.service.UserService;

@Controller(value = "HomeControllerAdmin")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;
	@Autowired
	ProductService productService;
	@Autowired
	BookService bookService;
	
	@RequestMapping(value="/")
	public String home(HttpServletResponse response) throws IOException{
		return "admin/home";
	}
	@RequestMapping(value="/users")
	public String users(ModelMap modelMap) throws IOException{
		try {
			List<RoleModel> roles = roleService.getAll();
			modelMap.put("roles", roles);
			
			List<UserModel> users = userService.getAll();
			modelMap.put("users", users);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/users";
	}
	@RequestMapping(value="/products")
	public String products(ModelMap modelMap) throws IOException{
		try {
			List<ProductModel> products = productService.getAll();
			modelMap.put("products", products);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/products";
	}
	
	@PostMapping(value = "/user", produces = "application/json;charset=UTF-8")
	public String saveOrUpdateUser(@ModelAttribute UserModel userModel) {
		try {
			userService.saveOrUpdate(userModel); 
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/admin/users?message=save-fail";
		}
		return "redirect:/admin/users?message=save-success";
	}
	
	@GetMapping("/books")
	public String books(ModelMap modelMap) throws IOException{
		try {
			List<BookModel> books = bookService.getAll();
			modelMap.put("books", books);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/books";
	}
}



