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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vmanage/core/informationCategoryManage/list">
			<shiro:hasPermission name="M0000008:list">
				<label>名称:</label>
				<input type="text" name="name" value="${requestScope.PARAMS.name }"> 
				<label>是否显示:</label>
				<select id="isShow" name="isShow" class="form-control">
					<option value="" >全部</option>
					<c:forEach var="item" items="${requestScope.isShows}">
						<option value="${item}" <c:if test="${item == requestScope.PARAMS.isShow}"> selected="selected"</c:if> >${item.name}</option>
					</c:forEach>
				</select>
				<button type="button" class="btn btn-success btn-sm tooltip-success list">
					<i class="ace-icon glyphicon glyphicon-search"></i>查询
				</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="M0000008:add">
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
	          <th>名称</th>
	          <th>图标</th>
	          <th>是否显示</th>
	          <th>权重</th>
	          <th></th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowid="${item.id}">
				<td>${item.name}</td>
				<td>
					<img class="editable img-responsive editable-click editable-empty custom-image" alt="iconPath" src="${requestScope.urlPrefx}${item.iconPath}"></img>
				</td>
				<td>
					<c:forEach var="item2" items="${requestScope.isShows}">
						<c:if test="${item.isShow == item2}"> ${item2.name}</c:if>
					</c:forEach>
				</td>
				<td>${item.weight}</td>
				<td>
				<shiro:hasPermission name="M0000002:edit">
		          	<button class="btn btn-sm btn-info edit">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="M0000002:remove">
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
		if($(".add")) {
			$(".add").on("click", function(){
				action("vmanage/core/informationCategoryManage/add");
			});
		}
		//删除
		if ($(".remove")) {
			$(".remove").on("click", function(){
				var id = $(this).parent().parent().attr("rowid");
				$.messager.confirm(
						"删除分类时会把分类下面的资讯同时删除,确定要删除该分类吗?",
						//回调函数
						function(r) {
							//r是返回的信息，点击确认的时候为true 取消的时候为false
							if(r) {
								//当点击确认时触发
								$.businAjax(
									"${pageContext.request.contextPath}/vmanage/core/informationCategoryManage/remove/exec",
									{"id": id},
									function(res) {
										$.messager.alert(res.msg, function() {
											if(res.code) {
												//提交成功,跳转回查询页面
												action("vmanage/core/informationCategoryManage/list");
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
		}
		
		//跳转到编辑页面
		if ($(".edit")) {
			$(".edit").on("click", function(){
				var id = $(this).parent().parent().attr("rowid");
				action("vmanage/core/informationCategoryManage/edit?id=" + id);
			});
		}
	});
</script>