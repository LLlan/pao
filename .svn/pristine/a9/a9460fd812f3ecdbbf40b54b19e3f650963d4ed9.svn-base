<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
		<tiles:insertAttribute name="css-js"></tiles:insertAttribute>
	</head>
	<body class="no-skin">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<tiles:insertAttribute name="menu"></tiles:insertAttribute>
			
			<div class="main-content">
				<div class="main-content-inner">
						<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>
					</div>
					
					<div class="page-content">
						<tiles:insertAttribute name="body"></tiles:insertAttribute>
					</div>
				</div>
			</div>
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>
		</div><!-- /.main-container -->
	</body>
</html>

