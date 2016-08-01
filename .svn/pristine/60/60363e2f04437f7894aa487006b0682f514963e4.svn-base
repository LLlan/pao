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
		<form class="form-inline search_form" method="post" action="" >
			小区名称：
			<select name="vid" class="form-control" style="width:10%" >
				<option value="" <c:if test="${empty PARAMS.vid }">selected='selected'</c:if>>---请选择---</option>
				<c:forEach items="${villages }" var="village">
					<option value="${village.id }" <c:if test="${PARAMS.vid eq village.id }">selected='selected'</c:if>>${village.villageName }</option>
				</c:forEach>
			</select>
			<button type="button" class="btn btn-success btn-sm tooltip-success list">
				<i class="ace-icon glyphicon glyphicon-search"></i>查询
			</button>
			<button type="button" class="btn btn-purple btn-sm tooltip-success add">
				<i class="ace-icon glyphicon glyphicon-plus"></i>新增
			</button>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>公告类型名称</th>
	          <th>所属小区</th>
	          <th>是否启用</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	       	  <c:forEach items="${PAGE_DATA.records }" var="pageData">
	      	  		<tr>
			          <td>${pageData.typeName }</td>
			          <td>${pageData.village.villageName }</td>
			          <td>
			          	  <c:if test="${pageData.useFlag eq 'YES' }">是</c:if>
			          	  <span style="color: red"><c:if test="${pageData.useFlag eq 'NO' }">否</c:if></span>
			          </td>
			          <td>
			          	<button class="btn btn-sm btn-info edit" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
						</button>
			            <button class="btn btn-sm btn-danger remove" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120 "></i>删除
						</button>
			          </td>
	        		</tr>
	      	  </c:forEach>
	      </tbody>
	    </table>
	</div>
</div>

<tiles:insertDefinition name="vestate.base.page.definition"></tiles:insertDefinition>

<script type="text/javascript">
	$(function() {
		$(".remove").on("click", function() {
			var id = $(this).attr("fid");
			var url = "${pageContext.request.contextPath}/vestate/estate/announceTypeManage/remove/exec";
			$.messager.confirm("确定要删除吗?", function(isOk) {
				if (isOk) {
					$.businAjax(url,{"id" : id},function(res) {
						$.messager.alert(res.msg, function() {
							if(res.code) {
								//提交成功,跳转回查询页面
								common_search($("#hid_current").val());
							}
						});
					});
				}
			});
		});
		
		$(".add").on("click", function() {
			window.location.href = "${pageContext.request.contextPath}/vestate/estate/announceTypeManage/add";
		});
		$(".edit").on("click", function() {
			var id = $(this).attr("fid");
			window.location.href = "${pageContext.request.contextPath}/vestate/estate/announceTypeManage/edit?id=" + id;
		});
		
		/* $(".whld").on("click", function() {
			var id = $(this).attr("fid");
			window.location.href = "${pageContext.request.contextPath}/vestate/estate/announceTypeManage/announceList?typeId=" + id;
		}); */
		
	})
</script>