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
			<input type="hidden" name="plateId" value="${tenement.plateId }" />
			<input type="hidden" name="houseId" value="${tenement.houseId }" />
			<input type="hidden" name="villageId" value="${tenement.villageId }" />
			门牌号名称:
			<input name="houseNumber" value="${PARAMS.houseNumber }" class="form-control"/>
			<button type="button" class="btn btn-success btn-sm tooltip-success list">
				<i class="ace-icon glyphicon glyphicon-search"></i>查询
			</button>
			<button type="button" class="btn btn-purple btn-sm tooltip-success add">
				<i class="ace-icon glyphicon glyphicon-plus"></i>新增
			</button>
			<button type="button" class="btn btn-purple btn-sm tooltip-success goBack">
				<i class="ace-icon glyphicon glyphicon-plus"></i>返回单元列表
			</button>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>住户门牌号</th>
	          <th>面积</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	       	  <c:forEach items="${PAGE_DATA.records }" var="pageData">
	      	  		<tr>
			          <td>${pageData.houseNumber }</td>
			          <td>${pageData.acreage }</td>
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
		var plateId = $("input[name='plateId']").val();
		var houseId = $("input[name='houseId']").val();
		var villageId = $("input[name='villageId']").val();
		$(".remove").on("click", function() {
			var id = $(this).attr("fid");
			var url = "${pageContext.request.contextPath}/vestate/estate/villageManage/index/tenementDel";
			$.messager.confirm("确定要删除吗?", function(r) {
				if (r) {
					$.businAjax(url,{"id" : id},function(res) {
						$.messager.alert(res.msg, function() {
							if(res.code) {
								//提交成功,跳转回查询页面
								action("vestate/estate/villageManage/tenementList?plateId="+plateId+"&houseId="+houseId+"&villageId="+villageId);
							}
						});
					});
				}
			});
		});
		
		$(".add").on("click", function() {
			action("vestate/estate/villageManage/index/tenementAdd?plateId="+plateId+"&houseId="+houseId+"&villageId="+villageId);
		});
		$(".edit").on("click", function() {
			var id = $(this).attr("fid");
			action("vestate/estate/villageManage/index/tenementEdit?id=" + id+"&houseId="+houseId+"&villageId="+villageId+"&plateId="+plateId);
		});
		
		$(".goBack").on("click", function() {
			action("vestate/estate/villageManage/plateList?houseId="+houseId+"&villageId="+villageId);
		});
	});
</script>