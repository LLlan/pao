var vapp = vapp || {};
$.extend(vapp, {
	social: {
		createInvitation: function () {  //保存业主发帖信息
			var req = '{"params":{"invitationTitle":"太阳神","invitationContent":"咦。。。怎么不能在这帖子里发东西呢","invitationCateId":"2","userId":"1","pictureFiles":[{}]}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitation/createInvitation',
				body: req
			});
		},
		editInvitation: function () {  //修改业主发帖信息
			var req = '{"params":{"id":"6","invitationTitle":"太阳神11","invitationContent":"咦。怎么不能在这帖子里发东西呢","pictureFiles":[{"pic":"d://psb"}]}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitation/editInvitation',
				body: req
			});
		},
		queryInvitationCateList : function(){  //获取帖子分类列表信息
			var req = '{"params":{"identityCode":"JSWH"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/queryInvitationCateList',
				body: req
			});
		},
		queryInvitationList : function(){  //获取帖子列表信息
			var req = '{"params":{"invitationCateId":"2","current": "1","userId":"2"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/queryInvitationList',
				body: req
			});
		},
		queryCommentInfo : function(){  //获取帖子评论信息
			var req = '{"params":{"commentId":"1","type":"1"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/queryCommentInfo',
				body: req
			});
		},
		queryCommentList : function(){  //获取帖子评论列表信息
			var req = '{"params":{"invitationId":"1","current": "1","type":"1","floorCode":""}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/queryCommentList',
				body: req
			});
		},
		queryInvitationInfo : function(){  //获取帖子详情信息
			var req = '{"params":{"invitationId":"1","userId":"2"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/queryInvitationInfo',
				body: req
			});
		},
		delInvitationInfo : function(){  //删除贴子信息
			var req = '{"params":{"invitationId":"1"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/delInvitationInfo',
				body: req
			});
		},
		addReport : function(){  //举报帖子信息
			var req = '{"params":{"invitationId":"1","reportType":"REPORT_SEXY","reportContent":"色情暴力色情暴力色情暴力色情暴力色情暴力","reportSort":"1","comId":"1"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/addReport',
				body: req
			});
		},
		queryReportByPage : function(){  //根据物业ID分页查询该物业下的举报信息记录（分页）
			var req = '{"params":{"comId":"所属物业的ID","current":"第几页"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/report/queryReportByPage',
				body: req
			});
		},
		addCommentInfo : function(){  //
			var req = '{"params":{"invitationId":"1","commentContent":"咦。。。怎么不能在这帖子里发东西呢","type":"1","fromUser":"1","toUser":"1","floorCode":"","pictureFiles":[{}]}}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitation/addCommentInfo',
				body: req
			});
		},
		delCommentInfo: function(){  //删除帖子信息
			var req = '{"params":{"commentId":"16"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/delCommentInfo',
				body: req
			});
		},
		closeInvitation: function(){  //关闭帖子信息
			var req = '{"params":{"invitationId":"1"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/closeInvitation',
				body: req
			});
		},
		
		delReport: function(){  //删除举报记录
			var req = '{"params":{"reportId":"1"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/delReport',
				body: req
			});
		},
		addBarOperate: function(){  //添加贴吧操作
			var req = '{"params":{"invitationId":"2","operateType":"2","userId":"2"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/addBarOperate',
				body: req
			});
		},
		canceldBarOperate: function(){  //取消贴吧操作
			var req = '{"params":{"invitationId":"2","operateType":"2","userId":"2"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/social/invitationManager/canceldBarOperate',
				body: req
			});
		}
	}
});
