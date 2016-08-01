
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String ctx = request.getContextPath();
	request.setAttribute("ctx",ctx);
%>

<div class="row">
	<div class="col-xs-12">
		<form class="form-inline search_form" method="post" action="${ctx}/vestate/estate/reportManage/list">
			<shiro:hasPermission name="M1000002:list">
				<label>举报内容:</label>
				<input type="text" name="reportContent" id="reportContent" value="${PARAMS.reportContent}">
				<button type="button" class="btn btn-success btn-sm tooltip-success list">
					<i class="ace-icon glyphicon glyphicon-search"></i>查询
				</button>
			</shiro:hasPermission>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
			<thead>
			<tr>
				<th>举报类型</th>
				<th width="50%">举报内容</th>
				<th>帖子标题/评论内容</th>
				<th>操作</th>
			</tr>
			</thead><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<tbody>
			<tr>
			<c:forEach var="item" items="${PAGE.records}" >
				<tr >
					<td >${item.reportType}</td>
					<td >${item.reportContent}"</td>
					<td >${item.invitation.invitationTitle}</td>
					<td>
						<shiro:hasPermission name="M1000002:edit">
							<button class="btn btn-sm btn-info view" id='${item.id}'><i class="ace-icon fa fa-trash-o bigger-120"></i>查看</button>
						</shiro:hasPermission>
						<shiro:hasPermission name="M1000002:remove">
							<button class="btn btn-sm btn-danger remove" id='${item.id}'><i class="ace-icon fa fa-trash-o bigger-120"></i>关闭</button>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<tiles:insertDefinition name="vestate.base.page.definition"></tiles:insertDefinition>

<script type="text/javascript">
	$(function() {
		$(".remove").click(function(){
			var id = $(this).attr("id");
			$.messager.confirm(
					"您确认要删除该条数据吗",
					//回调函数
					function(r) {
						//r是返回的信息，点击确认的时候为true 取消的时候为false
						if(r) {
							//当点击确认时触发
							$.businAjax(
									"${pageContext.request.contextPath}/vestate/estate/reportManage/del/exec",
									{"id": id,"type":"only_delReport"},
									function(res) {
										$.messager.alert(res.msg, function() {
											if(res.code) {
												//提交成功,跳转回查询页面
												action("/vestate/estate/reportManage/list");
											}
										});
									}
							)
						} else {
							//点击取消时触发
						}
					}
			);
		});
		$(".view").click(function(){
			var id = $(this).attr("id");
			action("/vestate/estate/reportManage/detail?id=" + id);
		});
	});
</script>