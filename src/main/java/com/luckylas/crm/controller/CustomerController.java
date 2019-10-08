package com.luckylas.crm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.luckylas.crm.entity.Customer;
import com.luckylas.crm.entity.User;
import com.luckylas.crm.service.CustomerService;

/**
 * 客户Controller
 * @author luckyliuqs
 *
 */
@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	private CustomerService cusService;
	
	public int addCus(Customer customer) {
		return 0;
	}
	
	/**
	 * 请求所有用户所有开发成功的用户信息页面
	 * @param map
	 * @return
	 */
	@RequestMapping("listAllSuccessCus.do")
	public String listSuccessCus(ModelMap map) {
		List<Customer> listAllSuccessCus = cusService.listAllSuccessCus();
		map.put("listAllSuccessCus", listAllSuccessCus);
		return "jsp/cus/listAllSuccessCus";
	}
	
	/**
	 * 请求所有用户所有开发失败的用户信息页面
	 * @param map
	 * @return
	 */
	@RequestMapping("listAllFailCus.do")
	public String listFailCus(ModelMap map) {
		List<Customer> listAllFailCus = cusService.listAllFailCus();
		map.put("listAllFailCus", listAllFailCus);
		return "jsp/cus/listAllFailCus";
	}
	
	/**
	 * 请求指定用户所有开发成功的用户信息页面
	 * @param map
	 * @return
	 */
	@RequestMapping("listMySuccessCus.do")
	public String listMySuccessCus(HttpServletRequest request, ModelMap map) {
		//获取登录用户
		User user = (User) request.getSession().getAttribute("loginUser");
		List<Customer> listMySuccessCus = cusService.listMySuccessCus(user.getuId());
		map.put("listMySuccessCus", listMySuccessCus);
		return "jsp/cus/listMySuccessCus";
	}
	
	/**
	 * 请求所有用户所有开发失败的用户信息页面
	 * @param map
	 * @return
	 */
	@RequestMapping("listMyFailCus.do")
	public String listMyFailCus(HttpServletRequest request, ModelMap map) {
		//获取登录用户
		User user = (User) request.getSession().getAttribute("loginUser");
		List<Customer> listMyFailCus = cusService.listMyFailCus(user.getuId());
		map.put("listMyFailCus", listMyFailCus);
		return "jsp/cus/listMyFailCus";
	}
	
	/**
	 * 通过ajax请求获取指定id的客户信息
	 * @return
	 */
	@RequestMapping("adjaxCusById.do")
	@ResponseBody
	public Customer adjaxCusById(int cusId){
		return cusService.getCusById(cusId);
	}
	
	/**
	 * 通过ajax请求更新客户信息
	 * @param customer
	 * @return
	 */
	@RequestMapping("adjaxUpdateCus.do")
	@ResponseBody
	public String adjaxUpdateCus(Customer customer) {
		int status = cusService.updateCus(customer);
		Map<String, String> map = new HashMap<String, String>();
		if (status == 0) {
			map.put("status", "0");
			map.put("message", "修改失败");
		}else {
			map.put("status", "1");
			map.put("message", "修改成功");
		}
		return JSON.toJSONString(map);
	}
	
	
}
