package com.jc.system.sys.web;

import com.jc.foundation.domain.PageManager;
import com.jc.foundation.util.GlobalContext;
import com.jc.foundation.util.MessageUtils;
import com.jc.foundation.util.StringUtil;
import com.jc.foundation.web.BaseController;
import com.jc.system.applog.ActionLog;
import com.jc.system.security.SystemSecurityUtils;
import com.jc.system.security.domain.User;
import com.jc.system.sys.domain.PinDepartment;
import com.jc.system.sys.domain.validator.PinDepartmentValidator;
import com.jc.system.sys.service.IPinDepartmentService;
import com.jc.system.util.menuUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Administrator
 * @date 2020-07-01
 */
@Controller
@RequestMapping(value="/sys/pinDepartment")
public class PinDepartmentController extends BaseController{

	@Autowired
	private IPinDepartmentService pinDepartmentService;

	@org.springframework.web.bind.annotation.InitBinder("pinDepartment")
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new PinDepartmentValidator());

	}

	public PinDepartmentController() {
	}

	@RequestMapping(value = "infoLoading.action",method=RequestMethod.POST)
	@ResponseBody
	@ActionLog(operateModelNm="部门拼音表",operateFuncNm="infoLoading",operateDescribe="对部门拼音表进行数据导入操作")
	public Map<String,Object> infoLoading(@Valid PinDepartment pinDepartment,BindingResult result,
										  HttpServletRequest request) throws Exception{
		Map<String, Object> resultMap = pinDepartmentService.infoLoading();
		return resultMap;
	}

	@RequestMapping(value = "save.action",method=RequestMethod.POST)
	@ResponseBody
	@ActionLog(operateModelNm="部门拼音表",operateFuncNm="save",operateDescribe="对部门拼音表进行新增操作")
	public Map<String,Object> save(@Valid PinDepartment pinDepartment,BindingResult result, HttpServletRequest request) throws Exception{
		Map<String, Object> resultMap = validateBean(result);
		if (resultMap.size() > 0) {
			return resultMap;
		}
		resultMap = validateToken(request);
		if (resultMap.size() > 0) {
			return resultMap;
		}
		if(!"false".equals(resultMap.get("success"))){
			pinDepartmentService.save(pinDepartment);
			resultMap.put("success", "true");
			resultMap.put(GlobalContext.RESULT_SUCCESSMESSAGE, MessageUtils.getMessage("JC_SYS_001"));
			resultMap.put(GlobalContext.SESSION_TOKEN, getToken(request));
		}
		return resultMap;
	}

	@RequestMapping(value="update.action",method=RequestMethod.POST)
	@ResponseBody
	@ActionLog(operateModelNm="部门拼音表",operateFuncNm="update",operateDescribe="对部门拼音表进行更新操作")
	public Map<String, Object> update(PinDepartment pinDepartment, BindingResult result, HttpServletRequest request) throws Exception{
		Map<String, Object> resultMap = validateBean(result);
		if (resultMap.size() > 0) {
			return resultMap;
		}
		Integer flag = pinDepartmentService.update(pinDepartment);
		if (flag == 1) {
			resultMap.put(GlobalContext.RESULT_SUCCESS, "true");
			resultMap.put(GlobalContext.RESULT_SUCCESSMESSAGE, MessageUtils.getMessage("JC_SYS_003"));
		}
		String token = getToken(request);
		resultMap.put(GlobalContext.SESSION_TOKEN, token);
		return resultMap;
	}

	@RequestMapping(value="get.action",method=RequestMethod.GET)
	@ResponseBody
	@ActionLog(operateModelNm="部门拼音表",operateFuncNm="get",operateDescribe="对部门拼音表进行单条查询操作")
	public PinDepartment get(PinDepartment pinDepartment,HttpServletRequest request) throws Exception{
		return pinDepartmentService.get(pinDepartment);
	}

	@RequestMapping(value="loadForm.action",method=RequestMethod.GET)
	public String loadForm(Model model,HttpServletRequest request) throws Exception{
		Map<String, Object> map = new HashMap<>(1);
		String token = getToken(request);
		map.put(GlobalContext.SESSION_TOKEN, token);
		model.addAttribute("data", map);
		return "sys/pinDepartment/pinDepartmentForm";
	}

	@RequestMapping(value="manageList.action",method=RequestMethod.GET)
	@ResponseBody
	public PageManager manageList(PinDepartment pinDepartment,PageManager page, HttpServletRequest request){
		//默认排序
		if(StringUtil.isEmpty(pinDepartment.getOrderBy())) {
			pinDepartment.addOrderByFieldDesc("t.CREATE_DATE");
		}
		PageManager rePage = pinDepartmentService.query(pinDepartment, page);
		return rePage;
	}

	@RequestMapping(value="manage.action",method=RequestMethod.GET)
	@ActionLog(operateModelNm="部门拼音表",operateFuncNm="manage",operateDescribe="对部门拼音表进行跳转操作")
	public String manage(HttpServletRequest request) throws Exception{
		User userInfo = SystemSecurityUtils.getUser();
		if (userInfo != null) {
			if (userInfo.getIsSystemManager() || userInfo.getIsSystemAdmin()) {
				menuUtil.saveMenuID("/sys/pinDepartment/manage.action",request);
				return "sys/pinDepartment/pinDepartmentList";
			} else {
				return "error/unauthorized";
			}
		}
		return "error/unauthorized";
	}

	@RequestMapping(value="deleteByIds.action",method=RequestMethod.POST)
	@ResponseBody
	@ActionLog(operateModelNm="部门拼音表",operateFuncNm="deleteByIds",operateDescribe="对部门拼音表进行删除")
	public  Map<String, Object> deleteByIds(PinDepartment pinDepartment,String ids, HttpServletRequest request) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		pinDepartment.setPrimaryKeys(ids.split(","));
		if(pinDepartmentService.deleteByIds(pinDepartment) != 0){
			resultMap.put(GlobalContext.RESULT_SUCCESS, "true");
			resultMap.put(GlobalContext.RESULT_SUCCESSMESSAGE, MessageUtils.getMessage("JC_SYS_005"));
		} else {
			resultMap.put(GlobalContext.RESULT_SUCCESS, "false");
			resultMap.put(GlobalContext.RESULT_ERRORMESSAGE, MessageUtils.getMessage("JC_SYS_006"));
		}
		return resultMap;
	}

}