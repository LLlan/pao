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
        <h3 class="header smaller lighter blue">商品统计</h3>
        
        <div class="row">
	        <div class="col-xs-12">
		        <form id="search-form" class="form-inline search_form" method="POST" action="${contextPath}/vestate/ebusiness/productSku/statistics/list" >
		            <div class="form-group">
		                <label class="control-label" for="">小区:</label>
		                <select class="form-control" name=village>
		                    <option value="">-----------请选择小区----------</option>
		                    <c:forEach items="${villages}" var="village">
		                        <option value="${village.id}" <c:if test="${PARAMS.village == village.id}">selected</c:if>>${fn:trim(village.villageName)}</option>
		                    </c:forEach>
		                </select>
		            </div>
		            <div class="form-group">
		                <label class="control-label" for="">商家:</label>
		                <select class="form-control" name="shop">
		                    <option value="">-----------请选择商家----------</option>
		                    <c:forEach items="${shops}" var="shop">
		                        <option value="${shop.id}" <c:if test="${PARAMS.shop == shop.id}">selected</c:if>>${fn:trim(shop.name)}</option>
		                    </c:forEach>
		                </select>
		            </div>
		            <button type="submit" class="btn btn-primary btn-sm btn-search"><i class="ace-icon fa fa-search"></i> 查询</button>
		            <a href="${contextPath}/vestate/ebusiness/statistics/productSku/export" target="_blank" class="btn btn-grey btn-sm btn-export"><i class="ace-icon fa fa-arrow-circle-down"></i> 导出</a>
		        </form>
	        </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
	            <table class="table table-bordered">
	                <thead>
	                    <tr>
	                        <th>商家</th>
	                        <th width="60%">商品</th>
	                        <th>价格</th>
	                        <th>销量</th>
			                <th>更新时间</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach items="${PAGE_DATA}" var="productSku">
			       	       <tr>
			       	           <td>
			       	               <c:if test="${productSku.productSpu != null && productSku.productSpu.shop != null}">
			       	                   <c:if test="${productSku.productSpu.shop.avatar != null}">
			       	                       <img width="46px" src="${FILEURLPREFIX}${productSku.productSpu.shop.avatar}" />
			       	                   </c:if>
			       	                   <span><c:out value="${productSku.productSpu.shop.name}"></c:out></span>
			       	               </c:if>
			       	           </td>
			       	           <td>
			       	               <c:if test="${productSku.productSpu != null}">
			       	                   <c:if test="${productSku.productSpu.mainPicture != null}">
			       	                       <img width="46px" src="${FILEURLPREFIX}${productSku.productSpu.mainPicture}" />
			       	                   </c:if>
			       	                   <span><c:out value="${productSku.productSpu.name}" /> <c:if test="${null != productSku.model}">[<c:out value="${productSku.model}" />]</c:if></span>
			       	               </c:if>
			       	           </td>
			       	           <td><c:out value="${productSku.price}"></c:out></td>
			       	           <td><c:out value="${productSku.salesNum}"></c:out></td>
			       	           <td><fmt:formatDate value="${productSku.createTime}" pattern="yyyy-MM-dd"/></td>
			       	       </tr>
			      	  </c:forEach>
			        </tbody>
			    </table>
			    <tiles:insertDefinition name="vestate.base.page.definition"></tiles:insertDefinition>
			</div>
		</div>
	</div>
</div>