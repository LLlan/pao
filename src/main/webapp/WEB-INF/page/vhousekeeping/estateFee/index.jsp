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
		<form class="form-inline search_form" method="post" action="list" >
			小区名称：
			<select name="village.id" class="form-control" style="width:10%" >
				<option value="" <c:if test="${empty PARAMS.village.id }">selected='selected'</c:if>>---请选择---</option>
				<c:forEach items="${villages }" var="village">
					<option value="${village.id }" <c:if test="${PARAMS.village.id eq village.id }">selected='selected'</c:if>>${village.villageName }</option>
				</c:forEach>
			</select>
			楼栋名称：
			<select name="house.id" class="form-control" style="width:10%" >
				<option value="" >---请选择楼栋---</option>
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
	          <th>楼栋名称</th>
	          <th>费用标准(元/平方)</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	       	  <c:forEach items="${PAGE_DATA.records }" var="pageData">
	      	  		<tr>
			          <td>${pageData.village.villageName }</td>
			          <td>${pageData.house.name }</td>
			          <td>${pageData.charge }</td>
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
			var url = "${pageContext.request.contextPath}/vestate/estate/estdofeeManage/remove/exec";
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
			action("vestate/estate/estdofeeManage/add");
		});
		$(".edit").on("click", function() {
			var id = $(this).attr("fid");
			action("vestate/estate/estdofeeManage/edit?id=" + id);
		});
		
		$("select[name='village.id']").click(function() {
			var villageId = $(this).val();
			Village.queryHouseListByVid(villageId);
		});
		
		if ($("select[name='village.id']").val()) {
			Village.queryHouseListByVid($("select[name='village.id']").val());
		}
		
	});
	
	
	var Village = {
			//级联小区-- 楼栋;
			queryHouseListByVid : function(villageId) {
				if (!villageId) {
					$('#houseId').empty();
					return false;
				}
				$.ajax({
				     type: 'POST',
				     url: 'queryHouseListByVid',
				     data: {villageId:villageId},
				     dataType:"json",
				     success: function(result){
				    	 if (result.code) {
				    		 var $html = "<option value='' selected='selected'>---请选择楼栋---</option>";
				    		 var rdata = result.data;
				    		 for (var i = 0; i < rdata.length; i++) {
				    			 var house = rdata[i];
				    			 $html = $html + "<option value='" + house.id + "'>" + house.name + "</option>";
				    		 }
				    		 $("select[name='house.id']").empty().html($html);
				    		 $("select[name='house.id']").val("${PARAMS.house.id}");
				    	 }
				     }
				});
			}
		};
</script>