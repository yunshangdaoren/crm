package com.luckylas.crm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.luckylas.crm.entity.User;
import com.luckylas.crm.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService service;
	
	/**
	 * @param rId
	 * @return 指定角色id的所有用户
	 */
	@RequestMapping("ajaxAllUserByRoleId.do")
	@ResponseBody
	public List<User> getAllUserByRoleId(int rId){
		return service.getAllUserByRoleId(rId);
	}
	
	/**
	 * @param rId
	 * @return 查询指定用户id的信息
	 */
	@RequestMapping("getUserById.do")
	@ResponseBody
	public User getUserById(int uId){
		return service.getUserById(uId);
	}
	
}
