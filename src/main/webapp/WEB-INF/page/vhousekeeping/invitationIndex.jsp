<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String ctx = request.getContextPath();
	request.setAttribute("ctx",ctx);
%>
<style type="text/css">
	img{width: 20px;height: 20px;display:inline-block;}
</style>
<div class="row">
	<div class="col-xs-12">
		<form class="form-inline search_form" method="post" action="${ctx}/vestate/estate/invitationManage/list">
			<shiro:hasPermission name="M1000002:list">
				<label>帖子标题:</label>
				<input type="text" name="invitationTitle" id="invitationTitle" value="${PARAMS.invitationTitle}">
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
				<th>标题</th>
				<th>类型</th>
				<th>发帖人</th>
				<th>时间</th>
				<th>是否启用</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<c:forEach var="item" items="${PAGE.records}" >
			<tr >
				<td >${item.invitationTitle}</td>
				<td >${item.invitationCate.name}</td>
				<td >${item.userName}</td>
				<td ><fmt:formatDate value="${item.invitationTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td ><c:if test="${item.useFlag=='YES'}">是</c:if><c:if test="${item.useFlag=='NO'}">否</c:if></td>
				<td>
					<shiro:hasPermission name="M1000002:edit">
						<button class="btn btn-sm btn-info view" id='${item.id}'><i class="ace-icon fa fa-trash-o bigger-120"></i>查看</button>
					</shiro:hasPermission>
					<c:if test="${item.useFlag=='YES'}">
					<shiro:hasPermission name="M1000002:remove">
						<button class="btn btn-sm btn-danger remove" id='${item.id}'><i class="ace-icon fa fa-trash-o bigger-120"></i>关闭</button>
					</shiro:hasPermission>
					</c:if>
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
									"${pageContext.request.contextPath}/vestate/estate/invitationManage/del/exec",
									{"id": id},
									function(res) {
										$.messager.alert(res.msg, function() {
											if(res.code) {
												//提交成功,跳转回查询页面
												action("/vestate/estate/invitationManage/list");
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
			action("/vestate/estate/invitationManage/detail?id=" + id);
		});
	})
</script>