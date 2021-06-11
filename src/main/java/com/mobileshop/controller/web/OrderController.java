package com.mobileshop.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mobileshop.dto.OrderCartDto;
import com.mobileshop.service.BookService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	BookService bookService;
	
	@PostMapping
	public String saveOrder(@ModelAttribute OrderCartDto orderCartDto) {
		try {
			bookService.saveOrder(orderCartDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/purchase-order";
	}

}
