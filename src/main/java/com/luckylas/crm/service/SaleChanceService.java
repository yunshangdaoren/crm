package com.luckylas.crm.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luckylas.crm.entity.SaleChance;
import com.luckylas.crm.entity.SaleChanceExample;
import com.luckylas.crm.entity.User;
import com.luckylas.crm.mapper.SaleChanceMapper;
import com.luckylas.crm.mapper.UserMapper;

/**
 * 销售机会Service
 * @author luckyliuqs
 *
 */
@Service
public class SaleChanceService {
	@Autowired
	private SaleChanceMapper scMapper;
	@Autowired
	private UserService uService;
	
	/**
	 * 所有未被分配的销售机会列表
	 * @return
	 */
	public List<SaleChance> listNotDisSC(){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(0);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询出所有被分配但还未被开发的销售机会列表
	 * @return
	 */
	public List<SaleChance> listDisNotPlanSC(){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(1);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询出所有正在开发的销售机会列表
	 * @return
	 */
	public List<SaleChance> listDisAndPlanSC(){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(2);
		return scMapper.selectByExample(example);
	}

	/**
	 * 查询出所有用户所有开发成功的销售机会列表
	 * @return
	 */
	public List<SaleChance> listSuccessSC(){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(4);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询出指定用户所有开发成功的销售机会列表
	 * @return
	 */
	public List<SaleChance> listSuccessSC(int uId){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(4).andScGiveuidEqualTo(uId);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询出所有用户所有开发失败的销售机会列表
	 * @return
	 */
	public List<SaleChance> listFailSC(){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(3);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询出指定用户所有开发失败的销售机会列表
	 * @return
	 */
	public List<SaleChance> listFailSC(int uId){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(3).andScGiveuidEqualTo(uId);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询出指定id用户所有被分配但还未开发的销售机会
	 * @param uId
	 * @return
	 */
	public List<SaleChance> listMyDisSC(int uId){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(1).andScGiveuidEqualTo(uId);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询出指定id用户所有被分配且正在开发的销售机会
	 * @param uId
	 * @return
	 */
	public List<SaleChance> listMyPlanSC(int uId){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(2).andScGiveuidEqualTo(uId);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询出指定id用户所有开发失败的销售机会
	 * @param uId
	 * @return
	 */
	public List<SaleChance> listMyFailSC(int uId){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(3).andScGiveuidEqualTo(uId);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询出指定id用户所有开发成功的销售机会
	 * @param uId
	 * @return
	 */
	public List<SaleChance> listMySuccessSC(int uId){
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScStatusEqualTo(4).andScGiveuidEqualTo(uId);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 查询指定Id的销售机会信息
	 * @param scId
	 * @return
	 */
	public SaleChance getSCById(int scId) {
		return scMapper.selectByPrimaryKey(scId);
	}
	
	/**
	 * 查询指定名称的销售机会信息
	 * @param scId
	 * @return
	 */
	public List<SaleChance> getSCByCusname(String scCusname) {
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScCusnameEqualTo(scCusname);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 分配指定id的销售机会给指定Id的客户经理
	 * @param scId 销售机会Id
	 * @param uId 客户经理Id
	 * @return 0-表示失败，1-表示成功
	 */
	public int disSC(int scId, int uId) {
		SaleChanceExample example = new SaleChanceExample();
		example.or().andScIdEqualTo(scId);
		SaleChance saleChance = getSCById(scId);
		//如果不存在该id的销售机会，返回0
		if (saleChance == null) {
			return 0;
		}
		//如果不存在该id的用户，返回0
		if (uService.getUserById(uId) == null) {
			return 0;
		}
		saleChance.setScGiveuid(uId);
		saleChance.setScGiveuname(uService.getUserById(uId).getuName());
		saleChance.setScGivetime(new Date());
		saleChance.setScStatus(1);
		return scMapper.updateByPrimaryKeySelective(saleChance);
	}
	/**
	 * 添加销售机会
	 * @param saleChance
	 * @return
	 */
	public int addSC(SaleChance saleChance) {
		String scCusname = saleChance.getScCusname();
		//判断添加的销售机会是否已经在数据库中存在
		if (getSCByCusname(scCusname).size() != 0) {
			return -1;
		}
		return scMapper.insert(saleChance);
	}
	
	/**
	 * 获取到指定id用户的所有正在开发的销售机会
	 * @return
	 */
	public List<SaleChance> listAllSCPlanById(int uId){
		SaleChanceExample example = new SaleChanceExample();
		//销售机会状态为2且分配用户id为该用户id
		example.or().andScStatusEqualTo(2).andScGiveuidEqualTo(uId);
		return scMapper.selectByExample(example);
	}
	
	/**
	 * 删除指定id的销售机会
	 * @param scId
	 * @return 0-表示删除失败，1-表示成功
	 */
	public int delSCById(int scId) {
		return scMapper.deleteByPrimaryKey(scId);
	}
	
	/**
	 * 修改指定销售机会信息
	 * @return
	 */
	public int updateSC(SaleChance saleChance) {
		return scMapper.updateByPrimaryKeySelective(saleChance);
	}
	
	
	
}
