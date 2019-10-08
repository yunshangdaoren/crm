package com.luckylas.crm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.luckylas.crm.entity.SalePlanExe;
import com.luckylas.crm.service.SalePlanExeService;

/**
 * 销售计划执行记录Controller
 * @author luckyliuqs
 *
 */
@Controller
@RequestMapping("salePlanExe")
public class SalePlanExeController {
	@Autowired
	SalePlanExeService service;
	
	/**
	 * 通过ajax请求添加一个销售计划执行记录信息
	 * @param spe
	 * @return
	 */
	@RequestMapping("ajaxAddSPExe.do")
	@ResponseBody
	public String ajaxAddSPExe(SalePlanExe spe) {
		spe.setSpeCreatetime(new Date());
		Map<String, String> map = new HashMap<String, String>();
		int row = service.addSPE(spe);
		if (row == 0) {
			map.put("status", "0");
			map.put("message", "添加失败！");
		}else {
			map.put("status", "0");
			map.put("message", "添加成功！");
		}
		return JSON.toJSONString(map);
	}
	
	
	@InitBinder
	public void init(WebDataBinder binder) {
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	}
}
