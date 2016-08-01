/**
 * 公共弹出框
 * 用法:
 * 信息提示框alert:  $.messager.alert("你要展示的信息", function(){//回调函数，在关闭提示框之后触发} );
 * @param $
 */
!function($) {
	$.extend ({
		messager : {
			alert : function(msg, _callback) {
				bootbox.dialog({
				    message: msg,
				    title: "信息提示",
				    locale : "zh_CN",
				    closeButton : false,
				    buttons: {
				      ok: {
				        label: "确定",
				        className: "btn-primary",
				        callback: function() {
				        	if(_callback) {
				        		_callback();
				        	}
				        }
				      } 
				    }
				  });
			},
			confirm : function(msg, _callback) {
				bootbox.dialog({
				    message: msg,
				    title: "确认提示",
				    locale : "zh_CN",
				    closeButton : false,
				    buttons: {
				      ok: {
				        label: "确定",
				        className: "btn btn-danger",
				        callback: function() {
				        	if(_callback) {
				        		_callback(true);
				        	}
				        }
				      },
				      cancel: {
				        label: "取消",
				        className: "btn ",
				        callback: function() {
				        	if(_callback) {
				        		_callback(false);
				        	}
				        }
				      }
				    }
				  });
			},
			editPassword : function(callback) {
				var fm = '<form id="editPwdForm" class="form-horizontal" role="form">';
				fm += '<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="oldPassword">旧密码</label><div class="col-sm-9"><div class="clearfix"><input type="text" id="oldPassword" name="oldPassword" placeholder="旧密码" class="col-xs-10 col-sm-5" /></div></div></div>';
				fm += '<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="newPassword">新密码</label><div class="col-sm-9"><div class="clearfix"><input type="password" id="newPassword" name="newPassword" placeholder="新密码" class="col-xs-10 col-sm-5" /></div></div></div>';
				fm += '<div class="form-group"><label class="col-sm-3 control-label no-padding-right" for="newPassword2">再次输入新密码</label><div class="col-sm-9"><div class="clearfix"> <input type="password" id="newPassword2" name="newPassword2" placeholder="二次新密码" class="col-xs-10 col-sm-5" /></div></div></div>';
				fm += '</form>';
				bootbox.dialog({
					title:"修改密码",
					message: fm,
					buttons: 			
					{
						"success" :
						 {
							"label" : "<i class='ace-icon fa fa-check'></i>修改",
							"className" : "btn-sm btn-success",
							"callback": function() {
								$("#editPwdForm").validate({
									errorElement: 'div',
									errorClass: 'help-block',
									focusInvalid: false,
									ignore: "",
									rules: {
										oldPassword: {
											required: true
										},
										newPassword: {
											required: true
										},
										newPassword2: {
											required: true,
											equalTo:'#newPassword'
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
								if(!$("#editPwdForm").valid()) {
									return false;
								}
								callback({"oldPassword":$("#oldPassword").val(), "newPassword" : $("#newPassword").val()});
							}
							
						},
						"danger" :
						{
							"label" : "取消",
							"className" : "btn-sm btn-danger",
							"callback": function() {
							}
						}
					}
				});
			}
		}
	})
}(window.jQuery);
