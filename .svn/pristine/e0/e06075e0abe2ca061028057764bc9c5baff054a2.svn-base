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
			小区名称:
			<select name="anTypeInfo.village.id" class="form-control" style="width:10%" >
				<option value="" <c:if test="${empty PARAMS.anTypeInfo.village.id }">selected='selected'</c:if>>---请选择---</option>
				<c:forEach items="${villages }" var="village">
					<option value="${village.id }" <c:if test="${PARAMS.anTypeInfo.village.id eq village.id }">selected='selected'</c:if>>${village.villageName }</option>
				</c:forEach>
			</select>
			公告类型:
			<select name="typeId" class="form-control" style="width:10%" >
				<option value="" >---请选择---</option>
			</select>
			公告标题:
			<input name="title" value="${PARAMS.title }" class="form-control"/>
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
	          <th>公告图片</th>
	          <th>公告标题</th>
	          <th>小区名称</th>
	          <th>公告类型</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	       	  <c:forEach items="${PAGE_DATA.records }" var="pageData">
	      	  		<tr>
	      	  		  <td>
	      	  		  	  <img style="width: 100px;height: 100px;" alt="iconPath" src="${urlPrefx }${pageData.picPath }">
	      	  		  </td>
			          <td>${pageData.title }</td>
			          <td>${pageData.anTypeInfo.village.villageName }</td>
			           <td>${pageData.anTypeInfo.typeName }</td>
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
			var url = "${pageContext.request.contextPath}/vestate/estate/announceManage/remove/exece";
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
			window.location.href = "${pageContext.request.contextPath}/vestate/estate/announceManage/add";
		});
		$(".edit").on("click", function() {
			var id = $(this).attr("fid");
			window.location.href = "${pageContext.request.contextPath}/vestate/estate/announceManage/edit?id=" + id;
		});
		
		$("select[name='anTypeInfo.village.id']").on("click", function() {
			var vid = $(this).val();
			DataSource.queryAnnounceTypeByVid(vid);
		});
		
		//初始化查询;
		if ("${PARAMS.anTypeInfo.village.id }") {
			DataSource.queryAnnounceTypeByVid("${PARAMS.anTypeInfo.village.id }");
		}
		
	});
	
	//级联查询渲染;
	var DataSource = {
			queryAnnounceTypeByVid : function(vid) {
			//数据校验;
			if (!vid) {
				return false;
			}
			var url = "${pageContext.request.contextPath}/vestate/estate/announceManage/queryAnnounceTypeByVid";
			$.ajax({
			     type: 'POST',
			     url: url ,
			     data: {"vid" : vid} ,
			     success: function(res){
			    	 if(res.code) {
						//提交成功,渲染页面
						var html = "<option value='' >---请选择---</option>";
						var typeId = "${PARAMS.typeId }";
						if (res.data.length > 0) {
							for (var i=0; i<res.data.length; i++) {
								html += "<option value="+res.data[i].id+"";
								/* if (res.data[i].id == typeId) {
									html += " selected='selected' ";
								}; */
								html += ">"+res.data[i].typeName+"</option>";	
							}
						}
						$("select[name='typeId']").empty().append(html);
						$("select[name='typeId']").val(typeId);
					 };
			     },
				 error : function() {
					alert("调用失败!");
				 }
			});
		}
	};
</script>