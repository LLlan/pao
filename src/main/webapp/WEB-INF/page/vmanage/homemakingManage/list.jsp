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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vmanage/homemakingManage/list">
			<shiro:hasPermission name="M0000004:list">
				<label>账号名称:</label>
				<input type="text" name="account" value="${requestScope.PARAMS.account}"> 
				<label>家政公司名称:</label>
				<input type="text" name="name" value="${requestScope.PARAMS.name}"> 
				<button type="button" class="btn btn-success btn-sm tooltip-success list">
					<i class="ace-icon glyphicon glyphicon-search"></i>查询
				</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="M0000004:add">
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
	          <th>家政公司账号</th>
	          <th>家政公司名称</th>
	          <th>余额</th>
	          <th>评级</th>
	          <th>联系电话</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowid="${item.id}">
				<td>${item.account}</td>
				<td>${item.name}</td>
				<td>${item.balance}</td>
				<td>${item.homemakingGrade}</td>
				<td>${item.phoneNumber}</td>
				<td>
				<shiro:hasPermission name="M0000004:edit">
		          	<button class="btn btn-sm btn-info edit">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="M0000004:remove">
	            <button class="btn btn-sm btn-danger remove">
					<i class="ace-icon fa fa-trash-o bigger-120"></i>删除
				</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="M0000004:resetPassword">
		          	<button class="btn btn-sm btn-info resetPassword">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>重置密码
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
			action("vmanage/homemakingManage/add");
		});
		
		//跳转到编辑页面
		$(".edit").on("click", function(){
			var id = $(this).parent().parent().attr("rowid");
			action("vmanage/homemakingManage/edit?id=" + id);
		});
		
		//密码重置
		$(".resetPassword").on("click", function(){
			var id = $(this).parent().parent().attr("rowid");
			$.messager.confirm(
					"您确认要重置该家政的登录密码吗",
					//回调函数
					function(r) {
						//r是返回的信息，点击确认的时候为true 取消的时候为false
						if(r) {
							//当点击确认时触发
							$.businAjax(
								"${pageContext.request.contextPath}/vmanage/homemakingManage/resetPassword/exec",
								{"id": id},
								function(res) {
									$.messager.alert(res.msg, function() {
										if(res.code) {
											//提交成功,跳转回查询页面
											action("vmanage/homemakingManage/list");
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