package com.luckylas.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luckylas.crm.entity.Role;
import com.luckylas.crm.entity.RoleExample;
import com.luckylas.crm.mapper.RoleMapper;

/**
 * 用户角色Service
 * @author luckyliuqs
 *
 */
@Service
public class RoleService {
	@Autowired
	private RoleMapper roleMapper;
	
	public List<Role> getAllRole(){
		RoleExample example = new RoleExample();
		return roleMapper.selectByExample(example);
	}
	
	public Role  getRoleById(int rId) {
		return roleMapper.selectByPrimaryKey(rId);
	}
	
}
