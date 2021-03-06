package com.luckylas.crm.mapper;

import com.luckylas.crm.entity.SalePlan;
import com.luckylas.crm.entity.SalePlanExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SalePlanMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    long countByExample(SalePlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    int deleteByExample(SalePlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    int deleteByPrimaryKey(Integer spId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    int insert(SalePlan record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    int insertSelective(SalePlan record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    List<SalePlan> selectByExample(SalePlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    SalePlan selectByPrimaryKey(Integer spId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    int updateByExampleSelective(@Param("record") SalePlan record, @Param("example") SalePlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    int updateByExample(@Param("record") SalePlan record, @Param("example") SalePlanExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    int updateByPrimaryKeySelective(SalePlan record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sale_plan
     *
     * @mbg.generated Mon Sep 30 11:43:08 CST 2019
     */
    int updateByPrimaryKey(SalePlan record);
}