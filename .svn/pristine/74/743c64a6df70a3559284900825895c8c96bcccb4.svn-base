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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vmanage/systemMessageManage/list">
			<shiro:hasPermission name="M0000012:list">

				<label>创建时间从:</label>
   				<input  type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" 
   				value='<fmt:formatDate value="${requestScope.PARAMS.cTime1}" pattern="yyyy-MM-dd"/>'
   				name='cTime1' />
				<label>到:</label>
   				<input  type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" 
   				value='<fmt:formatDate value="${requestScope.PARAMS.cTime2}" pattern="yyyy-MM-dd"/>'
   				name='cTime2' />
   				
				<button type="button" class="btn btn-success btn-sm tooltip-success list">
					<i class="ace-icon glyphicon glyphicon-search"></i>查询
				</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="M0000012:add">
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
	          <th>推送类型</th>
	          <th>内容</th>
	          <th>创建时间</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowid="${item.id}">
				<td>
					<c:if test="${item.tipType == 7}">业主</c:if>
					<c:if test="${item.tipType == 8}">维修工</c:if>
				</td>
				<td>${item.content}</td>
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
			action("vmanage/systemMessageManage/add");
		});
		
	});
</script>