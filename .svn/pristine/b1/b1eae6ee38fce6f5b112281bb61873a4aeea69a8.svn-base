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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vestate/estate/estateAdvManage/list">
			<shiro:hasPermission name="M1000004:list">
				<label>广告标题:</label>
				<input type="text" name="title" value="${requestScope.PARAMS.title }"> 
				<label>是否显示:</label>
				<select id="useFlag" name="useFlag" class="form-control">
					<option value="" >全部</option>
					<c:forEach var="item" items="${requestScope.useFlags}">
						<option value="${item}" <c:if test="${item == requestScope.PARAMS.useFlag}"> selected="selected"</c:if> >${item.name}</option>
					</c:forEach>
				</select>
				<button type="button" class="btn btn-success btn-sm tooltip-success list">
					<i class="ace-icon glyphicon glyphicon-search"></i>查询
				</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="M1000004:add">
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
	          <th>广告标题</th>
	          <th>图片</th>
	          <th>权重</th>
	          <th>小区名称</th>
	          <th>是否显示</th>
	          <th></th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowid="${item.id}">
				<td>${item.title}</td>
				<td>
					<img class="editable img-responsive editable-click editable-empty custom-image" alt="picUrl" src="${requestScope.urlPrefx}${item.picUrl}"></img>
				</td>
				<td>${item.sortno}</td>
				<td>${item.village.villageName}</td>
				<td>
					<c:forEach var="item2" items="${requestScope.useFlags}">
						<c:if test="${item.useFlag == item2}"> ${item2.name}</c:if>
					</c:forEach>
				</td>
				<td>
				<shiro:hasPermission name="M1000004:edit">
		          	<button class="btn btn-sm btn-info edit">
						<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="M1000004:remove">
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
				action("/vestate/estate/estateAdvManage/add");
			});
		}
		//删除
		if ($(".remove")) {
			$(".remove").on("click", function(){
				var id = $(this).parent().parent().attr("rowid");
				$.messager.confirm(
						"确定要删除该广告吗?",
						//回调函数
						function(r) {
							//r是返回的信息，点击确认的时候为true 取消的时候为false
							if(r) {
								//当点击确认时触发
								$.businAjax(
									"${pageContext.request.contextPath}/vestate/estate/estateAdvManage/remove/exec",
									{"id": id},
									function(res) {
										$.messager.alert(res.msg, function() {
											if(res.code) {
												//提交成功,跳转回查询页面
												action("/vestate/estate/estateAdvManage/list");
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
				action("/vestate/estate/estateAdvManage/edit?id=" + id);
			});
		}
	});
</script>