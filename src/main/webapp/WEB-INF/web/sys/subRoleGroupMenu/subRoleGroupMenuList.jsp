<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/include/head.jsp"%>
<%@ include file="/WEB-INF/web/include/jctree.jsp"%>
<!-- TODO 面包屑 -->
<section class="scrollable padder jcGOA-section" id="scrollable">
	<header class="con-header pull-in" id="header_1">
		<div class="con-heading fl" id="navigationMenu">
			<h1>子系统角色组菜单表</h1>
			<div class="crumbs"></div>
		</div>
		<a class="btn dark fr" href="#" id="showAddDiv_t" role="button">新 增</a>
	</header>
	<section class="panel search-shrinkage clearfix">
		<div class="search-line hide">
			<form class="table-wrap form-table" id="subRoleGroupMenuQueryForm">
				<table class="table table-td-striped">
					<tbody>
						<tr>
							<td>录入时间</td>
							<td>
								<div class="input-group w-p100">
									<input class="datepicker-input" type="text" id="createDateBegin" name="createDateBegin" data-pick-time="false"
										data-date-format="yyyy-MM-dd" data-ref-obj="#createDateEnd lt">
									<div class="input-group-btn w30">-</div>
									<input class="datepicker-input" type="text" id="createDateEnd" name="createDateEnd" data-pick-time="false"
										data-date-format="yyyy-MM-dd" data-ref-obj="#createDateBegin gt">
								</div>

							</td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<section class="form-btn m-b-lg">
					<button class="btn dark" type="button" id="querySubRoleGroupMenu">查 询</button>
					<button class="btn" type="button" id="queryReset">重 置</button>
				</section>
			</form>
		</div>
		<%@ include file="/WEB-INF/web/include/searchConditionHide.jsp"%>
	</section>
	<section class="panel m-t-md" id="body">
		<script>
			//设置每行按钮
			function oTableSetButtones(source) {
				var buttonStr = "";
				var edit = "<a class=\"a-icon i-new\" href=\"#myModal-edit\" onclick=\"subRoleGroupMenuList.loadModuleForUpdate('"
						+ source.id
						+ "')\" role=\"button\"><i class=\"fa fa-edit2\" data-toggle=\"tooltip\" data-placement=\"top\" data-container=\"body\" data-original-title=\"编辑\"></i></a>";
				var del = "<a class=\"a-icon i-remove\" href=\"#\" onclick=\"subRoleGroupMenuList.deleteSubRoleGroupMenu('"
						+ source.id
						+ "')\"><i class=\"fa fa-remove\" data-toggle=\"tooltip\" data-placement=\"top\" data-container=\"body\" data-original-title=\"删除\"></i></a>";
				buttonStr = edit + del;
				return buttonStr;
			};
		</script>
		<h2 class="panel-heading clearfix">查询结果</h2>
		<div class="table-wrap">
			<table class="table table-striped tab_height first-td-tc" id="subRoleGroupMenuTable">
				<thead>
					<tr>
						<th class="w46">
							<input type="checkbox" />
						</th>
						<th>角色组ID</th>
						<th>菜单ID</th>
						<th>权重</th>
						<th>密级</th>
						<th class="w170">操作</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>

		<section class="clearfix" id="footer_height">
			<section class="form-btn fl m-l">
				<a class="btn dark" role="button" id="addSubRoleGroupMenuButton">新 增</a>
				<button class="btn " id="deleteSubRoleGroupMenus" type="button">批量删除</button>
			</section>
		</section>
	</section>
	<div id="subRoleGroupMenuModuleDiv"></div>
</section>
</section>
<script src='${sysPath}/js/com/sys/subRoleGroupMenu/subRoleGroupMenuList.js'></script>
<%@ include file="/WEB-INF/web/include/foot.jsp"%>