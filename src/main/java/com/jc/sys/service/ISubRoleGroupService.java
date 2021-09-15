package com.jc.sys.service;

import com.jc.foundation.exception.CustomException;
import com.jc.foundation.service.IBaseService;
import com.jc.sys.domain.SubRoleGroup;
/**
 *@ClassName
 *@Description
 *@author Administrator -Technical Management Architecture
 *@date 2019-04-22 15:15
 *@Version 3.0
 *
 **/
public interface ISubRoleGroupService extends IBaseService<SubRoleGroup>{
	/**
	* @description 根据主键删除多条记录方法
	* @param  subRoleGroup 实体类
	* @return Integer 处理结果
	* @author
	* @version  2018-04-12 
	*/
	public Integer deleteByIds(SubRoleGroup subRoleGroup) throws CustomException;

	
}