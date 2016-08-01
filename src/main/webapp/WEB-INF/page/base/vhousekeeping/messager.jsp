<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div id="hide-dialog-message" class="hide">
</div>

<div id="hide-dialog-confirm" class="hide">
	<div class="alert alert-info bigger-110">
	</div>

	<div class="space-6"></div>

	<p class="bigger-110 bolder center grey">
		<i class="ace-icon fa fa-hand-o-right blue bigger-120"></i>
		你确定要继续操作吗?
	</p>
</div>