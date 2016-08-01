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
			<select name="village.id" class="form-control" style="width:10%" >
				<option value="" <c:if test="${empty PARAMS.village.id }">selected='selected'</c:if>>---请选择---</option>
				<c:forEach items="${villages }" var="village">
					<option value="${village.id }" <c:if test="${PARAMS.village.id eq village.id }">selected='selected'</c:if>>${village.villageName }</option>
				</c:forEach>
			</select>
			楼栋名称：
			<select name="house.id" class="form-control" style="width:10%" >
				<option value="" >---请选择---</option>
			</select>
			单元名称：
			<select name="doorPlate.id" class="form-control" style="width:10%" >
				<option value="" >---请选择---</option>
			</select>
			门牌名称：
			<select name="tenementId" class="form-control" style="width:10%" >
				<option value="" >---请选择---</option>
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
	          <th>小区名称</th>
	          <th>楼号</th>
	          <th>单元号</th>
	          <th>门牌号</th>
	          <th>缴费类型</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	       	  <c:forEach items="${PAGE_DATA.records }" var="pageData">
	      	  		<tr>
			          <td>${pageData.village.villageName }</td>
			          <td>${pageData.house.name }</td>
			          <td>${pageData.doorPlate.doorName }</td>
			          <td>${pageData.tenementName }</td>
			          <td>
			          		<c:if test="${pageData.paymentType eq 'COMPAY_1' }">物业费</c:if>
			          		<c:if test="${pageData.paymentType eq 'COMPAY_2' }">停车费</c:if>
			          </td>
			          <td>
			          	<button class="btn btn-sm btn-info edit" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120" ></i>编辑
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
			var url = "${pageContext.request.contextPath}/vestate/estate/estPaymentManage/remove/exec";
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
			action("vestate/estate/estPaymentManage/add");
		});
		$(".edit").on("click", function() {
			var id = $(this).attr("fid");
			action("vestate/estate/estPaymentManage/edit?id=" + id);
		});
		
		$("select[name='village.id']").on("click", function() {
			var vid = $("select[name='village.id']").val();
			Village.getAllCurrentHouses(vid);
		});
		
		$("select[name='house.id']").on("click", function() {
			var houseId = $("select[name='house.id']").val();
			Village.getAllCurrentCells(houseId);
		});
		
		$("select[name='doorPlate.id']").on("click", function() {
			var cellId = $("select[name='doorPlate.id']").val();
			Village.getAllCurrentDoors(cellId);
		});
		
		
		//初始化所有下拉选数据;
		if ($("select[name='village.id']").val()) {
			Village.getAllCurrentHouses($("select[name='village.id']").val());
		}
		if ($("select[name='house.id']").val()) {
			Village.getAllCurrentCells($("select[name='house.id']").val());
		}
		if ($("select[name='doorPlate.id']").val()) {
			Village.getAllCurrentDoors($("select[name='doorPlate.id']").val());
		}
		
		
	});
	
	
	
	//定义一个小区对象,做级联查询;
	var Village = {
		//当前楼栋信息
		getAllCurrentHouses : function(vid) {
			//数据校验;
			if (!vid) {
				return false;
			}
			var url = "${pageContext.request.contextPath}/vestate/estate/estPaymentManage/getAllCurrentHouses";
			$.ajax({
			     type: 'POST',
			     url: url ,
			     data: {"villageId" : vid} ,
			     async : false,
			     success: function(res){
			    	 if(res.code) {
						//提交成功,渲染页面
						var html = "<option value=''>---请选择---</option>";
						if (res.data.length > 0) {
							for (var i=0; i<res.data.length; i++) {
								html += "<option value="+res.data[i].id+">"+res.data[i].name+"</option>";
							}
						}
						$("select[name='house.id']").empty().append(html);
						$("select[name='house.id']").val("${PARAMS.house.id}");
					 };
			     },
				 error : function() {
					 $.messager.alert("error", function(){});
				 }
			});
		},
		//当前单元信息
		getAllCurrentCells : function(houseId) {
			if (!houseId) {
				return false;
			}
			var url = "${pageContext.request.contextPath}/vestate/estate/estPaymentManage/getAllCurrentCells";
			$.ajax({
			     type: 'POST',
			     url: url ,
			     data: {"houseId" : houseId} ,
			     async : false,
			     success: function(res){
			    	 if(res.code) {
						//提交成功,渲染页面
						var html = "<option value=''>---请选择---</option>";
						if (res.data.length > 0) {
							for (var i=0; i<res.data.length; i++) {
								html += "<option value="+res.data[i].id+">"+res.data[i].doorName+"</option>";
							}
						}
						$("select[name='doorPlate.id']").empty().append(html);
						$("select[name='doorPlate.id']").val("${PARAMS.doorPlate.id}");
					 };
			     },
				 error : function() {
					 $.messager.alert("error", function(){});
				 }
			});
		},
		//当前住户信息
		getAllCurrentDoors : function(cellId) {
			if (!cellId) {
				return false;
			}
			var url = "${pageContext.request.contextPath}/vestate/estate/estPaymentManage/getAllCurrentDoors";
			$.ajax({
			     type: 'POST',
			     url: url ,
			     data: {"plateId" : cellId} ,
			     success: function(res){
			    	 if(res.code) {
						//提交成功,渲染页面
						var html = "<option value=''>---请选择---</option>";
						if (res.data.length > 0) {
							for (var i=0; i<res.data.length; i++) {
								html += "<option value="+res.data[i].id+">"+res.data[i].houseNumber+"</option>";
							}
						}
						$("select[name='tenementId']").empty().append(html);
						$("select[name='tenementId']").val("${PARAMS.tenementId}");
					 };
			     },
				 error : function() {
					 $.messager.alert("error", function(){});
				 }
			});
		}
	};
	
	
</script>