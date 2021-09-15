<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/include/taglib.jsp"%>

<div class="modal fade panel" id="myModal-edit" aria-hidden="false">
	<div class="modal-dialog w900">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="modal-title">数据源</h4>
			</div>
			<div class="modal-body">
				<form class="table-wrap form-table" id="dlhDbsourceForm">
					<input type="hidden" id="id" name="id">
					<input type="hidden" id="token" name="token" value="${data.token}">
					<input type="hidden" id="dbDriver" name="dbDriver" value="">
					<input type="hidden" id="dbStatus" name="dbStatus" value="">
					<input type="hidden" id="modifyDate" name="modifyDate">
					<table class="table table-td-striped">
						<tbody>
						<tr >
							<td class="w100">
								数据源编码
							</td>
							<td class="w300">
								<input type="text" id="dbCode" name = "dbCode" value="">
							</td>
							<td class="w100">
								数据源类型
							</td>
							<td class="w300">
								<select id="dbType" name = "dbType">
									<option value="mysql">mysql</option>
									<option value="mongo">mongo</option>
								</select>
							</td>
						</tr>
						<tr >						 
							<td class="w100">
								数据源描述
							</td>
							<td class="w300"  colspan="3">
								<input type="text" id="dbTxt" name = "dbTxt" value="">
							</td>
						</tr>
						
						<tr >
							<td class="w100">
								数据源地址
							</td>
							<td class="w300" colspan="3">
								<textarea id="dbAddress" name = "dbAddress" rows=4></textarea>
							</td>
						</tr>
						<tr >
							<td class="w100">
								连接用户
							</td>
							<td class="w300">
								<input type="text" id="dbUsername" name = "dbUsername" value="">
							</td>
							<td class="w100">
								连接密码
							</td>
							<td class="w300">
								<input type="text" id="dbPassword" name = "dbPassword" value="">
							</td>
						</tr>
						
						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer form-btn">
				<button class="btn dark" type="button" id="saveOrModify">保存继续</button>
				<button class="btn" type="button" id="saveAndClose">保存退出</button>
				<button class="btn" type="button" id="formDivClose">关 闭</button>
			</div>
		</div>
	</div>
</div>

<script src="${sysPath}/js/com/dlh/dlhDbsource/module/dlhDbsourceForm.js" type="text/javascript"></script>
<script src="${sysPath}/js/com/dlh/dlhDbsource/dlhDbsource.validate.js" type="text/javascript"></script>
