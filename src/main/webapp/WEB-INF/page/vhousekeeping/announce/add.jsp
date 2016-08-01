<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<h3 class="header smaller lighter blue">新增公告</h3>

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" role="form" action="add/exec" enctype="multipart/form-data" valid = "true">
			<!-- #section:elements.form -->
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 小区名称 </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select name="vid" class="form-control select">
							<option value="">---请选择---</option>
							<c:forEach items="${villages }" var="village">
								<option value="${village.id }">${village.villageName }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 公告类型 </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select name="typeId" class="form-control select" >
							<option value=''>---请选择---</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 公告标题 </label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" id="form-field-1" name="title" class="col-xs-10 col-sm-5" />
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 公告内容 </label>
			
				<div class="col-sm-9">
					<script id="editor" type="text/plain" name="content" style="width:1024px;height:500px;"></script>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 公告图片 </label>
			
				<div class="col-sm-9">
					<input type="file" id="picPath" name="file">
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
<script type="text/javascript" src="${pageContext.request.contextPath }/plugin/ue/ueditor.config.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/plugin/ue/ueditor.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/plugin/ue/my.ue.initconfig.js"></script>
<script type="text/javascript">
	$(function() {
		var ue = UE.getEditor('editor');
		$(".save").on("click", function() {
			if(!ue.hasContents()){
				$.messager.alert("公告内容不能为空");
			}else{
			$(".data-form").form({
				success:function(res) {
					//弹窗提示
					$.messager.alert(res.msg, function() {
						if(res) {
							//提交成功,跳转回查询页面
							action("vestate/estate/announceManage/list");
						}
					});
				},
				error : function() {
					alert("错误");
				}
			});
			}
		});
		

		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});
		
		$(".cancel").on("click", function() {
			action("vestate/estate/announceManage/list");
		});
		
		$("select[name='vid']").on("click", function() {
			var vid = $("select[name='vid']").val();
			DataSource.queryAnnounceTypeByVid(vid);
		});
		
		
	});
	
	$(document).ready(function(){
		UE.getEditor('editor');
	});
	
	
	//级联查询渲染;
	var DataSource = {
			queryAnnounceTypeByVid : function(vid) {
			//数据校验;
			if (!vid) {
				return false;
			}
			var url = "${pageContext.request.contextPath}/vestate/estate/announceManage/queryAnnounceTypeByVid";
			$.ajax({
			     type: 'POST',
			     url: url ,
			     data: {"vid" : vid} ,
			     success: function(res){
			    	 if(res.code) {
						//提交成功,渲染页面
						var html = "";
						if (res.data.length > 0) {
							for (var i=0; i<res.data.length; i++) {
								html += "<option value="+res.data[i].id+">"+res.data[i].typeName+"</option>";
							}
						}
						$("select[name='typeId']").empty().append(html);
					 };
			     },
				 error : function() {
					alert("调用失败!");
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
					vid : {
						required : true
					},
					typeId : {
						required : true
					},
					title : {
						required : true
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