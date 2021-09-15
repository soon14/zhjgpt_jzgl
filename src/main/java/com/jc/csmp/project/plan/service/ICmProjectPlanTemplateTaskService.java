package com.jc.csmp.project.plan.service;

import com.jc.csmp.project.plan.domain.CmProjectPlanTemplateTask;
import com.jc.foundation.exception.CustomException;
import com.jc.foundation.service.IBaseService;
import com.jc.foundation.util.Result;

/**
 * 建设管理-项目计划模板任务管理service
 * @Author 常鹏
 * @Date 2020/7/6 14:29
 * @Version 1.0
 */
public interface ICmProjectPlanTemplateTaskService extends IBaseService<CmProjectPlanTemplateTask>{

	/**
	 * 根据主键删除多条记录方法
	 * @param entity
	 * @return
	 * @throws CustomException
	 */
	Integer deleteByIds(CmProjectPlanTemplateTask entity) throws CustomException;

	/**
	 * 保存方法
	 * @param entity
	 * @return
	 * @throws CustomException
	 */
    Result saveEntity(CmProjectPlanTemplateTask entity) throws CustomException;

	/**
	 * 修改方法
	 * @param entity
	 * @return
	 * @throws CustomException
	 */
	Result updateEntity(CmProjectPlanTemplateTask entity) throws CustomException;

	/**
	 * 根据id获取数据
	 * @param id
	 * @return
	 */
	CmProjectPlanTemplateTask getById(String id);
}
