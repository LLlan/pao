<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- /.page-header -->
<h3 class="header smaller lighter blue">编辑住户信息</h3>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" role="form" valid="true" action="doTenementEdit">
			<input type="hidden" name='id' value="${PAGE_DATA.id }">
			<!-- #section:elements.form -->
			<input type="hidden" name="plateId" value="${tenement.plateId }" />
			<input type="hidden" name="houseId" value="${tenement.houseId }" />
			<input type="hidden" name="villageId" value="${tenement.villageId }" />
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 住户门牌号 </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" name="houseNumber" value="${PAGE_DATA.houseNumber }" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 面积 </label>
			
				<div class="col-sm-9">
					<input type="text" name="acreage" value="${PAGE_DATA.acreage }" class="col-xs-10 col-sm-5" />
					<span style="height: 34px;line-height: 34px;color: red" id="acreage_error_msg" ></span>
				</div>
			</div>
			
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info save" type="button">
						<i class="ace-icon fa fa-check bigger-110"></i>
						提交
					</button>
			
					&nbsp; &nbsp; &nbsp;
					<button class="btn reset" type="reset">
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

<script type="text/javascript">
	$(function() {
		var plateId = $("input[name='plateId']").val();
		var houseId = $("input[name='houseId']").val();
		var villageId = $("input[name='villageId']").val();
		$(".save").on("click", function() {
			$(".data-form").form({
				success:function(res) {
					//弹窗提示
					$.messager.alert(res.msg, function() {
						if(res) {
							//提交成功,跳转回查询页面
							action("vestate/estate/villageManage/tenementList?plateId="+plateId+"&houseId="+houseId+"&villageId="+villageId);
						}
					});
				},
				error : function() {
					$.messager.alert("调用失败，请联系管理员", function(){});
				}
			});
		});
		

		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});
		
		$(".cancel").on("click", function() {
			action("vestate/estate/villageManage/tenementList?plateId="+plateId+"&houseId="+houseId+"&villageId="+villageId);
		});
		
	});
	
	//js校验表单;
	$(".data-form").validate(
			{
				errorElement : 'div',
				errorClass : 'help-block',
				focusInvalid : false,
				ignore : "",
				rules : {
					houseNumber : {
						required : true
					},
					acreage : {
						required : true,
						min : 1
					}
				},
				highlight : function(e) {
					$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
				},
				success : function(e) {
					$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
					$(e).remove();
				},
				errorPlacement : function(error, element) {
					if (element.is('input[type=checkbox]')
							|| element.is('input[type=radio]')) {
						var controls = element.closest('div[class*="col-"]');
						if (controls.find(':checkbox,:radio').length > 1)
							controls.append(error);
						else
							error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
					} else if (element.is('.select2')) {
						error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
					} else if (element.is('.chosen-select')) {
						error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
					} else
						error.insertAfter(element.parent());
				},
				submitHandler : function(form) {
				},
				invalidHandler : function(form) {
				}
			});
	
</script>