<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="row">
	<div class="col-xs-12">
        <div class="page-header">
	        <h1>店铺管理<small><i class="ace-icon fa fa-angle-double-right"></i>新增店铺</small></h1>
        </div><!-- /.page-header -->
        <div class="row">
	        <div class="col-xs-12">
		        <!-- PAGE CONTENT BEGINS -->
		        <form class="form-horizontal data-form" role="form" action="" method="post" id="shop-form">
			        <!-- #section:elements.form -->
			        <div class="form-group">
				        <label class="col-sm-2 control-label no-padding-right" for="name">店铺名称</label>
				        <div class="col-sm-6">
				            <input type="text" id="name" name="name" class="form-control" placeholder="请输入店铺名称" />
				        </div>
			        </div>
			        <div class="form-group">
				        <label class="col-sm-2 control-label no-padding-right" for="type">店铺类型</label>
				        <div class="col-sm-6">
					        <select id="type" name="type" class="form-control">
						        <c:forEach var="shopType" items="${shopTypes}">
						            <c:if test="${shopType == 'ESTATE'}">
						                <option value="${shopType}"><c:out value="${shopType.name}" /></option>
						            </c:if>
						        </c:forEach>
					        </select>
				        </div>
			        </div>
			        <div class="form-group">
				        <label class="col-sm-2 control-label no-padding-right" for="category">店铺主营类目</label>
				        <div class="col-sm-6">
					        <select id="category" name="category.id" class="form-control">
						        <c:forEach var="category" items="${categories}">
							        <option value="${category.id}"><c:out value="${category.name}" /></option>
						        </c:forEach>
					        </select>
				        </div>
			        </div>
			        <div class="clearfix">
			            <div class="col-md-offset-1 col-md-9">
			                <h4><i class="ace-icon fa fa-angle-double-right"></i>添加商家用户</h4>
			            </div>
			        </div>
			        <div class="form-group">
				        <label class="col-sm-2 control-label no-padding-right" for="username">用户名</label>
				        <div class="col-sm-6">
				            <input type="text" id="username" name="username" class="form-control" placeholder="请输入商家用户名" />
				        </div>
			        </div>
			        <div class="form-group ">
				        <label class="col-sm-2 control-label no-padding-right" for="password">用户密码</label>
				        <div class="col-sm-6">
					       <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码" />
				        </div>
			        </div>
			        <div class="clearfix form-actions">
				        <div class="col-md-offset-3 col-md-9">
					        <button class="btn btn-info save" type="submit">
					            <i class="ace-icon fa fa-check bigger-110"></i> 提交
					        </button>
					        <button class="btn reset" type="reset">
						        <i class="ace-icon fa fa-refresh bigger-110"></i> 重置
					        </button>
					        <button class="btn btn-danger cancel" type="button">
						        <i class="ace-icon fa fa-undo bigger-110"></i> 返回
					        </button>
				        </div>
			        </div>
		        </form>
	        </div>
        </div>
    </div>
</div>

<script type="text/javascript">
	$(".reset").on("click", function() {
		$(".data-form").formClear();
	});

	$(".cancel").on("click", function() {
		action("vestate/ebusiness/shop/list");
	});
</script>
<script type="text/javascript">
    $(function() {
	    $("#shop-form").validate({
		    errorElement : 'div',
			errorClass : 'help-block',
			focusInvalid : true,
			ignore : '',
			rules : {
				name : {
					required : true,
					maxlength : 30
				},
				username : {
					required : true,
					maxlength : 30
				},
				password : {
					required : true,
					maxlength : 16
				}
			},
			messages : {
				name : {
					required : "请输入店铺名称"
				},
				username : {
					required : "商家用户名不能为空"
				},
				password : {
					required : "密码不能为空"
				}
			},
			highlight : function(e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},
			success : function(e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},
			submitHandler : function(form) {
				if ($("#shop-form").valid()) {
					$.businAjax(
							"${pageContext.request.contextPath}/vestate/ebusiness/shop/add/exec",
							$("#shop-form").serialize(),
							function(res) {
								$.messager.alert(res.msg, function() {
									if(res.code) {
										//提交成功,跳转回查询页面
										action("vestate/ebusiness/shop/list");
									}
								});
							}
						);
			    }
			},
		    invalidHandler : function(form) {
			}
		});
   });
</script>