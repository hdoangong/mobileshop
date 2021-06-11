package com.mobileshop.controller.web;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mobileshop.dto.OrderDto;
import com.mobileshop.dto.ProductInCartDto;
import com.mobileshop.model.ManufacturerModel;
import com.mobileshop.service.CartService;
import com.mobileshop.service.ManufacturerService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	CartService cartService;
	
	@Autowired
	ManufacturerService manufacturerService;

	@GetMapping
	public String cart(ModelMap modelMap) throws IOException {
		try {
			List<ProductInCartDto> products = cartService.getProductInCart();
			
			modelMap.put("products", products);
			
			long sumPrices = 0;
			for (ProductInCartDto productInCartDto : products) {
				sumPrices += productInCartDto.getPrices();
			}
			
			modelMap.put("sumPrices", sumPrices);
			
			List<ManufacturerModel> manufacturers = manufacturerService.getAll();
			modelMap.addAttribute("manufacturers", manufacturers);
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "home/Cart";
	}

	@PostMapping("/")
	public String saveCart(@ModelAttribute OrderDto orderDto) {
		try {
			cartService.saveCart(orderDto);

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return "redirect:/cart";
	}
	
	@PostMapping("/delete/{productId}")
	public String deleteCart(@PathVariable String productId) {
		try {
			cartService.deleteCart(productId);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return "redirect:/cart";
	}
}
