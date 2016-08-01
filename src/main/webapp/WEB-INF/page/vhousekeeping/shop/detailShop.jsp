<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vestate/ebusiness/shop/detail">
<input type="hidden" id="imgPath" value="${FILEURLPREFIX}">
<input type="hidden" id="id" name="id" class="col-xs-10 col-sm-5"  value="${shop.id}" /> <input type="hidden" id="type" name="type" class="col-xs-10 col-sm-5" value="${type}" />
<div class="row">
	<div class="col-xs-12">
		<c:if test="${type=='0' }"> <div class="page-header"> <h1>店铺详情</h1></div> </c:if>
		<c:if test="${type=='1' }"> <div class="page-header"> <h1>商品展示</h1></div></c:if>
	    <c:if test="${type=='2' }"> <div class="page-header">  <h1>评价信息</h1></div> </c:if>
			<!-- PAGE CONTENT BEGINS -->
		<div class="row">
			<div class="col-sm-12">
					<!-- #section:elements.tab -->
				<div class="tabbable">
					<ul id="myTab" class="nav nav-tabs">
						<c:choose>
							<c:when test="${ '0'== type}"><li class="active"><a href="#" id="shop" data-toggle="tab">店铺详情</a></li></c:when>
							<c:otherwise><li><a href="#" id="shop" data-toggle="tab">店铺详情 </a></li></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${ '1'== type}"><li class="active"><a href="#" id="product" data-toggle="tab">商品展示</a></li></c:when>
							<c:otherwise><li><a href="#" id="product" data-toggle="tab">商品展示</a></li></c:otherwise>
						</c:choose>	
						<c:choose>
							<c:when test="${ '2'== type}"><li class="active"><a href="#" id="comment"	data-toggle="tab">评价信息</a></li></c:when>
							<c:otherwise><li><a href="#" id="comment" data-toggle="tab">评价信息</a></li></c:otherwise>
						</c:choose>	
					</ul>		
					<c:if test="${'0' == type }">
							<!-- 店铺详情 -->
							<div id="shopDetail" style="margin-left: -50px">
								<input type="hidden" id="id" name="id" class="col-xs-10 col-sm-5" value="${shop.id}" />
								<input	 type="hidden" id="merchant" name="merchant" class="col-xs-10 col-sm-5" value="${shop.merchant}" />
								<div class="row" style="padding: 20px 10px;">
									<div class="col-xs-12">
										<div class="clearfix"></div>
										<div class="hr dotted"></div>
										<div>
											<div class="col-xs-12 col-sm-3 center">
												<!-- #section:pages/profile.picture -->
												<span class="profile-picture"> 
												<c:choose>
														<c:when test="${null != shop.avatar && shop.avatar != ''}">
															<img id="avatar" width="180px;" class="img-responsive" alt="我的店铺" src="${FILEURLPREFIX}${shop.avatar}" />
														</c:when>
														<c:otherwise></c:otherwise>
												</c:choose>
												</span>
												<!-- /section:pages/profile.picture -->
												<div class="space-4"></div>

												<div
													class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
													<div class="inline position-relative">
														<a href="#" class="user-title-label dropdown-toggle"
															data-toggle="dropdown"> <span class="white">${shop.name}</span>
														</a>
													</div>
												</div>
											</div>
											<div class="col-xs-12 col-sm-9">
												<!-- #section:pages/profile.info -->
												<div class="profile-user-info profile-user-info-striped">
													<div class="profile-info-row">
														<div class="profile-info-name">店铺等级</div>
														<div class="profile-info-value">
															<span class="">
																<c:if  test="${ shop.grade!=null  and shop.grade!='' }">
						        								<c:forEach var="i" begin="1" end="${shop.grade}">
																	<i data-alt="2" class="star-on-png" title="poor"></i>   
																</c:forEach>
						      									</c:if>
						      								</span>
														</div>
													</div>
													<div class="profile-info-row">
														<div class="profile-info-name">主营类目</div>
														<div class="profile-info-value">
															<span class=""><c:out value="${shop.category.name}" /></span>
														</div>
													</div>
													<div class="profile-info-row">
														<div class="profile-info-name">店铺公告</div>
														<div class="profile-info-value">
															<span class=""><c:out value="${shop.notice}" /></span>
														</div>
													</div>
													<div class="profile-info-row">
														<div class="profile-info-name">实体店地址</div>
														<div class="profile-info-value">
															<span class=""><i class="fa fa-map-marker light-orange bigger-110"></i> <c:out value="${shop.address}" /></span>
														</div>
													</div>
													<div class="profile-info-row">
														<div class="profile-info-name">营业时间</div>
														<div class="profile-info-value">
															<span class=""><c:out value="${shop.startBusinessTime}" /> - <c:out value="${shop.endBusinessTime}" /></span>
														</div>
													</div>
													<div class="profile-info-row">
														<div class="profile-info-name">客服电话</div>
														<div class="profile-info-value">
															<span class=""><c:out value="${shop.servicePhone}" /></span>
														</div>
													</div>
													<div class="profile-info-row">
														<div class="profile-info-name">入驻时间</div>
														<div class="profile-info-value">
															<span class=""><fmt:formatDate value="${shop.createTime}" pattern="yyyy-MM-dd" /></span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 店铺详情结束 -->
						</c:if>				
						<c:if test="${'1' == type }">
							<!-- 展示商品列表 -->
							<div id="productDetail">
								<c:if test="${ not empty  PAGE.records}">
									<table class="table table-bordered  table-striped" style="margin: 0;">
										<thead>
											<tr>
												<th>商品名称</th>
												<th>商品存储量</th>
												<th>商品描述</th>
												<th>商品价格</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
												<tr id="${item.id}">
													<td><img width="60px" height="60px" src="${FILEURLPREFIX}${item.mainPicture}">${item.name}</td>
													<td>${item.stock }</td>
													<td>${item.description }</td>
													<td>${item.price }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${ empty  PAGE.records}">

									<table class="table table-bordered" style="background-color: #F2F6F9;height:300px">
										<thead></thead>
										<tbody>
											<tr>
												<td style="width：300px"><span  style="color:#6FB3E0;font-weight: bold;font-size: 20px">该店铺还没有商品呢！</span></td>
											</tr>
										</tbody>
									</table>
								</c:if>
								<tiles:insertDefinition name="vmanage.base.page"></tiles:insertDefinition>
							</div>
							<!-- 结束 展示商品列表-->
						</c:if>
						<c:if test="${'2' == type }">
							<!-- 展示评论列表 -->
							<div id="commentDetail">
								<c:if test="${ not empty  PAGE.records}">
									<table class="table table-bordered  table-striped" style="margin: 0;">
										<thead>
											<tr>
												<th>评价信息</th>
												<th>评价人</th>
												<th>宝贝信息</th>
												<th>评价时间</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${PAGE.records}" varStatus="vs">
												<tr id="${item.id}">
													<td><a class="queryImg" style="text-decoration: underline;"   href="#none">${item.appraise_content}</a></td>
													<td>${item.appraiser.username }</td>
													<td><img width="40px" height="40px" src="${fileUrlPrefix}${item.product.mainPicture}"></img>${item.product.name }</td>
													<td><fmt:formatDate value="${item.appraise_time }" 	pattern="yyyy-MM-dd HH:mm:ss" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${ empty  PAGE.records}">
									<table class="table table-bordered"  style="background-color: #F2F6F9;height:300px">
										<thead></thead>
										<tbody>
											<tr>
												<td style="width：300px"><span style="color:#6FB3E0;font-weight: bold;font-size: 20px">该店铺还没有评论呢！</span></td>
											</tr>
										</tbody>
									</table>
								</c:if>
								<tiles:insertDefinition name="vmanage.base.page"></tiles:insertDefinition>
							</div>
							<!-- 结束展示评论列表 -->
						</c:if>
					</div>
				</div>
				<!-- /section:elements.tab -->
			</div>
			<!-- /.col -->
		</div>
	</div>
</form>
<div class="clearfix form-actions">
	<div class="col-md-offset-3 col-md-9">
		<button class="btn btn-info cancel" type="button" id="back"  ><i class="ace-icon fa fa-undo bigger-110"></i> 返回</button>
	</div>
</div>

<script type="text/javascript">
	
	$("#shop").click(function() {
						var id = $("#id").val();
						var type = "0";
						location.href = "${pageContext.request.contextPath}/vestate/ebusiness/shop/detail?id="
								+ id + "&type=" + type;
					});
	$("#back").click(function() {
		location.href = "${pageContext.request.contextPath}/vestate/ebusiness/shop/list";
	});

	$("#product").click(function() {
						var id = $("#id").val();
						var type = "1";
						location.href = "${pageContext.request.contextPath}/vestate/ebusiness/shop/detail?id="
								+ id + "&type=" + type;
					});
	$("#comment").click(function() {
						var id = $("#id").val();
						var type = "2";
						location.href = "${pageContext.request.contextPath}/vestate/ebusiness/shop/detail?id="
								+ id + "&type=" + type;
					});

	$(".queryImg").click(function() {
						var id = $(this).parent().parent().attr("id");
						var url = "${pageContext.request.contextPath}/vestate/ebusiness/evaluation/queryProductAappraiseFile";
						$.businAjax(
								url,
								{"id" : id},
								function(result) {
										if(result.code) {
											//提交成功,跳转回查询页面
											bootbox.dialog({
												title : "评论的图片",
												message : "<div class=' ' style='margin-top:10px;width:450px'>"
														+ "<form class='form-horizontal' role='form'>"
														+ "<div class='form-group'>"
														+ "<div  id='imgDiv' style='margin-left:24px;width:450px'  >"
														+ "</div>"
														+ "</form>"
														+ "</div>"
											});
											var temp = result.data;
											var html = "";
											var imgPath = $("#imgPath").val();
											if (temp == "") {
												html = "<h3  style='color:#6FB3E0'>还没有上传评价的图片哦！</h3>";
											} else {
												for (var i = 0; i < temp.length; i++) {
		
													if (temp[i].file != null
															&& temp[i].file != "") {
														html += "<div><img  width='540px' height='350px'  src="+imgPath+temp[i].file+"> <div><br/>";
													} else {
		
														html = "<h3>还没有上传评价的图片哦！</h3>";
													}
		
												}
		
											}
		
											$("#imgDiv").html(html);
										}
									
								}
							);

					});
</script>