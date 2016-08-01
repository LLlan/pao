$(document).ajaxComplete(function(event, xhr, settings) {
	if (xhr.responseText == "timeout") {
		top.location.href = HID_BASE_PATH + "/loginManage/goLogin";
	}
	if (xhr.status == 403) {
		top.location.href = HID_BASE_PATH + "/page/error/403.html";
	}
});

//CSS3 spinner
$.fn.spin = function(opts) {
	this.each(function() {
	  var $this = $(this),
		  data = $this.data();

	  if (data.spinner) {
		data.spinner.stop();
		delete data.spinner;
	  }
	  if (opts !== false) {
		data.spinner = new Spinner($.extend({color: $this.css('color')}, opts)).spin(this);
	  }
	});
	return this;
};

/**
 * 自定义ajax请求
 * @param url
 * @param data
 * @param callback
 * @param auto
 */
$.extend ({
	businAjax : function(url, data, callback, auto) {
		var auto_ = auto == undefined || auto == "" || auto ? true : false;
		var url_ = url;
		var data_ = data;
		var callback_ = callback;
		$.customMask();
		$.ajax({
			url: url_,  //请求的URL
		　　timeout : 1000, //超时时间设置，单位毫秒
		　　type : 'post',  //请求方式，get或post
		　　data : data_,  //请求所传参数，json格式
		　　dataType : 'json',//返回的数据格式
		　　success:function(data){ //请求成功的回调函数
		　　　	$.customMask();
				if(auto) {//启用公用自动处理
					
				} else { //需要自己处理
					
				}
				//透传 回调
				callback_(data);
		　　},
		　　complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
		　　　　if(status=='timeout'){//超时,status还有success,error等值的情况
		 　　　　　 $.customMask();
		　　　　　  alert("超时");
		　　　　}
		　　}
		})
//		$.post(
//			url_,
//			data_,
//			function(res) {
//				$.customMask();
//				if(auto) {//启用公用自动处理
//					
//				} else { //需要自己处理
//					
//				}
//				//透传 回调
//				callback_(res);
//			},"JSON"
//		)
	},
	customMask : function() {
		if($(".custom-mask").length > 0) {
			$(".custom-mask").remove();
			$(".custom-mask").spin();
		} else {
			var opts = {
			  lines: 11, // The number of lines to draw
			  length: 9, // The length of each line
			  width: 6, // The line thickness
			  radius: 14, // The radius of the inner circle
			  corners: 0.9, // Corner roundness (0..1)
			  rotate: 2, // The rotation offset
			  color: '#000', // #rgb or #rrggbb
			  speed: 1, // Rounds per second
			  trail: 100, // Afterglow percentage
			  shadow: true, // Whether to render a shadow
			  hwaccel: true, // Whether to use hardware acceleration
			  className: 'spinner', // The CSS class to assign to the spinner
			  zIndex: 2e9, // The z-index (defaults to 2000000000)
			  top: 'auto', // Top position relative to parent in px
			  left: 'auto' // Left position relative to parent in px
			};
			$("body").append("<div class='custom-mask'></div>");
			$(".custom-mask").spin();
		}
	}
})

/**
 * 表单元素异步提交
 * @param 对象格式 {url:"", type:"", success: function(res){}, error:function(e){}}
 * @see
 */
$.fn.form = function(param) {
	var id = $(this).attr("id");
	var url = param.url == undefined ? $(this).attr("action") : param.url;
	var type = param.method == undefined ? "POST" : param.method;
	var successCall = param.success;
	var error = param.error;
	//判断是否开启校验
	if($(this)) {
		if($(this).attr("valid")) {
			if(!$(this).valid()) {
				return false;
			}
		}
	}
	$.customMask();
	$(this).ajaxSubmit({
		type : type,
		url : url,
		dataType : "json",
		success : function(result) {
			$.customMask();
			successCall(result);
		},
		error : function(e) {
			$.customMask();
			if(error) {
				error(e);
			} else {
				console.log("异常:" + e);
			}
		} 
	});
}

$.fn.formClear = function() {
	$.customMask();
	$(':input',$(this)).not(':hidden').val('')
	 .removeAttr('checked')  
	 .removeAttr('selected')
	 $.customMask();
}