!function($){
	$.extend(
		$.validator.messages, {
			required: "请输入信息,选项为必填项.",
			remote: "请修正该字段.",
			email: "请输入合法的email地址.",
			url: "请输入合法的URL.",
			date: "请输入合法的时间格式.",
			dateISO: "请输入合法的时间格式 ( ISO ).",
			number: "请输入合法的数字.",
			digits: "请输入整数.",
			creditcard: "请输入合法的信用卡号.",
			equalTo: "请再次输入相同的值.",
			maxlength: $.validator.format( "请输入一个长度最多是 {0} 的字符串." ),
			minlength: $.validator.format( "请输入一个长度最少是 {0} 的字符串." ),
			rangelength: $.validator.format( "请输入一个长度介于 {0} 和 {1} 之间的字符串." ),
			range: $.validator.format( "请输入一个介于 {0} 和 {1} 之间的值." ),
			max: $.validator.format( "请输入一个最大为 {0} 的值." ),
			min: $.validator.format( "请输入一个最小为 {0} 的值." )
		}
	);
	
	//当默认规则无法满足时在此处增加规则
	jQuery.validator.addMethod("phone", function (value, element) {
		return this.optional(element) || /^((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)$/.test(value);
	}, "请输入正确的电话号码.");
	
	jQuery.validator.addMethod("compareDate", function(value, element, param){
		var startDate = $(param).val();
        var endDate = $(element).val();
        if(endDate) {
        	return Date.parse(startDate) <= Date.parse(endDate);
        } else {
        	return true;
        }
	},"结束时间不能小于开始时间.");
	
	
	jQuery.validator.addMethod("selectSpu", function(value, element,param){
		var checked=$(param).val();
		if((value=="PART" && checked!="") || value=="ALL"){
			return true;
		}else{
			return false;
		}
	},"请至少选择一个优惠商品");
	
}(window.jQuery);