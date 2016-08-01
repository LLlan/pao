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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vmanage/userManage/list">
			<shiro:hasPermission name="M0000003:list">
				<label>用户名:</label>
				<input type="text" name="username" value="${requestScope.PARAMS.username}"> 
				<label>角色</label>
				<select id="roleId" name="roleId">
					<option value="" >全部</option>
					<c:forEach var="item" items="${requestScope.roles}">
						<option value="${item.id}" <c:if test="${item.id == requestScope.PARAMS.roleId}"> selected="selected"</c:if> >${item.name}</option>
					</c:forEach>
				</select>
				<button type="button" class="btn btn-success btn-sm tooltip-success list">
					<i class="ace-icon glyphicon glyphicon-search"></i>查询
				</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="M0000003:add">
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
	          <th>用户名</th>
	          <th>角色</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr id="${item.id}">
	      		<td>${item.username }</td>
				<td>
					<c:forEach items="${requestScope.roles }" var="role">
						<c:if test="${role.id == item.roleId}">${role.name}</c:if>
					</c:forEach>
				</td>
				<td>
				<shiro:hasPermission name="M0000003:edit">
		          	<button class="btn btn-sm btn-info edit">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="M0000003:remove">
	            <button class="btn btn-sm btn-danger remove">
					<i class="ace-icon fa fa-trash-o bigger-120"></i>删除
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
		$(".add").on("click",function(){
			location.href="${pageContext.request.contextPath}/vmanage/userManage/add";
		});
		
		//删除
		$(".remove").click(function(){
			var id = $(this).parent().parent().attr("id");
			$.messager.confirm(
					"您确认要删除该条数据吗",
					//回调函数
					function(r) {
						//r是返回的信息，点击确认的时候为true 取消的时候为false
						if(r) {
							//当点击确认时触发
							$.businAjax(
								"${pageContext.request.contextPath}/vmanage/userManage/remove/exec",
								{"id": id},
								function(res) {
									$.messager.alert(res.msg, function() {
										if(res.code) {
											//提交成功,跳转回查询页面
											action("vmanage/userManage/list");
										}
									});
								}
							);
						} else {
							//点击取消时触发
						}
					}
			);
		});
		
		//跳转到编辑页面
		$(".edit").click(function(){
			var id = $(this).parent().parent().attr("id");
			location.href = "${pageContext.request.contextPath}/vmanage/userManage/edit?id="+id+"";
		});
	});
</script>