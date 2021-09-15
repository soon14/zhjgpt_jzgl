<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/include/head.jsp"%>
<%@ include file="/WEB-INF/web/include/taglib.jsp"%>
<section class="scrollable padder jcGOA-section" id="scrollable">
	<header class="con-header pull-in" id="navigationMenu">
		<div class="crumbs" id="crumbsHeaderTitle"></div>
	</header>
	<section class="panel clearfix search-box search-shrinkage">
		<div class="search-line">
			<form class="table-wrap form-table" id="searchForm" >
				<input type="hidden" id="createUser" name="createUser" value="${createUser}" />
				<table class="table form-table table-td-striped" style="width:100% !important; margin-bottom:10px;">
					<tbody>
					<tr>
						<td class="w140">项目统一编号</td>
						<td><input type="text" id="projectNumber" name="projectNumber" /></td>
						<td class="w140">项目名称</td>
						<td><input type="text" id="projectName" name="projectName" /></td>
						<td class="w140">合同编号</td>
						<td><input type="text" id="contractCode" name="contractCode" /></td>
						<td class="w140">合同名称</td>
						<td><input type="text" id="contractName" name="contractName" /></td>
					</tr>
					<tr>
						<td class="w140">签证编号</td>
						<td><input type="text" id="code" name="code" /></td>
						<td class="w140">发生时间</td>
						<td colspan="3">
							<div class="input-group w-p100">
								<input class="datepicker-input" type="text" id="visaDateBegin" name="visaDateBegin" data-pick-time="false" data-date-format="yyyy-MM-dd" data-ref-obj="#visaDateEnd lt">
								<div class="input-group-btn w30">-</div>
								<input class="datepicker-input" type="text" id="visaDateEnd" name="visaDateEnd" data-pick-time="false" data-date-format="yyyy-MM-dd" data-ref-obj="#visaDateBegin gt">
							</div>
						</td>
						<td class="w140">审核状态</td>
						<td><dic:select name="auditStatus" id="auditStatus" dictName="workflow_audit_state" parentCode="csmp" defaultValue="" headType="1" headValue="" /></td>
					</tr>
					</tbody>
				</table>
				<div  class="btn-tiwc">
					<button class="btn" type="button" id="queryBtn">查 询</button>
					<button class="btn" type="button" id="resetBtn">重 置</button>
				</div>
			</form>
		</div>
	</section>
	<section class="panel ">
		<div class="table-wrap">
			<section class="form-btn fl m-l"><a class="btn dark" role="button" id="addBtn" style="display: none; margin: 0 !important;">新 增</a></section>
			<table class="table table-striped tab_height" id="gridTable"></table>
		</div>
		<section class="clearfix" id="footer_height"></section>
	</section>
	<div id="formModule"></div>
</section>
<%@ include file="/WEB-INF/web/print/projectVisa.jsp" %>
<script src='${sysPath}/js/com/jc/csmp/project/visa/projectVisaOrderList.js'></script>
<%@ include file="/WEB-INF/web/include/foot.jsp"%>