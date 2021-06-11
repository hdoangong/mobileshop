package com.mobileshop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mobileshop.dto.ProductInCartDto;
import com.mobileshop.model.ManufacturerModel;
import com.mobileshop.model.ProductModel;
import com.mobileshop.service.BookService;
import com.mobileshop.service.CartService;
import com.mobileshop.service.ManufacturerService;
import com.mobileshop.service.ProductService;
import com.mobileshop.service.UserService;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ManufacturerService manufacturerService;
	
	@Autowired
	BookService bookService;

	@RequestMapping(value = "/")
	public String home(ModelMap modelMap) throws IOException {
		try {

			List<Object> productsHot = new ArrayList<Object>();
			List<ProductModel> productTopList = productService.selectTopList();
			List<ProductModel> productModelSmallTopList = new ArrayList<ProductModel>();
			int i = 0;
			for (ProductModel product : productTopList) {
				if (i < 4) {

					productModelSmallTopList.add(product);
					i++;
				} else {
					productsHot.add(new ArrayList<ProductModel>(productModelSmallTopList));
					i = 0;

					productModelSmallTopList.clear();
				}

			}
			productsHot.add(productModelSmallTopList);
			
			
			
			
			List<Object> productsNews = new ArrayList<Object>();
			List<ProductModel> productNewList = productService.selectNewList();
			List<ProductModel> productSmallNewList = new ArrayList<ProductModel>();
			i = 0;
			for (ProductModel baidang : productNewList) {
				if (i < 4) {

					productSmallNewList.add(baidang);
					i++;
				} else {
					productsNews.add(new ArrayList<ProductModel>(productSmallNewList));
					i = 0;

					productSmallNewList.clear();
				}

			}
			productsNews.add(productSmallNewList);

			modelMap.addAttribute("productsHot", productsHot);
			modelMap.addAttribute("productsNews", productsNews);
			
			List<ManufacturerModel> manufacturers = manufacturerService.getAll();
			modelMap.addAttribute("manufacturers", manufacturers);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "home/home";
	}
	
	@GetMapping("/product-detail/{id}")
	public String detail(@PathVariable String id, ModelMap modelMap) throws IOException{
		try {
			ProductModel productModel = productService.getProduct(id);
			modelMap.put("product", productModel);
			
			long oldPrice = productModel.getPrice() + ((new Random()).nextInt(500 - 1) + 500) * 1000;
			modelMap.put("oldPrice", oldPrice);
			
			modelMap.put("urlImgs", productModel.getUrlImg().split("~"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "home/DetailProduct";
	}

	@RequestMapping(value = "/product-hot")
	public String productHot(HttpServletResponse response, ModelMap modelMap) throws IOException {
		try {
			Object products = productService.selectTopList();
			modelMap.addAttribute("products", products);
			List<ManufacturerModel> manufacturers = manufacturerService.getAll();
			modelMap.addAttribute("manufacturers", manufacturers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "home/ListProduct";
	}

	@RequestMapping(value = "/product-new")
	public String productNew(HttpServletResponse response, ModelMap modelMap) throws IOException {
		try {
			Object products = productService.selectNewList();
			modelMap.addAttribute("products", products);
			List<ManufacturerModel> manufacturers = manufacturerService.getAll();
			modelMap.addAttribute("manufacturers", manufacturers);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "home/ListProduct";
	}

	@RequestMapping(value = "/manufacturer")
	public String productManufacturer(@RequestParam String id, ModelMap modelMap) throws IOException {
		try {
			int idManufacturer = Integer.parseInt(id);
			Object products = productService.selectManufacturerList(idManufacturer);
			modelMap.addAttribute("products", products);
			List<ManufacturerModel> manufacturers = manufacturerService.getAll();
			modelMap.addAttribute("manufacturers", manufacturers);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "home/ListProduct";
	}
	
//	@RequestMapping(value="/purchase-order")
//	public String purchaseOrder(HttpServletResponse response) throws IOException{
//		return "home/purchaseOrder";
//	}
	
	@GetMapping("/midleware-purchase/{id}")
	public String midlewarePurchase(@PathVariable String id) {
		
		return "redirect:/product-detail/" + id;
	}

	@RequestMapping(value = "/cart")
	public String cart(HttpServletResponse response, ModelMap modelMap) throws IOException {
		try {
			List<ManufacturerModel> manufacturers = manufacturerService.getAll();
			modelMap.addAttribute("manufacturers", manufacturers);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "home/Cart";
	}

	@RequestMapping(value = "/purchase-order")
	public String purchaseOrder(HttpServletResponse response, ModelMap modelMap) throws IOException {
		try {
			List<ManufacturerModel> manufacturers = manufacturerService.getAll();
			modelMap.addAttribute("manufacturers", manufacturers);
			
			List<ProductInCartDto> productInCartDtos = bookService.getPurchasedProduct();
			
			modelMap.put("productInCartDtos", productInCartDtos);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "home/PurchaseOrder";
	}
	
}
