package com.luckylas.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luckylas.crm.entity.Contact;
import com.luckylas.crm.entity.ContactExample;
import com.luckylas.crm.entity.Customer;
import com.luckylas.crm.mapper.ContactMapper;

/**
 * 客户联系人Service
 * @author luckyliuqs
 *
 */
@Service
public class ContactService {
	@Autowired 
	private ContactMapper mapper;
	
	/**
	 * 新增一条客户联系人信息
	 * @param contact
	 * @return
	 */
	public int addContact(Contact contact) {
		return mapper.insertSelective(contact);
	}
	
	/**
	 * 查询指定客户id的客户所有联系人
	 * @param cusId
	 * @return
	 */
	public List<Contact> listConByCusId(int cusId){
		ContactExample example = new ContactExample();
		example.or().andCusIdEqualTo(cusId);
		return mapper.selectByExample(example);
	}
	
	/**
	 * 根据联系人id查询对应的联系人信息
	 * @param cusId
	 * @return
	 */
	public Contact getContactById(int conId){
		return mapper.selectByPrimaryKey(conId);
	}
	
	/**
	 * 更新指定客户信息
	 * @param cus
	 * @return
	 */
	public int updateCon(Contact contact) {
		return mapper.updateByPrimaryKeySelective(contact);
	}
	
	/**
	 * 添加联系人
	 * @param contact
	 * @return
	 */
	public int addCon(Contact contact) {
		return mapper.insert(contact);
	}
}
