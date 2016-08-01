<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="row">
	<div class="col-xs-12">
		<form class="form-inline search_form" method="post" action="" >
			报修状态:
			<select name="status" class="form-control" style="width:10%" >
				<option value="" <c:if test="${empty PARAMS.status }">selected='selected'</c:if>>---请选择---</option>
				<option value="STATUS_WAIT" <c:if test="${PARAMS.status eq 'STATUS_WAIT' }">selected='selected'</c:if>>待处理</option>
				<option value="STATUS_SEND" <c:if test="${PARAMS.status eq 'STATUS_SEND' }">selected='selected'</c:if>>已分派</option>
				<option value="STATUS_DONE" <c:if test="${PARAMS.status eq 'STATUS_DONE' }">selected='selected'</c:if>>处理完成</option>
			</select>
			<button type="button" class="btn btn-success btn-sm tooltip-success list">
				<i class="ace-icon glyphicon glyphicon-search"></i>查询
			</button>
			<!-- <button type="button" class="btn btn-purple btn-sm tooltip-success add">
				<i class="ace-icon glyphicon glyphicon-plus"></i>新增
			</button> -->
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>所属小区</th>
	          <th>保修类型</th>
	          <th>报修时间</th>
	          <th>报修状态</th>
	          <th>报修人</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	       	  <c:forEach items="${PAGE_DATA.records }" var="pageData">
	      	  		<tr>
			          <td>${pageData.village.villageName }</td>
			          <td>
			          		<c:if test="${pageData.type eq 'PERSONAGE'}">个人报修</c:if>
			          		<c:if test="${pageData.type eq 'PUBLIC'}">公共报修</c:if>
			          </td>
			          <td>
			          		<fmt:formatDate value="${pageData.createTime}" pattern="yyyy-MM-dd HH:mm:ss" />
			          </td>
			          <td style="color: red">
			          		<c:if test="${pageData.status eq 'STATUS_WAIT'}">待处理</c:if>
			          		<c:if test="${pageData.status eq 'STATUS_SEND'}">已分派</c:if>
			          		<c:if test="${pageData.status eq 'STATUS_DONE'}">处理完成</c:if>
			         </td>
			          <td>${pageData.user.username }</td>
			          <td>
			          	<button class="btn btn-sm btn-info edit" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120" ></i>编辑
						</button>
			            <%-- <button class="btn btn-sm btn-danger remove" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120 "></i>删除
						</button> --%>
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
			var url = "${pageContext.request.contextPath}/vestate/estate/repairRecordManage/remove/exec";
			$.messager.confirm("确定要删除吗?", function(isOk) {
				if (isOk) {
					$.ajax({
					     type: 'POST',
					     url: url ,
					     data: {"id" : id} ,
					     success: function(res){
					    	//弹窗提示
							$.messager.alert(res.msg, function() {
								if(res.code) {
									common_search($("#hid_current").val());
								}
							});
					     },
						 error : function() {
							 $.messager.alert("error", function(){});
						 }
					});
				}
			});
		});
		
		$(".add").on("click", function() {
			window.location.href = "${pageContext.request.contextPath}/vestate/estate/repairRecordManage/add";
		});
		$(".edit").on("click", function() {
			var id = $(this).attr("fid");
			window.location.href = "${pageContext.request.contextPath}/vestate/estate/repairRecordManage/edit?id=" + id;
		});
		
	});
</script>