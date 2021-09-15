package com.jc.csmp.workflow.enums.service.impl;

import com.jc.csmp.project.domain.CmProjectChangeOrder;
import com.jc.csmp.project.service.ICmProjectChangeOrderService;
import com.jc.csmp.workflow.domain.TodoExtendBean;
import com.jc.csmp.workflow.enums.service.IWorkflowTodoService;
import com.jc.foundation.exception.CustomException;
import com.jc.foundation.util.GlobalUtil;
import com.jc.foundation.util.SpringContextHolder;
import com.jc.workflow.external.WorkflowBean;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * 工作流工程变更单待办
 * @Author 常鹏
 * @Date 2020/8/21 10:53
 * @Version 1.0
 */
public class BgdTodoServiceImpl extends IWorkflowTodoService {

    private ICmProjectChangeOrderService cmProjectChangeOrderService;

    public BgdTodoServiceImpl() {
        cmProjectChangeOrderService = SpringContextHolder.getBean(ICmProjectChangeOrderService.class);
    }

    @Override
    public TodoExtendBean getByPid(String pid) {
        CmProjectChangeOrder entity = new CmProjectChangeOrder();
        entity.setPiId(pid);
        try {
            entity = cmProjectChangeOrderService.get(entity);
            if (entity != null) {
                String desc = "";
                if (entity.getChangeType().equals("1")) {
                    desc = "针对项目：" + entity.getProjectName() + "的变更申请";
                } else {
                    desc = "针对合同：" + entity.getContractName() + "的变更申请";
                }
                return TodoExtendBean.create(entity.getCode(), desc);
            }
        } catch (CustomException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String getAttachTableName() {
        return "cm_project_change_order";
    }

    @Override
    public Object getEntityByPid(String pid) {
        CmProjectChangeOrder entity = new CmProjectChangeOrder();
        entity.setPiId(pid);
        try {
            return cmProjectChangeOrderService.get(entity);
        } catch (CustomException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Map<String, Object> getFlowVariable(Map<String, Object> workflowBean, Object data) {
        //CmProjectChangeOrder entity = (CmProjectChangeOrder) data;
        Map<String, Object> result = new HashMap<>(5);
        result.put("curNodeId_", workflowBean.get("curNodeId_"));
        result.put("definitionId_", workflowBean.get("definitionId_"));
        result.put("instanceId_", workflowBean.get("instanceId_"));
        //result.put("workflowVar_[partaUnitLeaderId]", entity.getPartaUnitLeaderId());
        return result;
    }

    @Override
    public Integer updateWorkflow(WorkflowBean workflowBean, Map<String, Object> extendData) {
        CmProjectChangeOrder entity = new CmProjectChangeOrder();
        entity.setWorkflowBean(workflowBean);
        try {
            if (extendData != null && extendData.size() > 0) {
                for (Map.Entry<String, Object> entry : extendData.entrySet()) {
                    PropertyDescriptor pd = new PropertyDescriptor(entry.getKey(), entity.getClass());
                    Method method = pd.getWriteMethod();
                    Object value = GlobalUtil.convertData(method, (String) entry.getValue());
                    if (value != null) {
                        method.invoke(entity, value);
                    }
                }
            }
            return cmProjectChangeOrderService.updateWorkflow(entity);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }
}
