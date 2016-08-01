<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<h3 class="header smaller lighter blue">编辑物业费配置信息</h3>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" role="form" action="edit/exec" enctype="multipart/form-data" valid = "true">
			<!-- #section:elements.form -->
			<input type="hidden" name='id' value="${PAGE_DATA.id }">
			<!-- #section:elements.form -->
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 所属小区 </label>
			
				<div class="col-sm-9">
					<select name="villageId.id" class="form-control" style="width:41.6%" >
						<c:forEach items="${villages }" var="village">
							<option value="${village.id }" <c:if test="${PAGE_DATA.village.id eq village.id }">selected='selected'</c:if> >${village.villageName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 楼号 </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select name="house.id" class="form-control" style="width:41.6%" id='houseId' >
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 费用标准  </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" name="charge" value="${PAGE_DATA.charge }" class="col-xs-10 col-sm-5" 	/>
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

<script type="text/javascript">
	$(function() {
		$(".save").on("click", function() {
			$(".data-form").form({
				success:function(res) {
					//弹窗提示
					$.messager.alert(res.msg, function() {
						if(res) {
							//提交成功,跳转回查询页面
							action("vestate/estate/estdofeeManage/list");
						}
					});
				}
			})
		});
		

		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});
		
		$(".cancel").on("click", function() {
			action("vestate/estate/estdofeeManage/list");
		});
		
		$("select[name='villageId.id']").click(function() {
			var villageId = $(this).val();
			Village.queryHouseListByVid(villageId);
		});
		
		//初始化加载楼栋数据;
		if ("${PAGE_DATA.village.id}") {
			Village.queryHouseListByVid("${PAGE_DATA.village.id}");
		}
		
	});
	
	
	var Village = {
		//级联小区-- 楼栋;
		queryHouseListByVid : function(villageId) {
			if (!villageId) {
				$('#houseId').empty();
				return false;
			}
			$.ajax({
			     type: 'POST',
			     url: 'queryHouseListByVid',
			     data: {villageId:villageId},
			     dataType:"json",
			     success: function(result){
			    	 if (result.code) {
			    		 var $html = "<option value=''>--请选择楼栋--</option>";
			    		 var rdata = result.data;
			    		 for (var i = 0; i < rdata.length; i++) {
			    			 var house = rdata[i];
			    			 $html = $html + "<option value='" + house.id + "'>" + house.name + "</option>";
			    		 }
			    		 $('#houseId').empty().html($html);
			    		 $('#houseId').val("${PAGE_DATA.house.id}");
			    	 }
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
				ignore : "",
				rules : {
					"house.id" : {
						required : true
					},
					charge : {
						required : true,
						range : "0.1,1000"
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