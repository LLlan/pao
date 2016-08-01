<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
<!--
	.select {
		display: inline;
		width:41.6%
	}
-->
</style>

<h3 class="header smaller lighter blue">新增缴费配置信息</h3>

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" role="form" enctype="multipart/form-data" action="add/exec" valid = "true">
			<!-- #section:elements.form -->
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 所属小区 </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select name="vid.id" class="form-control select">
							<option value="">---请选择---</option>
							<c:forEach items="${villages }" var="village">
								<option value="${village.id }">${village.villageName }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 楼栋 </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select name="house.id" class="form-control select">
							<option value=''>---请选择---</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 单元号 </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select name="cell.id" class="form-control select" >
							<option value=''>---请选择---</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1" > 门牌号 </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select name="tenementId" class="form-control select">
							<option value=''>---请选择---</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1" > 缴费类型 </label>
			
				<div class="col-sm-5">
    				<select name="paymentType" class="form-control" style="width:41.6%" >
						<option value='COMPAY_1'>物业费</option>
						<option value='COMPAY_2'>停车费</option>
					</select>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 到期时间 </label>
			
				<div class="col-sm-5">
					<div class="clearfix">
						<input  type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  
						class="form-control select"  name='expirationTime' class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group" id="carNumber" style="display: none;">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 车牌号 </label>
			
				<div class="col-sm-5">
					<div class="clearfix">
						<input type="text" id="form-field-1" name="carNumber" class="col-xs-10 col-sm-5" />
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
<script src="${pageContext.request.contextPath}/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(function() {
		$(".save").on("click", function() {
			$(".data-form").form({
				success:function(res) {
					//弹窗提示
					$.messager.alert(res.msg, function() {
						if(res) {
							//提交成功,跳转回查询页面
							action("vestate/estate/estPaymentManage/list");
						}
					});
				},
				error : function() {
					$.messager.alert("error", function(){});
				}
			});
		});
		

		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});
		
		$(".cancel").on("click", function() {
			action("vestate/estate/estPaymentManage/list");
		});
		
		$("select[name='vid.id']").on("click", function() {
			var vid = $(this).val();
			Village.getAllCurrentHouses(vid);
		});
		
		$("select[name='house.id']").on("click", function() {
			var houseId = $(this).val();
			Village.getAllCurrentCells(houseId);
		});
		
		$("select[name='cell.id']").on("click", function() {
			var cellId = $(this).val();
			Village.getAllCurrentDoors(cellId);
		});
		
		//缴费类型控制;
		$("select[name='paymentType']").on("click", function() {
			if ($(this).val() == 'COMPAY_1') {//物业费
				$("#carNumber").hide();
			} else { //停车费
				$("#carNumber").show();
			}
		});
		
	});
	
	//定义一个小区类,做级联查询;
	var Village = {
		//当前楼栋信息
		getAllCurrentHouses : function(vid) {
			//数据校验;
			if (!vid) {
				return false;
			}
			var url = "${pageContext.request.contextPath}/vestate/estate/estPaymentManage/getAllCurrentHouses";
			$.ajax({
			     type: 'POST',
			     url: url ,
			     data: {"villageId" : vid} ,
			     success: function(res){
			    	 if(res.code) {
						//提交成功,渲染页面
						var html = "<option value=''>---请选择---</option>";
						if (res.data.length > 0) {
							for (var i=0; i<res.data.length; i++) {
								html += "<option value="+res.data[i].id+">"+res.data[i].name+"</option>";
							}
						}
						$("select[name='house.id']").empty().append(html);
					 };
			     },
				 error : function() {
					 $.messager.alert("error", function(){});
				 }
			});
		},
		//当前单元信息
		getAllCurrentCells : function(houseId) {
			if (!houseId) {
				return false;
			}
			var url = "${pageContext.request.contextPath}/vestate/estate/estPaymentManage/getAllCurrentCells";
			$.ajax({
			     type: 'POST',
			     url: url ,
			     data: {"houseId" : houseId} ,
			     success: function(res){
			    	 if(res.code) {
						//提交成功,渲染页面
						var html = "<option value=''>---请选择---</option>";
						if (res.data.length > 0) {
							for (var i=0; i<res.data.length; i++) {
								html += "<option value="+res.data[i].id+">"+res.data[i].doorName+"</option>";
							}
						}
						$("select[name='cell.id']").empty().append(html);
					 };
			     },
				 error : function() {
					 $.messager.alert("error", function(){});
				 }
			});
		},
		//当前住户信息
		getAllCurrentDoors : function(cellId) {
			if (!cellId) {
				return false;
			}
			var url = "${pageContext.request.contextPath}/vestate/estate/estPaymentManage/getAllCurrentDoors";
			$.ajax({
			     type: 'POST',
			     url: url ,
			     data: {"plateId" : cellId} ,
			     success: function(res){
			    	 if(res.code) {
						//提交成功,渲染页面
						var html = "";
						if (res.data.length > 0) {
							for (var i=0; i<res.data.length; i++) {
								html += "<option value="+res.data[i].id+">"+res.data[i].houseNumber+"</option>";
							}
						}
						$("select[name='tenementId']").empty().append(html);
					 };
			     },
				 error : function() {
					 $.messager.alert("error", function(){});
				 }
			});
		}
	};
	
	
	//js校验表单;
	$(".data-form").validate(
			{
				errorElement : 'div',
				errorClass : 'help-block',
				focusInvalid : false,
				ignore : ":hidden",
				rules : {
					"vid.id" : {
						required : true
					},
					"house.id" : {
						required : true
					},
					"cell.id" : {
						required : true
					},
					tenementId : {
						required : true
					},
					expirationTime : {
						required : true
					},
					carNumber : {
						required : true
					}
					
				},
				messages: {
					carNumber: {
	                	required : "请输入车牌号码!"
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