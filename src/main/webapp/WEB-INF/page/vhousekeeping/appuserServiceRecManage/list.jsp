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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vhousekeeping/appuserManage/appuserServiceRecManage/list">
			
			<label>姓名:</label>
			<input type="hidden" id="appuserId" name="appuserId" value="${requestScope.PARAMS.appuserId}" />
			<input type="text" id="appuserName" name="appuserName" value="${requestScope.PARAMS.appuserName}" readOnly />
			
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
	          <th>服务项</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowAppuserId="${item.appuserId}" rowServiceTypeId="${item.serviceTypeId}">
				<td>${item.serviceTypeName}</td>
				<td>
		          	<button class="btn btn-sm btn-info remove">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>删除
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
		$(".add").on("click", function(){
			var appuserId =$("#appuserId").val();
			action("vhousekeeping/appuserManage/appuserServiceRecManage/add?appuserId=" + appuserId);
		});

		//启用
		$(".remove").on("click", function(){
			var appuserId = $(this).parent().parent().attr("rowAppuserId");
			var serviceTypeId = $(this).parent().parent().attr("rowServiceTypeId");
			$.messager.confirm(
					"您确认要删除该条数据吗",
					//回调函数
					function(r) {
						//r是返回的信息，点击确认的时候为true 取消的时候为false
						if(r) {
							//当点击确认时触发
							$.businAjax(
								"${pageContext.request.contextPath}/vhousekeeping/appuserManage/appuserServiceRecManage/remove/exec",
								{"appuserId": appuserId,"serviceTypeId": serviceTypeId},
								function(res) {
									$.messager.alert(res.msg, function() {
										if(res.code) {
											//提交成功,跳转回查询页面
											action("vhousekeeping/appuserManage/appuserServiceRecManage/list?appuserId=" + appuserId);
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
		$(".cancel").on("click", function() {
			action("vhousekeeping/appuserManage/list");
		});
	});
</script>