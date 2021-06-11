package com.mobileshop.mapper;

import java.util.List;

import com.mobileshop.model.ManufacturerModel;

public interface ManufacturerMapper {

	public List<ManufacturerModel> getAll() throws Exception;

	public ManufacturerModel getById(int manufacturer);

}
