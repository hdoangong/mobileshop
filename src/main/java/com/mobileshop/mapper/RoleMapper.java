package com.mobileshop.mapper;


import java.util.List;

import com.mobileshop.model.RoleModel;


public interface RoleMapper {
	public List<RoleModel> getAll() throws Exception;

	public RoleModel getOne(int roleId) throws Exception;
}
