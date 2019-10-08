package com.luckylas.crm.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luckylas.crm.entity.Customer;
import com.luckylas.crm.entity.CustomerExample;
import com.luckylas.crm.entity.SaleChance;
import com.luckylas.crm.entity.User;
import com.luckylas.crm.mapper.CustomerMapper;

/**
 * 客户Service类
 * @author luckyliuqs
 *
 */
@Service
public class CustomerService {
	@Autowired
	private CustomerMapper cusMapper;
	@Autowired
	private SaleChanceService scService;
	
	/**
	 * 根据传入的客户信息，新增一条客户信息
	 * @param cus
	 * @return
	 */
	public int addCus(Customer customer) {
		return cusMapper.insert(customer);
	}
	
	/**
	 * 更新指定客户信息
	 * @param cus
	 * @return
	 */
	public int updateCus(Customer cus) {
		return cusMapper.updateByPrimaryKeySelective(cus);
	}
	
	/**
	 * 查询指定客户id的客户信息
	 * @return
	 */
	public Customer getCusById(int cusId) {
		return cusMapper.selectByPrimaryKey(cusId);
	}
	
	/**
	 * 查询指定客户名称的客户信息
	 * @param cusName
	 * @return
	 */
	public List<Customer> getCusByName(String cusName) {
		CustomerExample example = new CustomerExample();
		example.or().andCusNameEqualTo(cusName);
		return cusMapper.selectByExample(example);
	}
	/**
	 * 查询出所有客户信息
	 * @return
	 */
	public List<Customer> listAllCus(){
		CustomerExample example = new CustomerExample();
		example.or().andCusIdIsNotNull();
		return cusMapper.selectByExample(example);
	}
	
	/**
	 * 查询出所有用户所有开发成功的客户信息
	 * @return
	 */
	public List<Customer> listAllSuccessCus(){
		List<Customer> cusList = new ArrayList<Customer>();
		//查询出所有开发成功的销售机会
		List<SaleChance> scSuccessList = scService.listSuccessSC();
		//查询出每个销售机会对应的客户信息
		for (SaleChance sc : scSuccessList) {
			String cusName = sc.getScCusname();
			CustomerExample example = new CustomerExample();
			example.or().andCusNameEqualTo(cusName);
			cusList.add(cusMapper.selectByExample(example).get(0));
		}
		return cusList;
	}
	
	/**
	 * 查询出所有用户所有开发失败的客户信息
	 * @return
	 */
	public List<Customer> listAllFailCus(){
		List<Customer> cusList = new ArrayList<Customer>();
		//查询出所有开发成功的销售机会
		List<SaleChance> scFailList = scService.listFailSC();
		//查询出每个销售机会对应的客户信息
		for (SaleChance sc : scFailList) {
			String cusName = sc.getScCusname();
			CustomerExample example = new CustomerExample();
			example.or().andCusNameEqualTo(cusName);
			cusList.add(cusMapper.selectByExample(example).get(0));
		}
		return cusList;
	}
	
	/**
	 * 查询出指定用户所有开发成功的客户信息
	 * @return
	 */
	public List<Customer> listMySuccessCus(int uId){
		List<Customer> listMySuccessCus = new ArrayList<Customer>();
		//查询出指定用户所有开发成功的销售机会
		List<SaleChance> scSuccessList = scService.listSuccessSC(uId);
		//查询出每个销售机会对应的客户信息
		for (SaleChance sc : scSuccessList) {
			String cusName = sc.getScCusname();
			CustomerExample example = new CustomerExample();
			example.or().andCusNameEqualTo(cusName);
			listMySuccessCus.add(cusMapper.selectByExample(example).get(0));
		}
		return listMySuccessCus;
	}
	
	/**
	 * 查询出指定用户所有开发失败的客户信息
	 * @return
	 */
	public List<Customer> listMyFailCus(int uId){
		List<Customer> listMyFailCus = new ArrayList<Customer>();
		//查询出所有开发成功的销售机会
		List<SaleChance> scFailList = scService.listFailSC(uId);
		//查询出每个销售机会对应的客户信息
		for (SaleChance sc : scFailList) {
			String cusName = sc.getScCusname();
			CustomerExample example = new CustomerExample();
			example.or().andCusNameEqualTo(cusName);
			listMyFailCus.add(cusMapper.selectByExample(example).get(0));
		}
		return listMyFailCus;
	}
	
}
