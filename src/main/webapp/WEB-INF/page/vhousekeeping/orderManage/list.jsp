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
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vhousekeeping/orderManage/list">
			<shiro:hasPermission name="M0000011:list">
				<label>账户余额:</label>${requestScope.homemaking.balance}
				&nbsp; &nbsp; &nbsp;
				<label>姓名:</label>
				<input type="text" name="serviceUserName" value="${requestScope.PARAMS.serviceUserName}"> 
				
				<label>服务项类型:</label>
				<select id="serviceType" name="serviceType" class="form-control">
					<option value="" >全部</option>
					<c:forEach var="item" items="${requestScope.serviceTypeList}">
						<option value="${item.serviceTypeId}" <c:if test="${item.serviceTypeId == requestScope.PARAMS.serviceType}"> selected="selected"</c:if> >${item.serviceTypeName}</option>
					</c:forEach>
				</select>
				<label>订单创建时间从:</label>
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
			<shiro:hasPermission name="M0000011:add">
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
	          <th>订单号</th>
	          <th>服务项</th>
	          <th>服务人员姓名</th>
	          <th>创建时间</th>
	          <th>联系电话</th>
	          <th>详细地址</th>
	        </tr>
	      </thead>
	      <tbody>
	      	<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr rowid="${item.id}">
				<td>${item.orderNo}</td>
				<td>${item.serviceTypeName}</td>
				<td>${item.serviceUserName}</td>
				<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${item.telephone}</td>
				<td>${item.serviceAddress}</td>
	        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	</div>
</div>
<tiles:insertDefinition name="vmanage.base.page"></tiles:insertDefinition>

<script type="text/javascript">
</script>