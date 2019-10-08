package com.luckylas.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luckylas.crm.entity.SalePlanExe;
import com.luckylas.crm.entity.SalePlanExeExample;
import com.luckylas.crm.mapper.SalePlanExeMapper;

/**
 * 销售计划执行Service
 * @author luckyliuqs
 *
 */
@Service
public class SalePlanExeService {
	@Autowired
	SalePlanExeMapper mapper;
	
	/**
	 * 插入一条计划执行记录
	 * @param spe
	 * @return
	 */
	public int addSPE(SalePlanExe spe) {
		return mapper.insertSelective(spe);
	}
	
	/**
	 * 查询出指定id的销售计划的所有执行记录信息
	 * @param spId
	 * @return
	 */
	public List<SalePlanExe> getSPE(int spId) {
		SalePlanExeExample example = new SalePlanExeExample();
		example.or().andSpePidEqualTo(spId);
		return mapper.selectByExample(example);
	}
	
	
}
