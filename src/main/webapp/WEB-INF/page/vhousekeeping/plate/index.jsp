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
			<input type="hidden" name="houseId" value="${doorPlate.houseId }" /> <!-- 楼栋过滤单元，下级过滤 -->
			<input type="hidden" name="villageId" value="${doorPlate.villageId }" /> <!-- 单元过滤楼栋，上级过滤，跳转使用 -->
			<!-- <button type="button" class="btn btn-success btn-sm tooltip-success list">
				<i class="ace-icon glyphicon glyphicon-search"></i>查询
			</button> -->
			<button type="button" class="btn btn-purple btn-sm tooltip-success add">
				<i class="ace-icon glyphicon glyphicon-plus"></i>新增
			</button>
			<button type="button" class="btn btn-purple btn-sm tooltip-success goBack">
				<i class="ace-icon glyphicon glyphicon-plus"></i>返回楼栋列表
			</button>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>单元名称</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	       	  <c:forEach items="${PAGE_DATA.records }" var="pageData">
	      	  		<tr>
			          <td>${pageData.doorName }</td>
			          <td>
			          	<button class="btn btn-sm btn-info edit" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
						</button>
						<button class="btn btn-sm btn-info whzh" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120"></i>维护住户信息
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
		var houseId = $("input[name='houseId']").val();
		var villageId = $("input[name='villageId']").val();
		$(".remove").on("click", function() {
			var id = $(this).attr("fid");
			var url = "${pageContext.request.contextPath}/vestate/estate/villageManage/index/plateDel";
			$.messager.confirm("当前操作会删除该单元下属住户信息,确定要删除吗?", function(r) {
				if (r) {
					$.businAjax(url,{"id" : id},function(res) {
						$.messager.alert(res.msg, function() {
							if(res.code) {
								//提交成功,跳转回查询页面
								action("vestate/estate/villageManage/plateList?houseId="+houseId+"&villageId="+villageId);
							}
						});
					});
				}
			});
		});
		
		$(".add").on("click", function() {
			action("vestate/estate/villageManage/index/plateAdd?houseId="+houseId+"&villageId="+villageId);
		});
		$(".edit").on("click", function() {
			var id = $(this).attr("fid");
			action("vestate/estate/villageManage/index/plateEdit?id=" + id+"&villageId="+villageId);
		});
		
		$(".whzh").on("click", function() {
			var id = $(this).attr("fid");
			action("vestate/estate/villageManage/tenementList?plateId=" + id+"&houseId="+houseId+"&villageId="+villageId);
		});
		
		$(".goBack").on("click", function() {
			//返回对应的楼栋页面;
			action("vestate/estate/villageManage/houseList?villageId="+villageId);
		});
		
	})
</script>