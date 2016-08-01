<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row">
	<div class="col-xs-12">
		<div class="pull-left">
			<span>总记录数: &nbsp;${requestScope.PAGE.total} 条,</span>
			<span>每页显示: &nbsp;</span>
			<select id="pageSize">
				<c:forEach begin="1" end="5" var="item" varStatus="vs">
					<option value="${item*10}" <c:if test="${requestScope.PAGE.pageSize == item*10}">selected="selected"</c:if>>${item*10}</option>
				</c:forEach>
			</select>
		</div>
		<div class="pull-right">
			<ul class="pagination" style="margin:0;">
			<c:if test="${not empty requestScope.PAGE.total}">
				<c:choose>
					<c:when test="${requestScope.PAGE.current == 1}">
						<li class="disabled"><a href="javascript:void(0)" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a class="previousPage" href="javascript:void(0)" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:otherwise>
				</c:choose>
				<!-- previousPage end -->
				
				<!-- page start -->
				<c:if test="${requestScope.PAGE.pageTotal <= 5 || requestScope.PAGE.current < 3}">
					<c:forEach begin="1" end="${requestScope.PAGE.pageTotal > 5 ? 5 : requestScope.PAGE.pageTotal}" var="item" varStatus="vs">
						<li class="<c:if test="${requestScope.PAGE.current == item}">active</c:if>" ><a href="javascript:void(0);" class="goPage">${item }</a></li>
					</c:forEach>
				</c:if>
				<c:if test="${requestScope.PAGE.pageTotal > 5 && requestScope.PAGE.current >= 3}">
					<c:if test="${requestScope.PAGE.current + 2 < requestScope.PAGE.pageTotal}">
						<c:forEach begin="${requestScope.PAGE.current - 2}" end="${requestScope.PAGE.current + 2}" var="item" varStatus="vs">
							<li class="<c:if test="${requestScope.PAGE.current == item}">active</c:if>" ><a href="javascript:void(0);" class="goPage">${item }</a></li>
						</c:forEach>
					</c:if>
					<c:if test="${requestScope.PAGE.current + 2 >= requestScope.PAGE.pageTotal}">
						<c:forEach begin="${requestScope.PAGE.pageTotal - 4}" end="${requestScope.PAGE.pageTotal}" var="item" varStatus="vs">
							<li class="<c:if test="${requestScope.PAGE.current == item}">active</c:if>" ><a href="javascript:void(0);" class="goPage">${item }</a></li>
						</c:forEach>
					</c:if>
				</c:if>
				<!-- page end -->
				
				<!-- nextPage start -->
				<c:choose>
					<c:when test="${requestScope.PAGE.current == requestScope.PAGE.pageTotal}">
						<li class="disabled"><a href="javascript:void(0)" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a class="nextPage" href="javascript:void(0)" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:otherwise>
				</c:choose>
				<!-- nextPage end -->
			</c:if>
			</ul>
		</div>
	</div>
</div>
<input id="hid_current" name="current" type="hidden" value="${requestScope.PAGE.current}">
