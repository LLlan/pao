<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
%>

<!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<div class="page-header">
		  <h1>店铺管理<small><i class="ace-icon fa fa-angle-double-right"></i> 编辑</small></h1>
		</div>
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" role="form" action="" 	id="formId" method="post">
			<input type="hidden" id="id" name="id" class="col-xs-10 col-sm-5" 	value="${PAGE_DATA.id}" />
			<input type="hidden" id="username" name="username" class="col-xs-10 col-sm-5" value="${eBusinessUser.username}"   />
			<input type="hidden" id="userId" name="userId" class="col-xs-10 col-sm-5" value="${eBusinessUser.id}"   />
				<div class="form-group">
			        <label class="col-sm-2 control-label no-padding-right" for="name">店铺名称</label>
			        <div class="col-sm-6">
			            <input type="text" id="name" name="name" class="form-control" value="${PAGE_DATA.name }"/>
			        </div>
				 </div>
		        <div class="form-group">
			        <label class="col-sm-2 control-label no-padding-right" for="type">店铺类型</label>
			        <div class="col-sm-6">
				        <select id="type" name="type" class="form-control"   disabled="disabled">
					        <c:forEach var="shopType" items="${shopTypes}">
						        <option value="${shopType}" <c:if  test="${PAGE_DATA.type==shopType}">  selected="selected"</c:if>>${shopType.name }</option>
					        </c:forEach>
				        </select>
			        </div>
		        </div>
		        <div class="form-group">
			        <label class="col-sm-2 control-label no-padding-right" for="category">店铺主营类目</label>
			        <div class="col-sm-6">
				    <select id="c" name="c"   class="form-control" >
						<c:forEach var="p" items="${productCategory}">
							<option value="${p.id}" <c:if test="${p.id== PAGE_DATA.category.id}" >selected="selected"</c:if>>${p.name}</option>
						</c:forEach>
					</select>
			        </div>
		        </div>
		        <div class="clearfix">
		            <div class="col-md-offset-1 col-md-9">
		                <h4><i class="ace-icon fa fa-angle-double-right"></i>编辑商家用户</h4>
		            </div>
		        </div>
		        <div class="form-group">
			        <label class="col-sm-2 control-label no-padding-right" for="username">用户名</label>
			        <div class="col-sm-6">
			            <input type="text" id="username" name="username" class="form-control" value="${eBusinessUser.username}"   disabled="disabled"/>
			        </div>
		        </div>
		        <div class="form-group ">
			        <label class="col-sm-2 control-label no-padding-right" for="password1">用户密码</label>
			        <div class="col-sm-6">
				       <input type="password" id="password" name="password" class="form-control" />
			        </div>
		        </div>
				<div class="clearfix form-actions">
					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info save" type="submit" id="b">
							<i class="ace-icon fa fa-check bigger-110"></i> 提交
						</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn reset" type="reset">
							<i class="ace-icon fa fa-refresh bigger-110"></i> 重置
						</button>
						&nbsp; &nbsp; &nbsp;
						<button class="btn btn-danger cancel" type="button" onclick="history.back(-1)">
							<i class="ace-icon fa fa-undo bigger-110"></i> 返回
						</button>
					</div>
				</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(".reset").on("click", function() {
		$(".data-form").formClear();
	});

	$(function(){
		$("#formId").validate(
				{
					errorElement : 'div',
					errorClass : 'help-block',
					focusInvalid : true,
					ignore : '',
					rules : {
						name : {
							required : true,
							maxlength : 15

						},
						notice : {
							required : true,
							maxlength : 30
						},
						grade : {
							required : true,
							maxlength : 3
						}

					},
					messages : {
						name : {
							required : "请输入店铺名称"
						},

						notice : {
							required : "公告不能为空"
						},
						grade : {
							required : "等级不能为空"

						}
					},
					highlight : function(e) {
						$(e).closest('.form-group').removeClass(
								'has-info').addClass('has-error');
					},
					success : function(e) {
						$(e).closest('.form-group').removeClass(
								'has-error');//.addClass('has-info');
						$(e).remove();
					},
					submitHandler : function(form) {

						if ($("#formId").valid()) {
						  var url = "${pageContext.request.contextPath}/vestate/ebusiness/shop/edit/exec";
							$.businAjax(
									url,
									$("#formId").serialize(),
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