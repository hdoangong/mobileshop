package com.mobileshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobileshop.mapper.RoleMapper;
import com.mobileshop.model.RoleModel;

@Service
public class RoleService {
	@Autowired
	RoleMapper roleMapper;
	
	public List<RoleModel> getAll() throws Exception {
		return roleMapper.getAll();
	}

	public RoleModel getRole(int roleId) throws Exception {
		return roleMapper.getOne(roleId);
	}
	
}
