package com.jc.csmp.projectSgxk.domain.validator;

import com.jc.csmp.projectSgxk.domain.CompanyProjectsSgxk;
import com.jc.foundation.util.MessageUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 * @Version 1.0
 */
public class CompanyProjectsSgxkValidator implements Validator{
	private static final String JC_SYS_010 = "JC_SYS_010";
	private static final String JC_SYS_011 = "JC_SYS_011";
	private static final int FIFTY = 50;
	private static final int TWO_HUNDRED = 200;

	/**
	 * @description 检验类能够校验的类
	 * @param arg0  校验的类型
	 * @return 是否支持校验
	 * @Author 常鹏
	 * @version 1.0
	 */
	@Override
	public boolean supports(Class<?> arg0) {
		return CompanyProjectsSgxk.class.equals(arg0);
	}

	/**
	 * @version 1.0
	 */
	@Override
	public void validate(Object arg0, Errors arg1) {
		CompanyProjectsSgxk v = (CompanyProjectsSgxk) arg0;
		if (v.getId() != null && v.getId().length() > 100) {
			arg1.reject("id", MessageUtils.getMessage(JC_SYS_011, new Object[]{"100"}));
		}
		if (v.getPcpHtlb() != null && v.getPcpHtlb().length() > 200) {
			arg1.reject("pcpHtlb", MessageUtils.getMessage(JC_SYS_011, new Object[]{"200"}));
		}
		if (v.getPcpBdmc() != null && v.getPcpBdmc().length() > 200) {
			arg1.reject("pcpBdmc", MessageUtils.getMessage(JC_SYS_011, new Object[]{"200"}));
		}
		if (v.getPcpHtbh() != null && v.getPcpHtbh().length() > 200) {
			arg1.reject("pcpHtbh", MessageUtils.getMessage(JC_SYS_011, new Object[]{"200"}));
		}
		if (v.getPcpXq() != null && v.getPcpXq().length() > 1000) {
			arg1.reject("pcpXq", MessageUtils.getMessage(JC_SYS_011, new Object[]{"1000"}));
		}
		if (v.getPcpProjectNum() != null && v.getPcpProjectNum().length() > 200) {
			arg1.reject("pcpProjectNum", MessageUtils.getMessage(JC_SYS_011, new Object[]{"200"}));
		}
		if (v.getExtStr1() != null && v.getExtStr1().length() > 200) {
			arg1.reject("extStr1", MessageUtils.getMessage(JC_SYS_011, new Object[]{"200"}));
		}
		if (v.getExtStr2() != null && v.getExtStr2().length() > 200) {
			arg1.reject("extStr2", MessageUtils.getMessage(JC_SYS_011, new Object[]{"200"}));
		}
		if (v.getExtStr3() != null && v.getExtStr3().length() > 200) {
			arg1.reject("extStr3", MessageUtils.getMessage(JC_SYS_011, new Object[]{"200"}));
		}
		if (v.getExtStr4() != null && v.getExtStr4().length() > 200) {
			arg1.reject("extStr4", MessageUtils.getMessage(JC_SYS_011, new Object[]{"200"}));
		}
		if (v.getExtStr5() != null && v.getExtStr5().length() > 200) {
			arg1.reject("extStr5", MessageUtils.getMessage(JC_SYS_011, new Object[]{"200"}));
		}
		if (v.getDlhDataId() != null && v.getDlhDataId().length() > 100) {
			arg1.reject("dlhDataId", MessageUtils.getMessage(JC_SYS_011, new Object[]{"100"}));
		}
		if (v.getDlhDataSrc() != null && v.getDlhDataSrc().length() > 64) {
			arg1.reject("dlhDataSrc", MessageUtils.getMessage(JC_SYS_011, new Object[]{"64"}));
		}
		if (v.getDlhDataUser() != null && v.getDlhDataUser().length() > 100) {
			arg1.reject("dlhDataUser", MessageUtils.getMessage(JC_SYS_011, new Object[]{"100"}));
		}
		if (v.getPcpBzry() != null && v.getPcpBzry().length() > 64) {
			arg1.reject("pcpBzry", MessageUtils.getMessage(JC_SYS_011, new Object[]{"64"}));
		}
		if (v.getPcpDh() != null && v.getPcpDh().length() > 64) {
			arg1.reject("pcpDh", MessageUtils.getMessage(JC_SYS_011, new Object[]{"64"}));
		}
	}
}
