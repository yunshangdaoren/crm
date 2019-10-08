package com.luckylas.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luckylas.crm.entity.User;
import com.luckylas.crm.entity.UserExample;
import com.luckylas.crm.mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	private UserMapper mapper;
	
	/**
	 * 根据指定用户角色id的所有用户
	 * @param rId
	 * @return
	 */
	public List<User> getAllUserByRoleId(int rId){
		UserExample example = new UserExample();
		example.or().andURoleidEqualTo(rId);
		return mapper.selectByExample(example);
	}
	
	/**
	 * 根据指定用户id查询该用户信息
	 * @param uId
	 * @return
	 */
	public User getUserById(int uId) {
		return mapper.selectByPrimaryKey(uId);
	}
	
	
}
