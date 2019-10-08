package com.luckylas.crm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luckylas.crm.entity.SaleChance;
import com.luckylas.crm.entity.User;
import com.luckylas.crm.service.SaleChanceService;
import com.luckylas.crm.service.UserService;

/**
 * 销售机会Controller类
 * @author luckyliuqs
 *
 */
@Controller
@RequestMapping("saleChance")
public class SaleChanceController {
	@Autowired
	private SaleChanceService scService;
	@Autowired 
	private UserService uService;
	
	/**
	 * 查询出所有还未被分配的销售机会信息
	 * @param map
	 * @param request
	 * @return
	 */
	@RequestMapping("listNotDisSC.do")
	public String listNotDisSC(ModelMap map, HttpServletRequest request) {
		List<SaleChance> notDisSCList = scService.listNotDisSC();
		map.put("notDisSCList", notDisSCList);
		HttpSession session = request.getSession();
		//登录用户信息
		map.put("loginUser", session.getAttribute("loginUser"));
		return "jsp/sc/listNotDisSC";
	}
	
	/**
	 * 查询出所有已经分配但未开发的销售机会
	 * @param map
	 * @return
	 */
	@RequestMapping("listDisNotPlanSC.do")
	public String listDisNotPlanSC(ModelMap map) {
		PageHelper.startPage(0,10);
		List<SaleChance> listDisNotPlanSC = scService.listDisNotPlanSC();
		PageInfo<SaleChance> pageInfo = new PageInfo<>(listDisNotPlanSC);
		map.put("pageInfo", pageInfo);
		return "jsp/sc/listDisNotPlanSC";
	}
	
	/**
	 * 查询出所有已经分配且正在开发的销售机会
	 * @param map
	 * @return
	 */
	@RequestMapping("listDisAndPlanSC.do")
	public String listDisAndPlanSC(ModelMap map) {
		List<SaleChance> listDisAndPlanSC = scService.listDisAndPlanSC();
		map.put("listDisAndPlanSC", listDisAndPlanSC);
		return "jsp/sc/listDisAndPlanSC";
	}
	
	/**
	 * 查询出所有开发成功的销售机会
	 * @param map
	 * @return
	 */
	@RequestMapping("listSuccessSC.do")
	public String listSuccessSC(ModelMap map) {
		List<SaleChance> listSuccessSC = scService.listSuccessSC();
		map.put("listSuccessSC", listSuccessSC);
		return "jsp/sc/listSuccessSC";
	}
	
	/**
	 * 查询出所有开发失败的销售机会
	 * @param map
	 * @return
	 */
	@RequestMapping("listFailSC.do")
	public String listFailSC(ModelMap map) {
		List<SaleChance> listFailSC = scService.listFailSC();
		map.put("listFailSC", listFailSC);
		return "jsp/sc/listFailSC";
	}
	
	/**
	 * 通过ajax请求查询并返回指定id的销售机会JSON格式数据
	 * @param scId
	 * @return
	 */
	@RequestMapping("ajaxSC.do")
	@ResponseBody
	public SaleChance ajaxSC(int scId) {
		return scService.getSCById(scId);
	}

	/**
	 * 通过ajax请求查询并返回指定id的销售机会JSON格式数据
	 * 需要校验用户权限：只有营销主管和创建该销售机会的客户经理才能查询
	 * @param scId
	 * @return
	 */
	@RequestMapping("ajaxToShowEditSC.do")
	@ResponseBody
	public String ajaxToShowEditSC(HttpServletRequest request, int scId) {
		Map<String, Object> map = new HashMap<>();
		User user = (User) request.getSession().getAttribute("loginUser");
		SaleChance saleChance = scService.getSCById(scId);
		if (user.getuId() == saleChance.getScCreateuid() || user.getuRoleid() == 2) {
			//如果为营销主管和创建该销售机会的客户经理，则将该销售机会信息返回
			map.put("status", "1");
			map.put("sc", saleChance);
			return JSON.toJSONString(map);
		}else {
			//返回没有权限信息
			map.put("status", "0");
			map.put("message", "没有权限");
			return JSON.toJSONString(map);
		}
	}
	
	/**
	 * 查询出指定id用户所有被分配但未开发的销售机会
	 * @param map
	 * @param uId
	 * @return
	 */
	@RequestMapping("listMyNotPlanSC.do")
	public String listMyDisSC(HttpServletRequest request, ModelMap map) {
		User user = (User) request.getSession().getAttribute("loginUser");
		List<SaleChance> listMyDisSC = scService.listMyDisSC(user.getuId());
		map.put("listMyDisSC", listMyDisSC);
		return "jsp/sc/listMyNotPlanSC";
	}
	
	/**
	 * 查询出指定id用户所有被分配且正在开发的销售机会
	 * @param map
	 * @param uId
	 * @return
	 */
	@RequestMapping("listMyPlanSC.do")
	public String listMyPlanSC(HttpServletRequest request, ModelMap map) {
		User user = (User) request.getSession().getAttribute("loginUser");
		List<SaleChance> listMyPlanSC = scService.listMyPlanSC(user.getuId());
		map.put("listMyPlanSC", listMyPlanSC);
		return "jsp/sc/listMyPlanSC";
	}
	
	/**
	 * 查询出指定id用户所有被分配且开发成功的销售机会
	 * @param map
	 * @param uId
	 * @return
	 */
	@RequestMapping("listMySuccessSC.do")
	public String listMySuccessSC(HttpServletRequest request, ModelMap map) {
		User user = (User) request.getSession().getAttribute("loginUser");
		List<SaleChance> listMySuccessSC = scService.listMySuccessSC(user.getuId());
		map.put("listMySuccessSC", listMySuccessSC);
		return "jsp/sc/listMySuccessSC";
	}
	
	/**
	 * 查询出指定id用户所有被分配且开发失败的销售机会
	 * @param map
	 * @param uId
	 * @return
	 */
	@RequestMapping("listMyFailSC.do")
	public String listMyFailSC(HttpServletRequest request, ModelMap map) {
		User user = (User) request.getSession().getAttribute("loginUser");
		List<SaleChance> listMyFailSC = scService.listMyFailSC(user.getuId());
		map.put("listMyFailSC", listMyFailSC);
		return "jsp/sc/listMyFailSC";
	}
	
	/**
	 * 分配销售机会给指定id的用户
	 * @param scId 销售机会Id
	 * @param uId 客户经理Id
	 * @return 0-表示失败，1-表示成功
	 */
	@RequestMapping("ajaxDisSC.do")
	@ResponseBody
	public String ajaxDisSC(int scId, int uId) {
		Map<String, String> map = new HashMap<String, String>();
		int row = scService.disSC(scId, uId);
		if (row==0) {
			map.put("status", "0");
			map.put("message", "分配失败！");
		}else {
			map.put("status", "1");
			map.put("message", "分配成功！");
		}
		return JSON.toJSONString(map);
	}
	
	@RequestMapping("toAddSC.do")
	public String toAddSC() {
		return "jsp/sc/addSC";
	}
	
	/**
	 * 添加销售机会
	 * @param saleChance
	 * @param map
	 * @param request
	 * @return
	 */
	@RequestMapping("addSC.do")
	public String addSC(SaleChance saleChance, ModelMap map, HttpServletRequest request) {
		saleChance.setScCreatetime(new Date());
		User user = (User) request.getSession().getAttribute("loginUser");
		saleChance.setScCreateuname(user.getuName());
		saleChance.setScCreateuid(user.getuId());
		saleChance.setScStatus(0);
		int row = scService.addSC(saleChance);
		if (row == 0) {
			map.addAttribute("msg_insertFail", "插入失败！");
			return "jsp/sc/addSC";
		}else if(row == -1) {
			map.addAttribute("msg_insertFail", "该销售信息已存在！");
			return "jsp/sc/addSC";
		}
		return "redirect:/saleChance/listNotDisSC.do";
	}
	
	/**
	 * 获取到指定id用户的所有正在开发的销售机会
	 * @return
	 */
	@RequestMapping("listAllSCPlan.do")
	public String listSCPlanById(ModelMap map, int uId){
		List<SaleChance> listAllSCPlan = scService.listAllSCPlanById(uId);
		map.put("listAllSCPlan", listAllSCPlan);
		return "";
	}
	
	/**
	 * 删除指定id的销售机会
	 * 需要判断当前登录用户为该销售机会的创建人，否则是不可以删除的。
	 * @param scId 销售机会id
	 * @return 返回JSON格式的字符串，status值：0-表示删除失败，1-表示成功
	 */
	@RequestMapping("delSc.do")
	@ResponseBody
	public String delScById(int scId, HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		User user = (User) request.getSession().getAttribute("loginUser");
		int uId = user.getuId();
		int sCreateUId = scService.getSCById(scId).getScCreateuid();
		if (uId != sCreateUId && user.getuRoleid() != 2) {
			map.put("status", "0");
			map.put("message", "没有权限！只有创建此销售机会的用户才可以删除！");
			return JSON.toJSONString(map);
		}
		int result = scService.delSCById(scId);
		if (result == 0) {
			map.put("status", "0");
			map.put("message", "删除失败，请稍后再试！");
			return JSON.toJSONString(map);
		}
		map.put("status", "1");
		map.put("message", "删除成功！");
		return JSON.toJSONString(map);
	}
	
	/**
	 * 修改指定销售机会信息
	 * @param scId
	 * @param uId
	 * @return
	 */
	@RequestMapping("ajaxUpdateSC.do")
	@ResponseBody
	public String ajaxUpdateSC(SaleChance saleChance) {
		Map<String, String> map = new HashMap<String, String>();
		int row = scService.updateSC(saleChance);
		if (row==0) {
			map.put("status", "0");
			map.put("message", "修改失败！");
		}else {
			map.put("status", "1");
			map.put("message", "修改成功！");
		}
		return JSON.toJSONString(map);
	}
	
	
}
