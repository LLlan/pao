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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vestate/estate/estatePayment/list">
			<shiro:hasPermission name="M1000019:add">
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
	          <th>物业公司名称</th>
	          <th>支付方式名称</th>
	          <th>支付方式编码</th>
	          <th></th>
	        </tr>
	      </thead>
	      <tbody>
	      <c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr id="${item.id}">
				<td>${item.estate.communtyName}</td>
				<td>${item.payment.name}</td>
				<td>${item.payment.code}</td>
				<td>
				<shiro:hasPermission name="M1000019:edit">
		          	<button class="btn btn-sm btn-info edit">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="M1000019:remove">
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
<tiles:insertDefinition name="vestate.base.page.definition"></tiles:insertDefinition>

<script type="text/javascript">
	$(function(){
		$(".add").on("click",function(){
			action("vestate/estate/estatePayment/add");
		});
	});
	
	//删除
	if ($(".remove").length > 0) {
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
								"${pageContext.request.contextPath}/vestate/estate/estatePayment/remove/exec",
								{"id": id},
								function(res) {
									$.messager.alert(res.msg, function() {
										if(res.code) {
											//提交成功,跳转回查询页面
											action("vestate/estate/estatePayment/list");
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
	if ($(".edit").length > 0) {
		$(".edit").click(function(){
			var id = $(this).parent().parent().attr("id");
			action("vestate/estate/estatePayment/edit?id="+id);
		});
	}
</script>