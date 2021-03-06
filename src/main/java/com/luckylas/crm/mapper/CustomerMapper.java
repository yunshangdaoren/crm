package com.luckylas.crm.mapper;

import com.luckylas.crm.entity.Customer;
import com.luckylas.crm.entity.CustomerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CustomerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    long countByExample(CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    int deleteByExample(CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    int deleteByPrimaryKey(Integer cusId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    int insert(Customer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    int insertSelective(Customer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    List<Customer> selectByExample(CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    Customer selectByPrimaryKey(Integer cusId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    int updateByExampleSelective(@Param("record") Customer record, @Param("example") CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    int updateByExample(@Param("record") Customer record, @Param("example") CustomerExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    int updateByPrimaryKeySelective(Customer record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table customer
     *
     * @mbg.generated Fri Oct 04 17:23:51 CST 2019
     */
    int updateByPrimaryKey(Customer record);
}