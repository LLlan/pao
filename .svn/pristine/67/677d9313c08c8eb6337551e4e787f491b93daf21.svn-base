<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/themes/login/vmanage/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.mask.css" />
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery.js'>"+"<"+"/script>");
			var HID_BASE_PATH = "${pageContext.request.contextPath}";
		</script>
		<!-- <![endif]-->
		
		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
	</head>
	<body>
		<tiles:insertAttribute name="body"></tiles:insertAttribute>
	</body>
	<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
	<script src="${pageContext.request.contextPath}/js/listener.js"></script>
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/spin.js"></script>
</html>

