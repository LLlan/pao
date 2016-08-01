<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Dashboard - Ace Admin</title>

<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.css" />

<!-- 当前页自定义或独有插件样式 -->
<style>
	.search_form {
		margin-top: 5px;
		margin-bottom: 5px;
	}
</style>
<!-- 字体样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-fonts.css" />

<!-- ACE 样式 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/chosen.css" class="ace-main-stylesheet" id="main-ace-style" />


<!--[if lte IE 9]>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-part2.css" class="ace-main-stylesheet" />
<![endif]-->

<!--[if lte IE 9]>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.css" />
<![endif]-->

<!-- inline styles related to this page -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.image.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.mask.css" />
<!-- ACE settings handler -->
<script src="${pageContext.request.contextPath}/assets/js/ace-extra.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/respond.js"></script>
<![endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
	window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery.js'>"+"<"+"/script>");
</script>
<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
	if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
	var HID_BASE_PATH = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>

<!-- 额外插件文件 -->
<script src="${pageContext.request.contextPath}/assets/js/bootbox.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-ui.custom.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/spin.js"></script>
<script src="${pageContext.request.contextPath}/plugin/My97DatePicker/WdatePicker.js"></script>
<!-- 树 -->
<script src="${pageContext.request.contextPath}/assets/js/fuelux/fuelux.tree.js"></script>
<!-- jquery validation 校验相关 -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/additional-methods.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.maskedinput.js"></script>

<!-- 自定义JS-->
<script src="${pageContext.request.contextPath}/js/jquery.validate.messages.js"></script>
<script src="${pageContext.request.contextPath}/js/datagrid.js"></script>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="${pageContext.request.contextPath}/js/listener.js"></script>
<script src="${pageContext.request.contextPath}/js/messager.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<!-- ace scripts -->
<script src="${pageContext.request.contextPath}/assets/js/ace/elements.scroller.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/elements.colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/elements.fileinput.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/elements.typeahead.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/elements.wysiwyg.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/elements.spinner.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/elements.treeview.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/elements.wizard.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/elements.aside.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.ajax-content.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.touch-drag.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.sidebar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.sidebar-scroll-1.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.submenu-hover.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.widget-box.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.settings.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.settings-rtl.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.settings-skin.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.widget-on-reload.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/ace/ace.searchbox-autocomplete.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/chosen.jquery.js"></script>


<!-- 编辑器源码文件 -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/plugin/ue/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/plugin/ue/ueditor.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/plugin/ue/my.ue.initconfig.js"></script> --%>
