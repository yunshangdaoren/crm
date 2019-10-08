package com.luckylas.crm.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luckylas.crm.entity.Contact;
import com.luckylas.crm.entity.Customer;
import com.luckylas.crm.entity.SaleChance;
import com.luckylas.crm.entity.SalePlan;
import com.luckylas.crm.entity.SalePlanExample;
import com.luckylas.crm.mapper.SalePlanMapper;

/**
 * 销售计划Service
 * @author luckyliuqs
 *
 */
@Service
public class SalePlanService {
	@Autowired
	private SalePlanMapper spMapper;
	@Autowired
	private SaleChanceService scService;
	@Autowired
	private CustomerService cusService;
	@Autowired
	private ContactService contactService;
	
	/**
	 * 添加销售计划
	 * @return
	 */
	public int addSP(SalePlan sp, int scId) {	
		//修改该销售机会状态为2-正在开发中
		SaleChance saleChance = scService.getSCById(Integer.valueOf(scId));
		saleChance.setScStatus(2);
		scService.updateSC(saleChance);
		return spMapper.insertSelective(sp);
	}
	
	/**
	 * 查询指定销售机会id的销售计划
	 * @param scId
	 * @return
	 */
	public List<SalePlan> getSPBySCId(int scId) {
		SalePlanExample example = new SalePlanExample();
		example.or().andSpScidEqualTo(scId);
		return spMapper.selectByExample(example);
	}
	
	/**
	 * 返回指定id的销售计划
	 * @param spId
	 * @return
	 */
	public SalePlan getSPBySPId(int spId) {
		return spMapper.selectByPrimaryKey(spId);
	}
	
	/**
	 * 查询指定用户的所有正在开发的销售计划
	 * @param uId
	 * @return
	 */
	public List<SalePlan> listDevelopSP(int uId){
		List<SalePlan> spList = new ArrayList<SalePlan>();
		//1.查询出指定id用户所有正在开发中的销售机会
		List<SaleChance> listDevelopSC = scService.listMyPlanSC(uId);
		if (listDevelopSC.size() == 0) {
			return null;
		}
		//2.查询出所有开发中的销售机会对应的所有销售计划
		for (SaleChance sc : listDevelopSC) {
			int scId = sc.getScId();
			spList.add(getSPBySCId(scId).get(0));
		}
		return spList;
	}
	
	/**
	 * 查询指定用户的所有开发失败的销售计划
	 * @param uId
	 * @return
	 */
	public List<SalePlan> listFailSP(int uId){
		List<SalePlan> spList = new ArrayList<SalePlan>();
		//1.查询出指定id用户所有开发失败的销售机会
		List<SaleChance> listFailSC = scService.listMyFailSC(uId);
		if (listFailSC.size() == 0) {
			return null;
		}
		//2.查询出所有开发中的销售机会对应的所有销售计划
		for (SaleChance sc : listFailSC) {
			int scId = sc.getScId();
			spList.add(getSPBySCId(scId).get(0));
		}
		return spList;
	}
	
	/**
	 * 查询指定用户的所有正在开发的销售计划
	 * @param uId
	 * @return
	 */
	public List<SalePlan> listSuccessSP(int uId){
		List<SalePlan> spList = new ArrayList<SalePlan>();
		//1.查询出指定id用户所有开发成功的销售机会
		List<SaleChance> listSuccessSC = scService.listMySuccessSC(uId);
		if (listSuccessSC.size() == 0) {
			return null;
		}
		//2.查询出所有开发中的销售机会对应的所有销售计划
		for (SaleChance sc : listSuccessSC) {
			int scId = sc.getScId();
			spList.add(getSPBySCId(scId).get(0));
		}
		return spList;
	}
	
	/**
	 * 将指定id的销售计划和对应的销售机会状态置为开发失败
	 * @param spId
	 * @return
	 */
	public int failSP(int spId) {
		SalePlan sp = getSPBySPId(spId);
		sp.setSpStatus(1); //状态为开发失败
		int row = spMapper.updateByPrimaryKeySelective(sp);
		//修改该销售计划对应的销售机会的状态为开发成功
		SaleChance sc = scService.getSCById(sp.getSpScid());
		sc.setScStatus(3);  //状态为开发失败
		scService.updateSC(sc);
		return row;
	}
	
	/**
	 * 将指定id的销售计划和对应的销售机会状态置为开发成功，
	 * 并生成一条对应的客户信息和客户联系人信息
	 * @param spId
	 * @return
	 */
	public int successSP(int spId) {
		SalePlan sp = getSPBySPId(spId);
		//修改该销售计划状态为开发成功
		sp.setSpStatus(2);  //状态为开发成功
		int row = spMapper.updateByPrimaryKeySelective(sp);
		//修改该销售计划对应的销售机会的状态为开发成功
		SaleChance sc = scService.getSCById(sp.getSpScid());
		sc.setScStatus(4);  //状态为开发成功
		scService.updateSC(sc);
		//生成一条对应的客户信息
		Customer customer = new Customer();
		customer.setCusName(sc.getScCusname());
		customer.setCusCreatetime(new Date());
		cusService.addCus(customer);
		//生成一条对应的客户联系人信息
		Customer cus = cusService.getCusByName(sc.getScCusname()).get(0);
		Contact contact = new Contact();
		contact.setConName(sc.getScConname());
		contact.setConPhone(sc.getScConphone());
		contact.setCusId(cus.getCusId());
		contact.setConCreatetime(new Date());
		contactService.addContact(contact);
		return row;
	}
	
	/**
	 * 获取所有用户所有正在开发中的销售计划信息
	 * @return
	 */
	public List<SalePlan> listAllDevelopSP(){
		SalePlanExample example = new SalePlanExample();
		example.or().andSpStatusEqualTo(0);
		return spMapper.selectByExample(example);
	}
	
	/**
	 * 获取所有用户所有开发失败的销售计划信息
	 * @return
	 */
	public List<SalePlan> listAllFailSP(){
		SalePlanExample example = new SalePlanExample();
		example.or().andSpStatusEqualTo(1);
		return spMapper.selectByExample(example);
	}
	
	/**
	 * 获取所有用户所有开发成功的销售计划信息
	 * @return
	 */
	public List<SalePlan> listAllSuccessSP(){
		SalePlanExample example = new SalePlanExample();
		example.or().andSpStatusEqualTo(2);
		return spMapper.selectByExample(example);
	}
	
}
