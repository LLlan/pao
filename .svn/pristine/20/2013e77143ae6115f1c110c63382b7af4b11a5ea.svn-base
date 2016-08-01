//弹出框resource/js/messager.js

//提示框
$.messager.alert(
		"要展示的信息", 
		function(){//回调函数
			
		}
);

//确认框
$.messager.confirm(
		"确认信息",
		function(r) {//回调函数
			if(r) {
				//当点击确认时触发
			} else {
				//点击取消时触发
			}
		}
);


//公用方法resource/js/common.js

action(url);//跳转页面，URL为相对路径

action2(url);//跳转页面，URL为绝对路径

formatJson(str); // json字符串格式化

//业务异步请求resource/js/ajax.js
$.businAjax(
		url,//请求地址
		{},//携带参数
		function(res) {//回调函数
			//res为返回的数据
		},
		true //最后参数可不填，默认为TRUE 启动一些公共处理。
)
//下面的例子效果和上面是一样的
$.businAjax(
		url,//请求地址
		{},//携带参数
		function(res) {//回调函数
			//res为返回的数据
		},
		false //最后参数可不填，默认为TRUE 启动一些公共处理。
)

//注意：新增、编辑的表单提交默认情况下使用以下方法。
//异步表单提交,
//businAjax不能上传文件，涉及到一个大表单的数据提交的时候比较繁琐，所以封装了如下方法
$("#formid").form({
	url: "请求地址", 
	type:"POST", //非必须参数默认为POST
	success: function(res) {
		//成功回调
	}
})

//表单重置，清理掉表单内所有的控件的值 ，但不包括隐藏表单域
$("#formid").formClear()


//数据表格的分页相关JS代码封装在了resource/js/datagrid.js 中 有兴趣可以看看
common_reload();//刷新当前页的table数据
common_search(1);//封装的查询方法

/* 注意：凡是通过$(".data-form").form() 或者businAjax 方式提交的, 校验开启 需要在form元素上加上属性valid = "true"
 * jQuery.validator 使用DEMO
 * HTML 表单代码，如果是左右布局的表单，需要在被校验的控件外层套一层<div class="clearfix"></div>
 * DEMO1 HTML 如下:
 	<div class="form-group">
		<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 所属身份 </label>
	
		<div class="col-sm-9">
			<div class="clearfix">
				<select id="identityId" name="identityId" class="col-xs-10 col-sm-5">
					<c:forEach var="item" items="${requestScope.identitys}">
					<option value="${item.id}" >${item.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
	
	JS代码如下:
	$(".data-form").validate({
		errorElement: 'div',
		errorClass: 'help-block',
		focusInvalid: false,
		ignore: "",
		//开发主要关注这里
		rules: {
			identityId: {
				required: true
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
	****************************************************************************************************
	DEMO2 HTML 如下：
 	<div class="form-group">
	    <label class="control-label no-padding-right" for="name">商品名称: </label>
		<input type="text" class="form-control" id="name" name="name" value="${PAGE_DATA.name}" placeholder="请输入商品名称">
	</div>
	
	JS代码如下:
	$(".data-form").validate({
		errorElement: 'div',
		errorClass: 'help-block',
		focusInvalid: false,
		ignore: "",
		//开发主要关注这里
		rules: {
			name: {
				required: true
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
	
	*****************************************************************************************
	默认校验规则：
	(1)、required:true               必输字段
	(2)、remote:"remote-valid.jsp"   使用ajax方法调用remote-valid.jsp验证输入值
	(3)、email:true                  必须输入正确格式的电子邮件
	(4)、url:true                    必须输入正确格式的网址
	(5)、date:true                   必须输入正确格式的日期，日期校验ie6出错，慎用
	(6)、dateISO:true                必须输入正确格式的日期(ISO)，例如：2009-06-23，1998/01/22 只验证格式，不验证有效性
	(7)、number:true                 必须输入合法的数字(负数，小数)
	(8)、digits:true                 必须输入整数
	(9)、creditcard:true             必须输入合法的信用卡号
	(10)、equalTo:"#password"        输入值必须和#password相同
	(11)、accept:                    输入拥有合法后缀名的字符串（上传文件的后缀）
	(12)、maxlength:5                输入长度最多是5的字符串(汉字算一个字符)
	(13)、minlength:10               输入长度最小是10的字符串(汉字算一个字符)
	(14)、rangelength:[5,10]         输入长度必须介于 5 和 10 之间的字符串")(汉字算一个字符)
	(15)、range:[5,10]               输入值必须介于 5 和 10 之间
	(16)、max:5                      输入值不能大于5
	(17)、min:10                     输入值不能小于10
 */
