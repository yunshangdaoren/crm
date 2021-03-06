package com.luckylas.crm.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 客户联系人实体类
 * @author luckyliuqs
 *
 */
public class Contact {
    /**
     * id
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.con_id
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    private Integer conId;

    /**
     * 联系人姓名
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.con_name
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    private String conName;

    /**
     * 联系人电话
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.con_phone
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    private String conPhone;

    /**
     * 联系人职位
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.con_job
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    private String conJob;

    /**
     * 联系人描述
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.con_desc
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    private String conDesc;

    /**
     * 联系人创建时间
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.con_createTime
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date conCreatetime;

    /**
     * 客户id
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column contact.cus_id
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    private Integer cusId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.con_id
     *
     * @return the value of contact.con_id
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public Integer getConId() {
        return conId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.con_id
     *
     * @param conId the value for contact.con_id
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public void setConId(Integer conId) {
        this.conId = conId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.con_name
     *
     * @return the value of contact.con_name
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public String getConName() {
        return conName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.con_name
     *
     * @param conName the value for contact.con_name
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public void setConName(String conName) {
        this.conName = conName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.con_phone
     *
     * @return the value of contact.con_phone
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public String getConPhone() {
        return conPhone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.con_phone
     *
     * @param conPhone the value for contact.con_phone
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public void setConPhone(String conPhone) {
        this.conPhone = conPhone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.con_job
     *
     * @return the value of contact.con_job
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public String getConJob() {
        return conJob;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.con_job
     *
     * @param conJob the value for contact.con_job
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public void setConJob(String conJob) {
        this.conJob = conJob;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.con_desc
     *
     * @return the value of contact.con_desc
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public String getConDesc() {
        return conDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.con_desc
     *
     * @param conDesc the value for contact.con_desc
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public void setConDesc(String conDesc) {
        this.conDesc = conDesc;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.con_createTime
     *
     * @return the value of contact.con_createTime
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public Date getConCreatetime() {
        return conCreatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.con_createTime
     *
     * @param conCreatetime the value for contact.con_createTime
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public void setConCreatetime(Date conCreatetime) {
        this.conCreatetime = conCreatetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column contact.cus_id
     *
     * @return the value of contact.cus_id
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public Integer getCusId() {
        return cusId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column contact.cus_id
     *
     * @param cusId the value for contact.cus_id
     *
     * @mbg.generated Fri Oct 04 17:23:44 CST 2019
     */
    public void setCusId(Integer cusId) {
        this.cusId = cusId;
    }

	@Override
	public String toString() {
		return "Contact [conId=" + conId + ", conName=" + conName + ", conPhone=" + conPhone + ", conJob=" + conJob
				+ ", conDesc=" + conDesc + ", conCreatetime=" + conCreatetime + ", cusId=" + cusId + "]";
	}
}