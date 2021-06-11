package com.mobileshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mobileshop.dto.SearchDto;
import com.mobileshop.mapper.ProductMapper;
import com.mobileshop.model.ManufacturerModel;
import com.mobileshop.model.ProductModel;

@Service
public class ProductService {
	@Autowired
	ProductMapper productMapper;
	
	@Autowired
	ManufacturerService manufacturerService;

	public List<ProductModel> getAll() throws Exception {
		return productMapper.getAll();
	}

	public ProductModel getProduct(String id) throws Exception {
		return productMapper.getProduct(id);
	}

	public List<ProductModel> selectNewList() throws Exception {
		List<ProductModel> productNewList = productMapper.selectNewList();
		return productNewList;
	}

	public List<ProductModel> selectTopList() throws Exception {
		List<ProductModel> productModelHot = productMapper.selectTopList();
		
		return productModelHot;
	}
	public List<ProductModel> selectManufacturerList(int id) throws Exception {
		List<ProductModel> productManufacturerList = productMapper.selectManufacturerList(id);
		return productManufacturerList;
	}

	@Transactional(rollbackFor = Exception.class)
	public void saveOrUpdateProduct(ProductModel productModel) throws Exception {
		if (productModel.getProductId() == null) {
			System.out.println("ERROR: Miss Product PK");
			throw new Exception();
		}
		
		String url = productModel.getUrlImg();
		if (url != null && !url.isEmpty()) {
			productModel.setAvatar(url.split("~")[0]);
		} else {
			productModel.setAvatar("");
		}
		
		ManufacturerModel manufacturerModel = manufacturerService.getById(productModel.getManufacturer());
		productModel.setManufacturerName(manufacturerModel.getName());
		
		ProductModel product = this.getProduct(productModel.getProductId());

		// get roleName => set for position in user table

		if (product != null) {
			productMapper.updateOne(productModel);
		} else {
			productMapper.saveOne(productModel);
		}
	}

	@Transactional
	public void deleteOne(String id) throws Exception {
		productMapper.deleteOne(id);
	}

	public List<ProductModel> search(String condition) throws Exception {
		return productMapper.search(condition);
	}

	public List<ProductModel> searchAtHome(SearchDto searchDto) throws Exception{
		
		return productMapper.searchAtHome(searchDto);
	}
	public List<ProductModel> getProductsInStock() throws Exception{
		
		return productMapper.getProductsInStock();
	}

}
