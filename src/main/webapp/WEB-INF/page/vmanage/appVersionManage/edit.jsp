<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<h3 class="header smaller lighter blue">基本信息</h3>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" role="form" action="${pageContext.request.contextPath}/vmanage/appVersionManage/edit/exec" method="post" enctype="multipart/form-data" valid="true" >
			<!-- #section:elements.form -->
			<input type="hidden" class="col-xs-10 col-sm-5" id="id" name="id" value="${PAGE_DATA.id}"/>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="fileName">文件名</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" placeholder="文件名" class="col-xs-10 col-sm-5" id="fileName" name="fileName"/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="versionNumber">版本号</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text" placeholder="版本号" class="col-xs-10 col-sm-5" id="versionNumber" name="versionNumber" value="${PAGE_DATA.versionNumber}"/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="type">类型</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select id="type" name="type" class="col-xs-10 col-sm-5">
							<c:forEach var="item" items="${requestScope.types}">
								<option value="${item}" >${item.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="category">分类</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select id="category" name="category" class="col-xs-10 col-sm-5">
							<c:forEach var="item" items="${requestScope.categorys}">
								<option value="${item}" >${item.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			 
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="updateInstall">是否强制更新</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select id="updateInstall" name="updateInstall" class="col-xs-10 col-sm-5">
							<c:forEach var="item" items="${requestScope.yesOrNos}">
								<option value="${item}" <c:if test="${item == PAGE_DATA.updateInstall}">selected="selected"</c:if>>${item.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="isShow">是否可用</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<select id="isShow" name="isShow" class="col-xs-10 col-sm-5">
							<c:forEach var="item" items="${requestScope.yesOrNos}">
								<option value="${item}" <c:if test="${item == PAGE_DATA.isShow}">selected="selected"</c:if>>${item.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="file">上传安装文件</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="file" id="file" name="file">
						<input type="hidden" id="hidFile" name="hidFile" value="${PAGE_DATA.filePath}"/>
					</div>
				</div>
			</div>
			
			<div class="form-group plist" >
				<label class="col-sm-3 control-label no-padding-right" for="plistTitle">plist title</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text"  placeholder="plist title" class="col-xs-10 col-sm-5" id="plistTitle" name="plistTitle" value="${PAGE_DATA.plistTitle}"/>
					</div>
				</div>
			</div>
			
			<div class="form-group plist" >
				<label class="col-sm-3 control-label no-padding-right" for="plistPackage">plist package</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<input type="text"  placeholder="plist package" class="col-xs-10 col-sm-5" id="plistPackage" name="plistPackage" value="${PAGE_DATA.plistPackage}"/>
					</div>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="updateLog">更新日志</label>
			
				<div class="col-sm-9">
					<div class="clearfix">
						<textarea id="updateLog" name="updateLog" class="autosize-transition col-xs-10 col-sm-5">${PAGE_DATA.updateLog}</textarea>
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
<script type="text/javascript">
	$(function() {
		$(".data-form").validate({
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			rules: {
				fileName: {
					required: true,
					maxlength: 32
				},
				versionNumber: {
					required: true,
					maxlength: 16
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
				else if(element.is('#file')) {
					error.insertAfter(element.parent().parent());
				}
				else error.insertAfter(element.parent());
			},
			submitHandler: function (form) {
			},
			invalidHandler: function (form) {
			}
		});
		
		$('input[type="file"]').ace_file_input({
			style: 'well',
			btn_choose: '点击或将文件拖拽至此上传!',
			btn_change: null,
			no_icon: 'ace-icon fa fa-cloud-upload',
			droppable: true,
			thumbnail: 'small', //large | fit,
			allowExt:  ['apk', 'ipa'],
			allowMime: ['application/vnd.android.package-archive', 'application/iphone'],
			maxSize: 10000000,
			before_remove: function() {
				$("#hidFile").val("");
				return true;
			},
			preview_error: function(filename, error_code) {
				console.log(error_code)
			}
		}).on('change', function(){
			$("#hidFile").val($(this).data('ace_input_files')[0]);
		});
		$("input[type='file']").ace_file_input('show_file_list', ['${urlPrefx}${PAGE_DATA.filePath}']);
		$(".ace-file-input").addClass("col-xs-10 col-sm-5");
		
		$(".save").on("click",function(){
			$(".data-form").form({
				success:function(res) {
					//弹窗提示
					$.messager.alert(res.msg, function() {
						if(res.code) {
							//提交成功,跳转回查询页面
							action("vmanage/appVersionManage/list");
						}
					});
				}
			})
		});
		
		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});
		
		$(".cancel").on("click", function() {
			action("vmanage/appVersionManage/list");
		});
		
	});
</script>
