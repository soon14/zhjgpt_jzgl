<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/include/head.jsp"%>
<%@ include file="/WEB-INF/web/include/taglib.jsp"%>
<section class="scrollable padder jcGOA-section" id="scrollable">
	<header class="con-header pull-in" id="navigationMenu">
		<h1></h1><div class="crumbs"></div>
	</header>
	<section class="panel clearfix search-box search-shrinkage">
		<div class="search-line">
			<form class="table-wrap form-table" id="searchForm">
				<table class="table table-td-striped">
					<tbody>
						<tr>
							<td class="w140">项目附件</td>
							<td>
								<input type="text" id="query_itemAttach" name="query_itemAttach"/>
							</td>
							<td class="w140">项目分类</td>
							<td>
								<select  name="query_itemId" id="query_itemId">
									<option value ="">请选择</option>
									<c:forEach items="${itemClassifyList}" var="itemClassify" varStatus="status">
										<option value ="${itemClassify.id}">${itemClassify.itemClassify}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; background: #FFFFFF;" colspan="4">
								<button class="btn" type="button" id="queryBtn">查 询</button>
								<button class="btn" type="button" id="resetBtn">重 置</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</section>
	<section class="panel ">
		<h2 class="panel-heading clearfix">查询结果</h2>
		<div class="table-wrap"><table class="table table-striped tab_height" id="gridTable"></table></div>
		<section class="clearfix" id="footer_height">
			<section class="form-btn fl m-l">
				<a class="btn dark" role="button" id="addBtn">新 增</a>
			</section>
		</section>
	</section>
	<div id="formModule"></div>
</section>
<script src='${sysPath}/js/com/jc/csmp/item/itemClassifyAttachList.js'></script>
<%@ include file="/WEB-INF/web/include/foot.jsp"%>