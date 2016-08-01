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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vhousekeeping/homemakingServiceManage/homemakingPriceManage/list">
			<label>类型名称:</label>
			<input type="hidden" id="homemakingServiceId" name="homemakingServiceId" value="${requestScope.PARAMS.homemakingServiceId}" />
			<input type="hidden" id="serviceTypeId" name="serviceTypeId" value="${requestScope.PARAMS.serviceTypeId}" />
			<input type="text" id="homemakingServiceName" name="homemakingServiceName" value="${requestScope.PARAMS.homemakingServiceName}" readOnly />
		
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
	          <th>价格</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowid="${item.id}" rowServiceDescriptionId="${item.serviceDescriptionId}">
				<td>${item.serviceDescriptionName}</td>
				<td>${item.price}</td>
				<td>
		          	<button class="btn btn-sm btn-info edit">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
					</button>
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
		//跳转到编辑页面
		$(".edit").on("click", function(){
			var id = $(this).parent().parent().attr("rowid");
			var serviceDescriptionId = $(this).parent().parent().attr("rowServiceDescriptionId");
			var homemakingServiceId = $("#homemakingServiceId").val();
			var serviceTypeId = $("#serviceTypeId").val();
			action("vhousekeeping/homemakingServiceManage/homemakingPriceManage/edit?id=" + id + "&serviceDescriptionId=" + serviceDescriptionId +"&homemakingServiceId=" + homemakingServiceId +"&serviceTypeId=" + serviceTypeId);
		});
		
		$(".cancel").on("click", function() {
			action("vhousekeeping/homemakingServiceManage/list");
		});
	});
</script>