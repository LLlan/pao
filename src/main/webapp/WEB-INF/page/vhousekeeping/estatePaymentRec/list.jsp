<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="row">
	<div class="col-xs-12">
		<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vestate/estate/paymentRec/list">
				<a href="${pageContext.request.contextPath}/vestate/estate/paymentRec/export" target="_blank" class="btn btn-grey btn-sm btn-export"><i class="ace-icon fa fa-arrow-circle-down"></i> 导出</a>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>小区</th>
	          <th>缴费时间</th>
	          <th>缴费时长(/月)</th>
	          <th>缴费类型</th>
	          <th>缴费人</th>
	          <th>操作人</th>
	          <th>支付方式</th>
	          <th>支付流水</th>
	        </tr>
	      </thead>
	      <tbody>
	      <c:forEach var="item" items="${PAGE.records}" varStatus="vs">
	      	<tr id="${item.id}">
	      		<td>${item.villageName}</td>
				<td><fmt:formatDate value="${item.payTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>${item.duration}</td>
				<td>${item.paymentTypeCN}</td>
				<td>${item.payUserName}</td>
				<td>${item.estateusername}</td>
				<td>${item.paymentWay}</td>
				<td>${item.serialnumber}</td>
	        </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	</div>
</div>
<tiles:insertDefinition name="vestate.base.page.definition"></tiles:insertDefinition>

<script type="text/javascript">
</script>