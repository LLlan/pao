<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
	<div class="col-xs-12">
        <h3 class="header smaller lighter blue">商品订单统计</h3>
        
        <div class="row">
	        <div class="col-xs-12">
		        <form id="search-form" class="form-inline search_form" method="POST" action="${contextPath}/vestate/ebusiness/productOrder/statistics/list" >
		            <div class="form-group">
		                <label class="control-label" for="">商家:</label>
		                <select class="form-control" name="shop">
		                    <option value="">-----------请选择商家----------</option>
		                    <c:forEach items="${shops}" var="shop">
		                        <option value="${shop.id}" <c:if test="${PARAMS.shop == shop.id}">selected</c:if>>${fn:trim(shop.name)}</option>
		                    </c:forEach>
		                </select>
		            </div>
		            <div class="form-group">
			            <label class="control-label">订单号:</label>
			            <input type="text" name="orderNo" class="form-control" value="${PARAMS.orderNo}" />
			        </div>
			        <div class="form-group">
			            <label class="control-label">下单时间:</label>
			            <input type="text" name="startDate" id="startDate" class="date-picker" value="${PARAMS.startDate}" /> 至 <input type="text" name="endDate" id="endDate" class="date-picker" value="${PARAMS.endDate}" />
			        </div>
			        <div class="form-group">
			            <label class="control-label">状态:</label>
			            <select name="orderStatus">
			                <option value="">全部</option>
			                <option value="WAITFORAPPROVE-NOTPAID-" <c:if test="${PARAMS.orderStatus == 'WAITFORAPPROVE-NOTPAID-'}">selected</c:if>>待付款</option>
			                <option value="CONFIRMED--ASSEMBLY" <c:if test="${PARAMS.orderStatus == 'CONFIRMED--ASSEMBLY'}">selected</c:if>>待发货</option>
			                <option value="CONFIRMED--DELIVERED" <c:if test="${PARAMS.orderStatus == 'CONFIRMED--DELIVERED'}">selected</c:if>>已发货</option>
			                <option value="SUCCESSFUL_TRADE--DELIVERED" <c:if test="${PARAMS.orderStatus == 'SUCCESSFUL_TRADE--DELIVERED'}">selected</c:if>>已完成</option>
			            </select>
			        </div>
		            <button type="submit" class="btn btn-primary btn-sm btn-search"><i class="ace-icon fa fa-search"></i> 查询</button>
		        </form>
	        </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
	            <table class="table table-bordered">
	                <thead>
	                    <tr>
	                        <th>订单号</th>
					        <th>收货人</th>
					        <th>订单金额</th>
					        <th>下单时间</th>
					        <th>状态</th>
					        <th></th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="productOrder" items="${PAGE_DATA}">
					        <tr data-id="${productOrder.id}">
						        <td>${productOrder.orderNo}</td>
						        <td>${productOrder.contacterName}</td>
						        <td>${productOrder.payAmount}</td>
						        <td><fmt:formatDate value="${productOrder.orderingTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						        <td>
						            <c:if test="${productOrder.paymentStatus=='NOTPAID'}">待付款&nbsp;</c:if>
							        <c:if test="${productOrder.paymentStatus=='PAID'}">已付款&nbsp;</c:if> 
							        <c:if test="${productOrder.paymentStatus=='PAYONDELIVERY'}">货到付款&nbsp;</c:if>
							        <c:if test="${productOrder.status=='CONFIRMED'}">已确认订单&nbsp;</c:if>
							        <c:if test="${productOrder.deliveryStatus=='ASSEMBLYING' or item.deliveryStatus=='ASSEMBLY'}">待发货&nbsp;</c:if>
							        <c:if test="${productOrder.deliveryStatus=='DELIVERED'}">已发货&nbsp;</c:if>
							        <c:if test="${productOrder.status=='SUCCESSFUL_TRADE'}">交易已完成&nbsp;</c:if>
						        </td>
						        <td><a class="detail" href="${contextPath}/vestate/ebusiness/productOrder/statistics/detail?id=${productOrder.id}&currentPage=${PAGE.current}">订单详情</a></td>
					        </tr>
				        </c:forEach>
			        </tbody>
			    </table>
			    <tiles:insertDefinition name="vestate.base.page.definition"></tiles:insertDefinition>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="${contextPath}/assets/js/date-time/bootstrap-datepicker.js"></script>
<script type="text/javascript">
$(function(){
	//日期选择
	$('.date-picker').datepicker({
		autoclose : true,
		todayHighlight : true
	});
	
	$('.btn-search').click(function() {
	    var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		if(startDate && endDate){
			if(Date.parse(endDate) < Date.parse(startDate)){
				$.messager.alert('请正确选择下单时间, 结束时间不能小于开始时间', function(){});
				return false;
			}
		}
	});
});
</script>