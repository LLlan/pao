<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
	<div class="col-xs-12">
	    <h3 class="header smaller lighter blue">订单详情</h3>
        
        <div class="row">
        <div class="col-xs-12 col-sm-12 widget-container-col">
	        <!-- #section:custom/widget-box -->
	        <div class="widget-box">
		        <div class="widget-header">
			        <h5 class="widget-title">订单信息</h5>
		        </div>
		        <div class="widget-body">
			        <div class="widget-main">
			            <div class="col-xs-12">
			                <span clas="col-xs-2">订单号：</span>
			                <span><c:out value="${productOrder.orderNo}"/></span>
			            </div>
			            <div class="col-xs-12">
			                <span clas="col-xs-2">订单状态：</span>
			                <span>
			                    <c:if test="${productOrder.status=='WAITFORAPPROVE'}" >等待审核</c:if>
			                    <c:if test="${productOrder.status=='CONFIRMED'}" >已确认</c:if>
			                    <c:if test="${productOrder.status=='SUCCESSFUL_TRADE'}" >交易成功</c:if>
			                    <c:if test="${productOrder.status=='FAILED_TRADE'}" >等待审核</c:if>
			                    <c:if test="${productOrder.status=='CANCEL'}" >取消订单</c:if>
			                    <c:if test="${productOrder.status=='DELETE'}" >删除订单</c:if>
			                    
			                    <c:if test="${productOrder.paymentStatus=='NOTPAID'}">未付款</c:if>
				                <c:if test="${productOrder.paymentStatus=='PAID'}">已付款</c:if>
				                <c:if test="${productOrder.paymentStatus=='PAYONDELIVERY'}">货到付款</c:if>
				                <c:if test="${productOrder.paymentStatus=='FAILEDPAID'}">付款失败</c:if>
			                </span>
			            </div>
			            <div class="col-xs-12">
			                <span clas="col-xs-2">收货地址：</span>
			                <span>
			                    <c:out value="${productOrder.contacterName}"/>,
			                    <c:out value="${productOrder.contacterPhone}"/>,
			                    <c:out value="${productOrder.deliveryAddress}"/>, 
			                    <c:out value="${productOrder.deliveryPostalCode}"/>
			                </span>
			            </div>
			            <div class="col-xs-12">
			                <span clas="col-xs-2">买家留言：</span>
			                <span>
			                    <c:choose>
			                        <c:when test="${productOrder.leaveWords != null and productOrder.leaveWords != ''}">
			                            <c:out value="${productOrder.leaveWords}"></c:out>
			                        </c:when>
			                        <c:otherwise>-</c:otherwise>
			                    </c:choose>
			                </span>
			            </div>
			            <div class="col-xs-12">
			                <span clas="col-xs-2">下单时间：</span>
			                <span><fmt:formatDate value="${productOrder.orderingTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
			            </div>
			            <div class="clearfix"></div>
			        </div>
			    </div>
			</div>
		</div>
	    <!-- /section:custom/widget-box -->
        </div>
        
        <div class="row">
            <div class="col-xs-12 col-sm-12 widget-container-col">
	            <!-- #section:custom/widget-box -->
	            <div class="widget-box">
		            <div class="widget-header">
			            <h5 class="widget-title">商品信息</h5>
			        </div>
		            <div class="widget-body">
			            <div class="widget-main">
				            <table class="table table-responsive table-striped">
					            <thead>
					                <tr>
						                <th>商品名称</th>
						                <th>价格</th>
						                <th>购买数量</th>
					                </tr>
					            </thead>
					            <tbody>
						            <c:forEach var="productOrderSku" items="${productOrder.productOrderSkus}">
							            <tr>
								            <td>
								                <c:if test="${productOrderSku.productSku.productSpu.mainPicture != null and productOrderSku.productSku.productSpu.mainPicture != ''}">
								                    <img width="46px" alt="商品图片" src="${FILEURLPREFIX}${productOrderSku.productSku.productSpu.mainPicture}" />
								                </c:if>
								                <c:out value="${productOrderSku.productSku.productSpu.name}"></c:out>
								            </td>
								            <td><fmt:formatNumber type="currency" currencySymbol="￥" value="${productOrderSku.unitPrice}" /></td>
								            <td>${productOrderSku.purchaseNum}</td>
								        </tr>
								    </c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
            <div class="col-xs-12 col-sm-12 widget-container-col">
	            <!-- #section:custom/widget-box -->
	            <div class="widget-box">
		            <div class="widget-header">
			            <h5 class="widget-title">订单操作明细</h5>
		            </div>
		            <div class="widget-body">
			            <div class="widget-main">
				            <table class="table table-responsive table-striped">
				                <thead>
				                    <tr>
						                <th>操作类型</th>
						                <th>操作时间</th>
						                <th>操作人信息</th>
						                <th>订单操作明细</th>
					                </tr>
				                </thead>
					            <tbody>
						            <c:forEach var="item" items="${productOrder.operateRecs}">
							            <tr>
								            <td> 
								                <c:if  test="${item.operateType=='ORDERING' }">用户下单</c:if> 
								                <c:if  test="${item.operateType=='PAYING' }">用户付款</c:if>
								                <c:if  test="${item.operateType=='PAYONDELIVERY' }">用户货到付款</c:if>        
								                <c:if  test="${item.operateType=='CONFIRM' }">订单确认</c:if>        
								                <c:if  test="${item.operateType=='ASSEMBLY' }">配货</c:if>        
								                <c:if  test="${item.operateType=='DELIVER' }">订单发货</c:if>        
								                <c:if  test="${item.operateType=='RECEIVE' }">确认收货</c:if>        
								                <c:if  test="${item.operateType=='FINISH' }">订单完成</c:if>
								                <c:if  test="${item.operateType=='CANCLE' }">取消订单</c:if>   
							                    <c:if  test="${item.operateType=='RETURN' }">退货</c:if>                       
								                <c:if  test="${item.operateType=='DELETE' }">删除订单</c:if>
								            </td>
								            <td><fmt:formatDate value="${item.operateTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								            <td>${item.user.username }</td>
								            <td>${item.description }</td>
							            </tr>
							        </c:forEach>
							    </tbody>
							</table>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
		<div class="clearfix form-actions">
		    <div class="col-md-9">
		        <button class="btn btn-primary cancel" type="button">
			        <i class="ace-icon fa fa-undo bigger-110"></i> 返回
		        </button>
	        </div>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(function(){
    	$('.cancel').click(function(){
    		location.href = '${contextPath}/vestate/ebusiness/productOrder/statistics/list' + ('${currentPage}' ? '?current=${currentPage}' : '');
    	});
    });
</script>