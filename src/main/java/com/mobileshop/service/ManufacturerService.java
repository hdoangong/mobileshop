package com.mobileshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.mapper.ManufacturerMapper;
import com.mobileshop.model.ManufacturerModel;

@Service
public class ManufacturerService {
	@Autowired
	ManufacturerMapper manufacturerMapper;

	public List<ManufacturerModel> getAll() throws Exception{
		return manufacturerMapper.getAll();
	}

	public ManufacturerModel getById(int manufacturer) {
		return manufacturerMapper.getById(manufacturer);
	}
}
