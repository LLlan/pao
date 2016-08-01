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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vhousekeeping/homemakingServiceManage/list">
			<shiro:hasPermission name="M0000008:list">
				<label>类型名称:</label>
				<input type="text" name="serviceTypeName" value="${requestScope.PARAMS.serviceTypeName}"> 
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
	          <th>类型名称</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowid="${item.id}" rowservicetypeid="${item.serviceTypeId}">
				<td>${item.serviceTypeName}</td>
				<td>
				<shiro:hasPermission name="M0000008:editPrice">
		          	<button class="btn btn-sm btn-info editPrice">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑价格
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
			action("vhousekeeping/homemakingServiceManage/add");
		});
		
		//跳转到编辑价格页面
		$(".editPrice").on("click", function(){
			var id = $(this).parent().parent().attr("rowid");
			var serviceTypeId = $(this).parent().parent().attr("rowservicetypeid");
			action("vhousekeeping/homemakingServiceManage/homemakingPriceManage/list?homemakingServiceId=" + id + "&serviceTypeId=" + serviceTypeId);
		});
		
	});
</script>