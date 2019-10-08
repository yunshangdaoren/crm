package com.luckylas.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luckylas.crm.entity.User;
import com.luckylas.crm.entity.UserExample;
import com.luckylas.crm.mapper.UserMapper;

@Service
public class LoginService {
	@Autowired
	private UserMapper userMapper;
	
	public User getUser(String uAccount, String uPassword) {
		UserExample userExample = new UserExample();
		userExample.or().andUAccountEqualTo(uAccount).andUPasswordEqualTo(uPassword);
		List<User> users = userMapper.selectByExample(userExample);
		if (users.size() == 0) {
			return null;
		}
		return users.get(0);
	}
	
	
	
}
