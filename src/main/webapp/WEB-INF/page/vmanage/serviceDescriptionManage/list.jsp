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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vmanage/serviceTypeManage/serviceDescriptionManage/list">
			
			<label>类型名称:</label>
			<input type="hidden" id="serviceTypeId" name="serviceTypeId" value="${requestScope.PARAMS.serviceTypeId}" />
			<input type="text" id="serviceTypeName" name="serviceTypeName" value="${requestScope.PARAMS.serviceTypeName}" readOnly />
			
			<button type="button" class="btn btn-purple btn-sm tooltip-success add">
				<i class="ace-icon glyphicon glyphicon-plus"></i>新增
			</button>
			<button class="btn btn-danger btn-sm cancel" type="button">
				<i class="ace-icon fa fa-undo bigger-110"></i>取消
			</button>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>服务描述</th>
	          <th>排序</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowid="${item.id}">
				<td>${item.description}</td>
				<td>${item.sort}</td>
				<td>
				<shiro:hasPermission name="M0000006:edit">
		          	<button class="btn btn-sm btn-info edit">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
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
			var serviceTypeId =$("#serviceTypeId").val();
			action("vmanage/serviceTypeManage/serviceDescriptionManage/add?serviceTypeId=" + serviceTypeId);
		});
		
		//跳转到编辑页面
		$(".edit").on("click", function(){
			var id = $(this).parent().parent().attr("rowid");
			action("vmanage/serviceTypeManage/serviceDescriptionManage/edit?id=" + id);
		});
		
		$(".cancel").on("click", function() {
			action("vmanage/serviceTypeManage/list");
		});
	});
</script>