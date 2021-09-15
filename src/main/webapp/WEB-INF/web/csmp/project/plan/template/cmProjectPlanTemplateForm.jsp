<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/include/taglib.jsp"%>
<%@ include file="/WEB-INF/web/include/jctree.jsp"%>
<div class="modal fade panel" id="entityFormform-modal" aria-hidden="false">
    <div class="modal-dialog w600">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 class="modal-title" id="entityFormTitle"></h4>
            </div>
            <div class="modal-body">
                <form class="table-wrap form-table" id="entityForm">
                    <input type="hidden" id="id" name="id" />
                    <input type="hidden" id="token" name="token" value="${data.token}">
                    <input type="hidden" id="modifyDate" name="modifyDate" />
                    <table class="table table-td-striped">
                        <tbody>
                        <tr>
                            <td class="w100"><span class='required'>*</span>模板名称</td>
                            <td><input type="text" id="templateName" name="templateName" /></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer form-btn" style="text-align: center; width: 100%;">
                <button class="btn dark" type="button" id="saveBtn">保 存</button>
                <button class="btn" type="button" id="closeBtn">关 闭</button>
            </div>
        </div>
    </div>
</div>
<script src='${sysPath}/js/com/jc/csmp/project/plan/template/cmProjectPlanTemplateForm.js'></script>