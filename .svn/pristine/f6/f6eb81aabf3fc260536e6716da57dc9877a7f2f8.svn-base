var vapp = vapp || {};
$.extend(vapp, {
	core: {
		upload : function(){ 
			var req = '{"params":{"fileName": "", "type":"ANDROID IOS", "identityCode" : "用户身份Code,必填", "estateCode" :"物业公司唯一身份标识，每个APP独有", "versionNumber":"版本号", "filePath":"文件路径", "updateLog" :"日志","updateInstall":"是否强制更新 YES NO"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/appVersion/uploadVersion',
				body: req
			});
		},
		tryCatchException : function(){ 
			var req = '{"params":{"content": "异常栈信息", "type":"APP客户端类型IOS或者ANDROID 大写字母", "identityCode" : "用户身份Code", "estateCode" :"物业公司唯一身份标识，每个APP独有", "versionNumber":"版本号"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/tryCatchException/uploadTryCatchException',
				body: req
			});
		},
		login : function(){ 
			var req = '{"params":{"username": "帐号，手机号，必填", "password":"密码，必填", "identityCode" : "用户身份Code,必填,SVN/智慧社区DOC/db/常量表、固定编码表.xlsx", "estateIdentityCode" :"物业公司唯一身份标识，每个APP独有"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/login',
				body: req
			});
		},
		guestLogin : function(){ 
			var req = '{"params":{"username": "帐号，手机号，必填", "verificationCode":"短信验证码"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/guestLogin',
				body: req
			});
		},
		sendRegisterVerificationCode : function(){ 
			var req = '{"params":{"phone": "手机号码，必填", "estateIdentityCode" : "物业唯一标识"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/sendRegisterVerificationCode',
				body: req
			});
		},
		sendGuestLoginVerificationCode : function(){ 
			var req = '{"params":{"phone": "手机号码，必填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/sendGuestLoginVerificationCode',
				body: req
			});
		},
		sendForgetPasswordVerificationCode : function(){ 
			var req = '{"params":{"phone": "手机号码，必填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/sendForgetPasswordVerificationCode',
				body: req
			});
		},
		forgetPassword : function(){ 
			var req = '{"params":{"verificationCode": "验证码，必填", "username":"用户名，必填", "password":"新密码，必填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/forgetPassword',
				body: req
			});
		},
		updatePassword : function(){ 
			var req = '{"params":{"userId" : "用户id，必填", "username":"用户名，必填", "password":"新密码，必填", "oldPassword" : "旧密码 ，必填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/updatePassword',
				body: req
			});
		},
		register : function(){ 
			var req = '{"params":{"verificationCode":"注册短信验证码，必填","username": "帐号，手机号，必填", "password":"密码，必填","villageId" : "小区ID（唯一标识符，必填，应该对应数据库表主键数据）", "identityCode":"物业公司APP唯一标识,必填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/register',
				body: req
			});
		},
		perfectUserInfo : function(){ 
			var req = '{"此接口涉及到文件上传，采用表单形式提交":{"userId":"用户id，必填","name":"昵称(必填)","villageId": "小区ID(唯一标识符，对应数据库主键，必填)", "houseId":"楼栋ID(唯一标识符，对应数据库主键，必填)", "plateId" : "单元ID（唯一标识符，对应数据库主键，必填）", "tenementId":"门牌号ID(唯一标识符，对应数据库主键，必填)","icon" :"头像图片数据流"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/perfectUserInfo',
				body: req
			});
		},
		referenceVillage : function(){ 
			var req = '{"params":{"userId":"用户id，必填","villageId": "小区ID(唯一标识符，对应数据库主键，必填)", "houseId":"楼栋ID(唯一标识符，对应数据库主键，必填)", "plateId" : "单元ID（唯一标识符，对应数据库主键，必填）", "tenementId":"门牌号ID(唯一标识符，对应数据库主键，必填)"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/user/referenceVillage',
				body: req
			});
		},
		queryInformationCategorys : function(){ 
			var req = '{"params":{}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/information/queryInformationCategorys',
				body: req
			});
		},
		queryInformations : function(){ 
			var req = '{"params":{"categoryId":"分类Id", "isHot":"YES或者 NO(根据分类查询时不需要待此参数，传此参数查热点列表时 不需要传分类)",  "pageNo": "当前页数,必填", "pageSize": "每页显示数据,必填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/information/queryInformations',
				body: req
			});
		},
		checkNewVerisonByEbusiness : function(){ 
			var req = '{"params":{"identityCode":"EBUSINESS 商家身份CODE，必填", "versionNumber":"当前版本号必填","type":"IOS或者ANDROID"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/appVersion/checkNewVersion',
				body: req
			});
		},
		checkNewVerisonByProprietor : function(){ 
			var req = '{"params":{"identityCode":"PROPRIETOR 业主身份CODE，必填", "versionNumber":"当前版本号，必填", "estateIdentityCode":"物业唯一标识CODE，必填","type":"IOS或者ANDROID"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/appVersion/checkNewVersion',
				body: req
			});
		},
		checkNewVerisonByEstate : function(){ 
			var req = '{"params":{"identityCode":"ESTATE 物业身份CODE，必填", "versionNumber":"当前版本号，必填", "estateIdentityCode":"物业唯一标识CODE，必填","type":"IOS或者ANDROID"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/appVersion/checkNewVersion',
				body: req
			});
		}
		
		/*收货地址接口*/
		,
		queryAddressInfo : function(){ 
			var req = '{"params":{"id":"主键,必填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/address/queryAddressInfo',
				body: req
			});
		}
		,
		queryAddressInfoList : function(){ 
			var req = '{"params":{"userId":",必填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/address/queryAddressInfoList',
				body: req
			});
		}
		,
		insertAddressInfo : function(){ 
			var req = '{"params":{"userId":"用户id", "name":"收货人姓名",  "phone": "收货人手机号码", "code": "邮政编码", "provinceName": "省名称", "cityName": "市名称", "areaName": "区域名称", "address": "详细地址","isDefault":"是否默认地址(滑动按钮)("YES/NO")"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/address/insertAddressInfo',
				body: req
			});
		}
		,
		updateAddressInfo : function(){ 
			var req = '{"params":{"id":"主键","userId":"用户id", "name":"收货人姓名",  "phone": "收货人手机号码", "code": "邮政编码", "provinceName": "省名称", "cityName": "市名称", "areaName": "区域名称", "address": "详细地址","isDefault":"是否默认地址(滑动按钮)("YES/NO")"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/address/updateAddressInfo',
				body: req
			});
		}
		,
		deleteAddress : function(){ 
			var req = '{"params":{"id":"主键,必填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/address/deleteAddress',
				body: req
			});
		}
		,
		insertFeedback : function(){ 
			var req = '{"params":{"content":"内容，必填","userId":"用户id，选填"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/core/feedback/insertFeedback',
				body: req
			});
		}
	}
});
