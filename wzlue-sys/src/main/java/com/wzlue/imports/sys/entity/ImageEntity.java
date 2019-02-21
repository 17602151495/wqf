package com.wzlue.imports.sys.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 图片表
 * 
 * @author py
 * @email sunlightcs@gmail.com
 * @date 2018-05-28 13:33:27
 */
public class ImageEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//图片名称
	private Integer id;
	//
	private String picName;
	//图片路径
	private String picUrl;
	//类型
	private String picType;
	//备注
	private String remark;
	//创建人
	private String createBy;
	//创建时间
	private Date createDate;
	//排序
	private Integer sort;
	//关联id
	private Integer code;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	/**
	 * 设置：图片名称
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * 获取：图片名称
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * 设置：
	 */
	public void setPicName(String picName) {
		this.picName = picName;
	}
	/**
	 * 获取：
	 */
	public String getPicName() {
		return picName;
	}
	/**
	 * 设置：图片路径
	 */
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	/**
	 * 获取：图片路径
	 */
	public String getPicUrl() {
		return picUrl;
	}
	/**
	 * 设置：类型
	 */
	public void setPicType(String picType) {
		this.picType = picType;
	}
	/**
	 * 获取：类型
	 */
	public String getPicType() {
		return picType;
	}
	/**
	 * 设置：备注
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 获取：备注
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * 设置：创建人
	 */
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	/**
	 * 获取：创建人
	 */
	public String getCreateBy() {
		return createBy;
	}
	/**
	 * 设置：创建时间
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * 获取：创建时间
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * 设置：排序
	 */
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	/**
	 * 获取：排序
	 */
	public Integer getSort() {
		return sort;
	}
}
