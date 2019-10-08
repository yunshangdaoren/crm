package com.luckylas.crm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.luckylas.crm.entity.SalePlan;
import com.luckylas.crm.entity.SalePlanExe;
import com.luckylas.crm.entity.User;
import com.luckylas.crm.service.SalePlanExeService;
import com.luckylas.crm.service.SalePlanService;

/**
 * 销售计划Controller
 * @author luckyliuqs
 * 
 */
@Controller
@RequestMapping("salePlan")
public class SalePlanController {
	@Autowired 
	private SalePlanService spService;
	@Autowired
	private SalePlanExeService speService;
	
	/**
	 * 添加销售计划
	 * @return
	 */
	@RequestMapping("addSP.do")
	@ResponseBody
	public String addSP(HttpServletRequest request) {
		String scId = request.getParameter("spScid");
		SalePlan sp = new SalePlan();
		sp.setSpCreatetime(new Date());
		sp.setSpBegintime((request.getParameter("spBegintime")));
		sp.setSpContent(request.getParameter("spContent"));
		sp.setSpScid(Integer.valueOf(scId));
		sp.setSpStatus(0);
		int row = spService.addSP(sp, Integer.valueOf(scId));
		Map<String, String> map = new HashMap<>();
		if (row == 0) {
			map.put("status", "0");
			map.put("message", "制定计划失败!");
		}else {
			map.put("status", "1");
			map.put("message", "制定计划成功!");
		}
		return JSON.toJSONString(map);
	}
	
	/**
	 * 查询指定销售机会id的销售计划信息
	 * @param scId
	 * @return
	 */
	@RequestMapping("getSPBySCId.do")
	public String ajaxGetSPBySCId(int scId, ModelMap map) {
		//销售计划详情
		List<SalePlan> spList = spService.getSPBySCId(scId);
		if (spList.size() == 0) {
			return null;
		}
		//计划计划执行详情
		List<SalePlanExe> speList = speService.getSPE(spList.get(0).getSpId());
		map.put("salePlan", spList.get(0));
		map.put("salePlanExeList", speList);
		return "jsp/sp/detailMySP";
	}
	
	/**
	 * 查询指定销售计划id的销售计划信息
	 * @param spId
	 * @return
	 */
	@RequestMapping("getSPBySPId.do")
	public String getSPBySPId(int spId, ModelMap map) {
		SalePlan salePlan = spService.getSPBySPId(spId);
		List<SalePlanExe> speList = speService.getSPE(salePlan.getSpId());
		map.put("salePlan", salePlan);
		map.put("salePlanExeList", speList);
		return "jsp/sp/detailMySP";
	}
	
	/**
	 * 请求用户所有正在开发中的销售计划信息页面
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("listMyDevelopSP.do")
	public String listMyDevelopSP(HttpServletRequest request, ModelMap map) {
		User user = (User) request.getSession().getAttribute("loginUser");
		List<SalePlan> listMyDevelopSP = spService.listDevelopSP(user.getuId());
		map.put("listMyDevelopSP", listMyDevelopSP);
		return "jsp/sp/listMyDevelopSP";
	}
	
	/**
	 * 请求用户所有开发失败的销售计划信息页面
	 * @return
	 */
	@RequestMapping("listMyFailSP.do")
	public String listMyFailSP(HttpServletRequest request, ModelMap map) {
		User user = (User) request.getSession().getAttribute("loginUser");
		List<SalePlan> listMyFailSP = spService.listFailSP(user.getuId());
		map.put("listMyFailSP", listMyFailSP);
		return "jsp/sp/listMyFailSP";
	}
	
	/**
	 * 请求用户所有开发成功的销售计划信息页面
	 * @return
	 */
	@RequestMapping("listMySuccessSP.do")
	public String listMySeccessSP(HttpServletRequest request, ModelMap map) {
		User user = (User) request.getSession().getAttribute("loginUser");
		List<SalePlan> listMySuccessSP = spService.listSuccessSP(user.getuId());
		map.put("listMySuccessSP", listMySuccessSP);
		return "jsp/sp/listMySuccessSP";
	}
	
	/**
	 * ajax请求将指定id的销售计划和对应的销售机会状态置为开发失败
	 * @param spId
	 * @return
	 */
	@RequestMapping("adjaxFailSP.do")
	@ResponseBody
	public String adjaxFailSP(int spId) {
		int row = spService.failSP(spId);
		Map<String, String> map = new HashMap<String, String>();
		if (row == 0) {
			map.put("status", "0");
			map.put("message", "操作失败!");
		}else {
			map.put("status", "1");
			map.put("message", "操作成功!");
		}
		return JSON.toJSONString(map);
	}
	
	/**
	 * ajax请求将指定id的销售计划和对应的销售机会状态置为开发成功
	 * 并生成一条对应的客户信息和客户联系人信息
	 * @param spId
	 * @return
	 */
	@RequestMapping("ajaxSuccessSP.do")
	@ResponseBody
	public String adjaxSuccessSP(int spId) {
		int row = spService.successSP(spId);
		Map<String, String> map = new HashMap<String, String>();
		if (row == 0) {
			map.put("status", "0");
			map.put("message", "操作失败!");
		}else {
			map.put("status", "1");
			map.put("message", "操作成功!");
		}
		return JSON.toJSONString(map);
	}
	
	/**
	 * 请求获取所有正在开发中的销售计划信息页面
	 * @return
	 */
	@RequestMapping("listAllDevelopSP.do")
	public String listAllDevelopSP(ModelMap map) {
		List<SalePlan> listAllDevelopSP = spService.listAllDevelopSP();
		map.put("listAllDevelopSP", listAllDevelopSP);
		return "jsp/sp/listAllDevelopSP";
	}
	
	/**
	 * 请求获取所有开发失败的销售计划信息页面
	 * @return
	 */
	@RequestMapping("listAllFailSP.do")
	public String listAllFailSP(ModelMap map) {
		List<SalePlan> listAllFailSP = spService.listAllFailSP();
		map.put("listAllFailSP", listAllFailSP);
		return "jsp/sp/listAllFailSP";
	}
	
	/**
	 * 请求获取所有开发成功的销售计划信息页面
	 * @return
	 */
	@RequestMapping("listAllSuccessSP.do")
	public String listAllSuccessSP(ModelMap map) {
		List<SalePlan> listAllSuccessSP = spService.listAllSuccessSP();
		map.put("listAllSuccessSP", listAllSuccessSP);
		return "jsp/sp/listAllSuccessSP";
	}
	
}
