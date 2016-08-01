<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default">
	<script type="text/javascript">
		try{ace.settings.check('navbar' , 'fixed')}catch(e){}
	</script>

	<div class="navbar-container" id="navbar-container">
		<!-- #section:basics/sidebar.mobile.toggle -->
		<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>
		</button>

		<div class="navbar-header pull-left">
			<a href="#" class="navbar-brand">
				<small>
					<i class="fa fa-users"></i>
					智能运营平台
				</small>
			</a>
		</div>

		<!-- #section:basics/navbar.dropdown -->
		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<!-- #section:basics/navbar.user_menu -->
				<li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle">
						<img class="nav-user-photo" src="${pageContext.request.contextPath}/assets/avatars/avatar2.png" alt="Jason's Photo" />
						<span class="user-info">
							<small>Welcome,</small>
							<shiro:principal type="java.lang.String"/>
						</span>

						<i class="ace-icon fa fa-caret-down"></i>
					</a>

					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li>
							<a href="javascript:void(0)" class="editPassword">
								<i class="ace-icon fa fa-pencil-square-o "></i>
								修改密码
							</a>
						</li>

						<li class="divider"></li>

						<li>
							<a href="javascript:void(0)" class="login-out">
								<i class="ace-icon fa fa-power-off"></i>
								退出系统
							</a>
						</li>
					</ul>
				</li>

				<!-- /section:basics/navbar.user_menu -->
			</ul>
		</div>

		<!-- /section:basics/navbar.dropdown -->
	</div><!-- /.navbar-container -->
</div>
<script type="text/javascript">
	$(function() {
		$(".login-out").on("click", function() {
			$.messager.confirm("您要确定要退出本系统吗?", function(r) {
				if(r) {
					action("loginOut");
				}
			});
		});
		$(".editPassword").on("click", function() {
			$.messager.editPassword(function(res) {
				$.businAjax('${pageContext.request.contextPath}/vmanage/loginManage/editPassword', {oldPassword : res.oldPassword, newPassword : res.newPassword}, function(res) {
					$.messager.alert(res.msg, function() {
						if(res.code) {
							action("loginOut");
						}
					});
				});
			});
		});
	})
</script>