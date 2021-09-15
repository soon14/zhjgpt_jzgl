<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/web/include/head.jsp"%>
<%@ include file="/WEB-INF/web/include/jctree.jsp"%>
<section class="scrollable padder jcGOA-section" id="scrollable">
    <header class="con-header pull-in" id="navigationMenu">
        <div class="crumbs">
            <span>全生命周期</span>
            <span>数据串联监管 > </span><span>我接收的督办</span>
        </div>
    </header>
    <section class="panel clearfix search-box search-shrinkage">
        <div class="search-line">
            <form class="table-wrap form-table" id="searchForm" >
                <table class="table form-table table-td-striped" style="width:100% !important; margin-bottom:10px;">
                    <tbody>
                    <tr>
                        <td style="width: 10%">标题</td>
                        <td style="width: 40%"><input type="text" id="title" name="title"></td>
                        <td style="width: 10%">办理状态</td>
                        <td style="width: 40%">
                            <select id="handleStatus" name="handleStatus">
                                <option value="">- 全部 -</option>
                                <option value="0">未办理</option>
                                <option value="1">已办理</option>
                            </select>
                        </td>
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
        <div class="table-wrap"><table class="table table-striped tab_height" id="gridTable"></table></div>
        <section class="clearfix" id="footer_height"></section>
    </section>
    <div id="formModule"></div>
</section>
<script src='${sysPath}/js/com/jc/supervise/message/superviseMessageReceiveList.js'></script>
<%@ include file="/WEB-INF/web/include/foot.jsp"%>