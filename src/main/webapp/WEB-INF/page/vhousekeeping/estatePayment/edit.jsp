<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<h3 class="header smaller lighter blue">修改支付方式信息</h3>
<!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" enctype="multipart/form-data"
			action="" method="POST">
			<input type="hidden" id="id" name="id" value="${PAGE_DATA.id }">
			<!-- #section:elements.form -->

			<div class="form-group head-group">
				<label class="col-sm-3 control-label no-padding-right">支付方式名称</label>
				<input type="hidden" id="config"
					value='${PAGE_DATA.payment.config }'>
				<div class="col-sm-9">
					<input type="text" class="col-xs-10 col-sm-3"
						value="${PAGE_DATA.payment.name}" disabled="true" /> <span
						style='color: red;'></span>
				</div>
			</div>
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info save" type="button">
						<i class="ace-icon fa fa-check bigger-110"></i> 提交
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn reset" type="button">
						<i class="ace-icon fa fa-refresh bigger-110"></i> 重置
					</button>

					&nbsp; &nbsp; &nbsp;
					<button class="btn btn-danger cancel" type="button">
						<i class="ace-icon fa fa-undo bigger-110"></i> 取消
					</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	//生成配置信息
	$(function() {
		var str = $("#config").val();
		console.log(str);
		var html = "";
		if (str) {
			var configs = $.parseJSON(str);
			if (configs && configs.length > 0) {
				for (var i = 0; i < configs.length; i++) {
					var config = configs[i];
					if (config.type === 'input') {
						html += "<div class='form-group foot-group'>"
								+ "<label class='col-sm-3 control-label no-padding-right'>"
								+ config.sname
								+ "</label>"
								+ "<input type='hidden' name='configs[" + i + "].sname' value='"+config.sname+"' /><input type='hidden' name='configs[" + i + "].type' value='input' />"
								+ "<div class='col-sm-9'>"
								+ "<input type='text' class='col-xs-10 col-sm-3' name='configs[" + i + "].value' value='"+config.value+"' />"
								+ "<input type='hidden' name='configs[" + i + "].key' value='"+config.key+"' />"
								+ "<span id='name_errorMeg' style='color: red;'>*</span>"
								+ "</div>" + "</div>";
					} else if (config['type'] === 'select') {
						html += "<div class='form-group foot-group' >"
								+ "<label class='col-sm-3 control-label no-padding-right''>"
								+ config.sname
								+ "</label>"
								+ "<input type='hidden' name='configs[" + i + "].key' value='"+config.key+"' />"
								+ "<input type='hidden' name='configs[" + i + "].sname' value='"+config.sname+"' /><input type='hidden' name='configs[" + i + "].type' value='select' />"
								+ "<div class='col-sm-9'>"
								+ "<select name='configs[" + i + "].value' class='col-xs-10 col-sm-3'>";
						if (config.conf) {
							//取出select中被选中的值;
							for (var j = 0; j < config.conf.length; j++) {
								html += "<option ";
								if (config.value == config.conf[j].sname) {
									html += "selected='selected' ";
								}
								html += "value='" + config.conf[j].sname + "'>"
										+ config.conf[j].sname + "</option>";
							}
							//option溢出解决方案;
							for (var k = 0; k < config.conf.length; k++) {
								html += "<input type='hidden' name='configs[" + i + "].conf["+k+"].sname' value="+configs[i].conf[k].sname+" />";
							}
						}
						html += "</select>"
								+ "<span id='name_errorMeg' style='color: red;'>*</span>"
								+ "</div>" + "</div>";
					} else if (config['type'] === 'radio') {
						html += "<div class='form-group foot-group' >"
								+ "<label class='col-sm-3 control-label no-padding-right''>"
								+ config.sname
								+ "</label>"
								+ "<input type='hidden' name='configs[" + i + "].key' value='"+config.key+"' />"
								+ "<input type='hidden' name='configs[" + i + "].sname' value='"+config.sname+"' /><input type='hidden' name='configs[" + i + "].type' value='radio' />"
								+ "<div class='col-sm-9'>";
						if (config.conf) {
							if (config.value == null || config.value == "") {
								html += "<input type='radio' style='height:30px;' value="+config.conf[0].sname+" name='configs[" + i + "].value' ";
				    		html += "checked='checked' ";
				    		html += "/>"
										+ config.conf[0].sname + "&nbsp;&nbsp";
								html += "<input type='hidden' name='configs[" + i + "].conf[0].sname' value="+configs[i].conf[0].sname+" />";

								for (var j = 1; j < config.conf.length; j++) {
									html += "<input type='radio' style='height:30px;' value="+config.conf[j].sname+" name='configs[" + i + "].value' ";
					    		html += "/>"
											+ config.conf[j].sname
											+ "&nbsp;&nbsp";
									html += "<input type='hidden' name='configs[" + i + "].conf["+j+"].sname' value="+configs[i].conf[j].sname+" />";
								}
							} else {
								for (var j = 0; j < config.conf.length; j++) {
									html += "<input type='radio' style='height:30px;' value="
											+ config.conf[j].sname
											+ " name='configs["
											+ i
											+ "].value' ";
									if (config.value == config.conf[j].sname) {
										html += "checked='checked' ";
									}
									html += "/>" + config.conf[j].sname
											+ "&nbsp;&nbsp";
									html += "<input type='hidden' name='configs[" + i + "].conf["+j+"].sname' value="+configs[i].conf[j].sname+" />";
								}
							}

						}
						html += "</div></div>";
					}else if (config.type === 'textarea') {
						html += "<div class='form-group foot-group'>"
							+ "<label class='col-sm-3 control-label no-padding-right'>" + config.sname + "</label>"
							+ "<input type='hidden' name='configs[" + i + "].key' value='"+config.key+"' /><input type='hidden' name='configs[" + i + "].sname' value='"+config.sname+"' /><input type='hidden' name='configs[" + i + "].type' value='textarea' />"
							+ "<div class='col-sm-9'>"
							+ "<textarea class='col-xs-10 col-sm-3' name='configs[" + i + "].value' value='"+config.value+"' style='height: 180px;'/>"
							+ "<span id='name_errorMeg' style='color: red;'></span>"
							+ "</div>" + "</div>";
					}
				}

				$('.head-group').after(html);

			}
		}
	});

	$(function() {
		$(".save").on("click",function() {
			url = "${pageContext.request.contextPath}/vestate/estate/estatePayment/edit/exec";
				$(".data-form").ajaxSubmit(
					{
			           type : "POST",
					    url : url,
						dataType : "json",
						success : function(result) {
					    if (result.code) {
						location.href = "${pageContext.request.contextPath}/vestate/estate/estatePayment/list";
						}
						  },
						     error : function(result) {
									alert(result.msg);
							    },
							});
						});

		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});

		$(".cancel").on("click", function() {
			action("vestate/estate/estatePayment/list");
		});

	});
</script>