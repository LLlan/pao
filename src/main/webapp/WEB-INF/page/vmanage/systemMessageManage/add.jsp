<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 自定义样式 -->
<h3 class="header smaller lighter blue">基本信息</h3>

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" enctype="multipart/form-data" role="form" action="${pageContext.request.contextPath}/vmanage/systemMessageManage/add/exec" method="post" valid="true">
			<!-- #section:elements.form -->
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="content"> 通知内容 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text"  placeholder="通知内容" class="col-xs-10 col-sm-5" id="content" name="content"/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="content"> 推送类型 </label>
				<div class="col-sm-9">
					<div class="clearfix">
						<select id="tipType" name="tipType" class="form-control">
							<option value="7">业主</option>
							<option value="8">维修工</option>
						</select>
					</div>
				</div>
			</div>
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info save" type="button">
						<i class="ace-icon fa fa-check bigger-110"></i>
						提交
					</button>
			
					&nbsp; &nbsp; &nbsp;
					<button class="btn reset" type="button">
						<i class="ace-icon fa fa-refresh bigger-110"></i>
						重置
					</button>
					
					&nbsp; &nbsp; &nbsp;
					<button class="btn btn-danger cancel" type="button">
						<i class="ace-icon fa fa-undo bigger-110"></i>
						取消
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fuelux.tree.custom.js"></script>
<script type="text/javascript">
	$(function() {
		$(".data-form").validate({
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			rules: {
				content: {
					required: true,
					maxlength: 100
				}
			},
			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},
			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},
			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			},
			submitHandler: function (form) {
			},
			invalidHandler: function (form) {
			}
		});
		
		$(".save").on("click",function(){
			$(".data-form").form({
				success:function(res) {
					//弹窗提示
					$.messager.alert(res.msg, function() {
						if(res.code == 'R0000000') {
							//提交成功,跳转回查询页面
							action("vmanage/systemMessageManage/list");
						}
					});
				}
			});
		});
		
		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});
		
		$(".cancel").on("click", function() {
			action("vmanage/systemMessageManage/list");
		});

	});

</script>