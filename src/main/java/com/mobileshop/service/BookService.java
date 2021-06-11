package com.mobileshop.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mobileshop.dto.OrderCartDto;
import com.mobileshop.dto.ProductInCartDto;
import com.mobileshop.mapper.BookMapper;
import com.mobileshop.model.BookModel;
import com.mobileshop.model.BookTableModel;
import com.mobileshop.model.CartModel;
import com.mobileshop.model.ProductModel;
import com.mobileshop.util.AccountUtil;

@Service
public class BookService {
	@Autowired
	BookMapper bookMapper;

	@Autowired
	CartService cartService;

	@Autowired
	AccountUtil accountUtil;

	@Autowired
	ProductService productService;

	public List<BookModel> getAll() throws Exception {
		return bookMapper.getAll();
	}

	public List<BookTableModel> getAllBookTable() throws Exception {
		return bookMapper.getAllBookTable();
	}

	public BookModel getBook(Map<String, Object> params) throws Exception {
		return bookMapper.getBook(params);
	}

	@Transactional(rollbackFor = Exception.class)
	public void saveOrUpdateBook(BookModel bookModel) throws Exception {
		if (bookModel.getProductId() == null) {
			System.out.println("ERROR: Miss Product PK");
			throw new Exception();
		}
		Map<String, Object> params = new HashMap<>();
		params.put("productId", bookModel.getProductId());
		params.put("userId", bookModel.getUserId());
		params.put("time", bookModel.getTime());
		BookModel book = this.getBook(params);
		
		if(book != null) {
			bookModel.setProductId(book.getProductId());
			bookModel.setUserId(book.getUserId());
			bookModel.setTime(book.getTime());
			bookMapper.updateOne(bookModel);
		} else {
			bookMapper.saveOne(bookModel);
		}
	}

	@Transactional(rollbackFor = Exception.class)
	public void saveOrder(OrderCartDto orderCartDto) throws Exception {
		List<String> cartIdArr = Arrays.asList(orderCartDto.getCartIds().split("~"));

		if (cartIdArr.isEmpty() || orderCartDto.getCartIds() == null || orderCartDto.getCartIds().isEmpty()) {
			return;
		}

		String userId = accountUtil.getUser().getUserId();

		for (String cartId : cartIdArr) {
			CartModel cartModel = cartService.getOne(cartId);
			saveBooks(orderCartDto, cartModel, userId);
			
			updateInventory(cartModel);
		}
		
		for (String cartId : cartIdArr) {
			cartService.deleteCartById(cartId);
		}
	}

	private void updateInventory(CartModel cartModel) throws Exception {
		ProductModel productModel = productService.getProduct(cartModel.getProductId());
		productModel.setInventory(productModel.getInventory() - cartModel.getAmount());
		productService.saveOrUpdateProduct(productModel);
	}

	private void saveBooks(OrderCartDto orderCartDto, CartModel cartModel, String userId) throws Exception {
		BookModel bookModel = new BookModel();
		bookModel.setUserId(userId);
		bookModel.setAddress(orderCartDto.getAddress());
		bookModel.setPaymentMethods(orderCartDto.getPaymentMethod());
		bookModel.setNote(orderCartDto.getNote());
		bookModel.setPhone(orderCartDto.getPhone());
		bookModel.setProductId(cartModel.getProductId());
		bookModel.setTime(new Timestamp(System.currentTimeMillis()));
		bookModel.setAmount(cartModel.getAmount());

		ProductModel productModel = productService.getProduct(cartModel.getProductId());
		bookModel.setPrice(productModel.getPrice());

		long total = cartModel.getAmount() * productModel.getPrice();
		bookModel.setTotal(total);

		bookMapper.saveBookByOrder(bookModel);
	}

	@Transactional
	public void deleteOne(String productId, String userId, Timestamp time) {
		Map<String, Object> params = new HashMap<>();
		params.put("productId", productId);
		params.put("userId",userId);
		params.put("time", time);
		bookMapper.deleteOne(params);
		
	}
	public List<BookTableModel> searchBookTable(String condition) throws Exception {
		return bookMapper.searchBookTable(condition);
	}

	public List<ProductInCartDto> getPurchasedProduct() throws Exception {
		List<BookModel> bookModels = bookMapper.getByUserId(accountUtil.getUser().getUserId());
		
		List<ProductInCartDto> productInCartDtos = new ArrayList<>();
		
		for(BookModel bookModel : bookModels) {
			ProductInCartDto productInCartDto = new ProductInCartDto();
			
			ProductModel productModel = productService.getProduct(bookModel.getProductId());
			BeanUtils.copyProperties(productModel, productInCartDto);
			
			productInCartDto.setAmount(bookModel.getAmount());
			productInCartDto.setPrice(bookModel.getPrice());
			productInCartDto.setPrices(bookModel.getTotal());
			
			productInCartDtos.add(productInCartDto);
		}
		
		return productInCartDtos;
	}

}
