<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%><!-- #section:basics/sidebar -->
<div id="sidebar" class="sidebar responsive">
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
	</script>

	<div class="sidebar-shortcuts" id="sidebar-shortcuts">
		<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
			<button class="btn btn-success">
			</button>

			<button class="btn btn-info">
			</button>

			<!-- #section:basics/sidebar.layout.shortcuts -->
			<button class="btn btn-warning">
			</button>

			<button class="btn btn-danger">
			</button>

			<!-- /section:basics/sidebar.layout.shortcuts -->
		</div>

		<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
			<span class="btn btn-success"></span>

			<span class="btn btn-info"></span>

			<span class="btn btn-warning"></span>

			<span class="btn btn-danger"></span>
		</div>
	</div><!-- /.sidebar-shortcuts -->

	<ul class="nav nav-list">
		<li class="" code="index">
			<a href="#" class="menu-node" nodeurl="/vmanage/core/loginManage/index" code="index">
				<i class="menu-icon fa fa-tachometer"></i>
				<span class="menu-text"> 工作台 </span>
			</a>

			<b class="arrow"></b>
		</li>
		
		<c:forEach var="item" items="${sessionScope.userInfo.menuList}">
			<shiro:hasPermission name="page:${item.code}">
				<li class="" code="${item.code}">
					<a href="#" class="dropdown-toggle" code="${item.code}">
						<i class="menu-icon ${item.logo}"></i>
						<span class="menu-text">
							${item.name}
						</span>
						<c:if test="${not empty item.subMenu}">
						<b class="arrow fa fa-angle-down"></b>
						</c:if>
					</a>
					<b class="arrow"></b>
				<c:if test="${not empty item.subMenu}">
					<ul class="submenu">
					<c:forEach var="item2" items="${item.subMenu}">
						<shiro:hasPermission name="page:${item2.code}">
							<li class="" code="${item2.code}">
								<a href="#" class="menu-node" nodeurl="${item2.path}" code="${item.code},${item2.code}">
									<i class="menu-icon fa fa-caret-right"></i>
									${item2.name}
								</a>
								<b class="arrow"></b>
							</li>
						</shiro:hasPermission>
					</c:forEach>
					</ul>
				</c:if>
			</li>
				
			</shiro:hasPermission>
		</c:forEach>
	</ul><!-- /.nav-list -->

	<!-- #section:basics/sidebar.layout.minimize -->
	<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
		<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
	</div>

	<!-- /section:basics/sidebar.layout.minimize -->
	<script type="text/javascript">
		try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
		
		$(function() {
			$(".menu-node").each(function(i) {
				if(window.location.pathname.indexOf($(this).attr("nodeurl")) > -1) {
					var _s = $(this).attr("code");
					var _arr = _s.split(",");
					for(var i=0; i<_arr.length; i++) {
						if(i != _arr.length - 1) {
							$("li[code="+_arr[i]+"]").addClass("active");
							$("li[code="+_arr[i]+"]").addClass("open");
						} else {
							$("li[code="+_arr[i]+"]").addClass("active");
						}
					}
				}
			});
			
			$(".menu-node").on("click",function() {
				var url = $(this).attr("nodeurl");
				url += "/list?tid=" + new Date().getTime();
				action(url);
			});
			
		})
	</script>
</div>
