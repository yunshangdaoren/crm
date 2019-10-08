package com.luckylas.crm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.luckylas.crm.entity.Contact;
import com.luckylas.crm.entity.Customer;
import com.luckylas.crm.entity.SaleChance;
import com.luckylas.crm.service.ContactService;
import com.luckylas.crm.service.CustomerService;
import com.luckylas.crm.service.SaleChanceService;

/**
 * 客户联系人Controller
 * @author luckyliuqs
 */
@Controller
@RequestMapping("contact")
public class ContactController {
	@Autowired
	private ContactService contactService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private SaleChanceService scService;
	
	/**
	 * 请求指定客户id的客户的联系人详情信息页面
	 * @param cusId
	 * @return
	 */
	@RequestMapping("detailCusContact.do")
	public String detailCusContact(int cusId, ModelMap map) {
		//客户详情
		Customer customer = customerService.getCusById(cusId);
		//查询该客户对应的销售机会
		SaleChance sc = scService.getSCByCusname(customer.getCusName()).get(0);
		//该销售机会的状态
		int status = sc.getScStatus();
		//客户联系人详情
		List<Contact> contactList = contactService.listConByCusId(cusId);
		map.put("customer", customer);
		map.put("status", status);
		map.put("contactList", contactList);
		return "jsp/cus/detailCusContact";
	}
	
	/**
	 * 通过ajax请求获取指定id的客户联系人信息
	 * @param conId
	 * @return
	 */
	@RequestMapping("adjaxContactById.do")
	@ResponseBody
	public Contact adjaxContactById(int conId) {
		return contactService.getContactById(conId);
	}
	
	/**
	 * 通过ajax请求更新指定客户联系人信息
	 * @param contact
	 * @return
	 */
	@RequestMapping("adjaxUpdateCon.do")
	@ResponseBody
	public String adjaxUpdateCon(Contact contact) {
		int status = contactService.updateCon(contact);
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
	
	/**
	 * 通过adjax请求添加联系人信息
	 * @param contact
	 * @return
	 */
	@RequestMapping("adjaxAddCon.do")
	@ResponseBody
	public String adjaxAddCon(Contact contact) {
		contact.setConCreatetime(new Date());
		int status = contactService.addCon(contact);
		Map<String, String> map = new HashMap<String, String>();
		if (status == 0) {
			map.put("status", "0");
			map.put("message", "添加失败");
		}else {
			map.put("status", "1");
			map.put("message", "添加成功");
		}
		return JSON.toJSONString(map);
	}
	
	
	
}
