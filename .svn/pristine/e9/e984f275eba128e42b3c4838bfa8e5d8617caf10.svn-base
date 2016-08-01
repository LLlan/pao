<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="row">
	<div class="col-xs-12">
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vhousekeeping/appuserManage/list">
			<shiro:hasPermission name="M0000009:list">
				<label>账号名称:</label>
				<input type="text" name="account" value="${requestScope.PARAMS.account}"> 
				<label>昵称:</label>
				<input type="text" name="nickname" value="${requestScope.PARAMS.nickname}"> 
				<label>状态:</label>
				<select id="status" name="status" class="form-control">
					<option value="" >全部</option>
					<c:forEach var="item" items="${requestScope.statusList}">
						<option value="${item}" <c:if test="${item == requestScope.PARAMS.status}"> selected="selected"</c:if> >${item.name}</option>
					</c:forEach>
				</select>
				<button type="button" class="btn btn-success btn-sm tooltip-success list">
					<i class="ace-icon glyphicon glyphicon-search"></i>查询
				</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="M0000009:add">
				<button type="button" class="btn btn-purple btn-sm tooltip-success add">
					<i class="ace-icon glyphicon glyphicon-plus"></i>新增
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
	          <th>手机账号</th>
	          <th>姓名</th>
	          <th>状态</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowid="${item.id}">
				<td>${item.account}</td>
				<td>${item.nickname}</td>
				<td>
					<c:forEach var="i" items="${requestScope.statusList}">
						<c:if test="${i == item.status}">${i.name}</c:if>
					</c:forEach>
				</td>
				<td>
				<shiro:hasPermission name="M0000009:edit">
		          	<button class="btn btn-sm btn-info edit">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="M0000009:editWorkerServic">
		          	<button class="btn btn-sm btn-info editWorkerServic">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>服务项
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="M0000009:turnon">
		          	<button class="btn btn-sm btn-info turnon">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>启用
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="M0000009:shut">
		          	<button class="btn btn-sm btn-info shut">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>停用
					</button>
				</shiro:hasPermission>
	          </td>
	        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	</div>
</div>
<tiles:insertDefinition name="vmanage.base.page"></tiles:insertDefinition>

<script type="text/javascript">
	$(function(){
		$(".add").on("click", function(){
			action("vhousekeeping/appuserManage/add");
		});
		
		//跳转到编辑页面
		$(".edit").on("click", function(){
			var id = $(this).parent().parent().attr("rowid");
			action("vhousekeeping/appuserManage/edit?id=" + id);
		});
		
		//服务项]-p
		$(".editWorkerServic").on("click", function(){
			var id = $(this).parent().parent().attr("rowid");
			action("vhousekeeping/appuserManage/appuserServiceRecManage/list?appuserId=" + id);
		});

		//启用
		$(".turnon").on("click", function(){
			var id = $(this).parent().parent().attr("rowid");
			$.messager.confirm(
					"您确认要启用该条数据吗",
					//回调函数
					function(r) {
						//r是返回的信息，点击确认的时候为true 取消的时候为false
						if(r) {
							//当点击确认时触发
							$.businAjax(
								"${pageContext.request.contextPath}/vhousekeeping/appuserManage/turnon/exec",
								{"id": id},
								function(res) {
									$.messager.alert(res.msg, function() {
										if(res.code) {
											//提交成功,跳转回查询页面
											action("vhousekeeping/appuserManage/list");
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
		//停用
		$(".shut").on("click", function(){
			var id = $(this).parent().parent().attr("rowid");
			$.messager.confirm(
					"您确认要停用该条数据吗",
					//回调函数
					function(r) {
						//r是返回的信息，点击确认的时候为true 取消的时候为false
						if(r) {
							//当点击确认时触发
							$.businAjax(
								"${pageContext.request.contextPath}/vhousekeeping/appuserManage/shut/exec",
								{"id": id},
								function(res) {
									$.messager.alert(res.msg, function() {
										if(res.code) {
											//提交成功,跳转回查询页面
											action("vhousekeeping/appuserManage/list");
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
	});
</script>