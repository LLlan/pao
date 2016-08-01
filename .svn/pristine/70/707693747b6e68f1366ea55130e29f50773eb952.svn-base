//物业服务接口
var vapp = vapp || {};
$.extend(vapp, {
	estate: {
		listAnnounceType : function(){  //查询所有公告分类数据，接口传入小区ID
			var req = '{"params":{"vid":"小区的ID(小区表的主键)"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/announceType/listAnnounceType',
				body: req
			});
		},
		listAnnounceRecByPage : function(){  //根据条件分页查询公告信息
			var req = '{"params":{"type_id":"公告分类的ID(公告分类表的主键 必填)","current": "第几页"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/announceRec/listAnnounceRecByPage',
				body: req
			});
		},
		queryAnnounceDetail : function(){  //根据公告ID查询公告详情
			var req = '{"params":{"id":"公告的ID(公告表的主键 必填)"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/announceRec/queryAnnounceDetail',
				body: req
			});
		}
		,
		listGuideInfoByPage : function(){  //根据条件分页查询办事指南信息
			var req = '{"params":{"vid":"小区的ID(小区表的主键  必填)","current": "第几页"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/guideInfo/listGuideInfoByPage',
				body: req
			});
		},
		queryGuideInfoDetail : function(){  //根据条件分页查询办事指南信息
			var req = '{"params":{"id":"办事指南表的主键的ID"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/guideInfo/queryGuideInfoDetail',
				body: req
			});
		},
		publishAnnounce : function(){  //发布简单公告
			var req = '{"params":{"type_id":"公告分类的ID(公告分类表的主键，必填)","title": "标题内容","content": "这是公告的内容正文--只支持文字"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/announceRec/publishAnnounce',
				body: req
			});
		},
		saveHouseInformation : function(){  //保存业主的小区-楼栋-单元-住户信息关系
			var req = '{"params":{"user_id":"用户ID(用户表的主键)","identity_id": "身份ID(用户的身份标识)","village_id": "小区的ID(小区表的主键)","house_id": "楼栋ID(楼栋表的主键)","plate_id": "单元ID(单元表的主键)","tenement_id":"住户ID(户号表的主键)"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/userVillage/saveHouseInformation',
				body: req
			});
		},
		queryAbleVillages : function(){  //查询可选的小区
			var req = '{"params":{"identityCode":"物业公司的CODE"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/community/queryAbleVillages',
				body: req
			});
		},
		queryAbleHouses : function(){  //查询小区内的楼栋
			var req = '{"params":{"villageId":"小区的ID(小区表的主键)"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/community/queryAbleHouses',
				body: req
			});
		},
		queryAllPlate : function(){  //查询楼栋内的单元
			var req = '{"params":{"houseId":"楼栋的ID"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/community/queryAllPlate',
				body: req
			});
		},
		queryAllTenement : function(){  //查询单元内的户号
			var req = '{"params":{"plateId":"1 单元的ID"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/community/queryAllTenement',
				body: req
			});
		},
		createRepairRec : function(){  //业主报修
			var req = '{"params":{"type":"PERSONAGE-个人报修/ PUBLIC-公共报修","addressInfo":"地址信息：公共报修用户手工填写，个人报修终端拼接用户的住址","content":"1111报修内容","userId":"用户ID","villageId":"小区ID"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/repair/createRepairRec',
				body: req
			});
		},
		queryMyRepariRec: function(){  //查询我的报修记录
			var req = '{"params":{"user_id":"用户ID","current":"1 第几页"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/repair/queryMyRepariRec',
				body: req
			});
		},
		queryMyRepariDetail: function(){  //根据ID查询报修记录的明细信息
			var req = '{"params":{"id":"报修记录的主键ID"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/repair/queryMyRepariDetail',
				body: req
			});
		},
		queryCommuntyPayInfoByTid: function(){  //根据户号ID和类型查询缴费信息
			var req = '{"params":{"tenement_id":"户号ID","payment_type":"COMPAY_1：物业费, COMPAY_2：停车费","house_id":"楼栋的ID（物业费时必传，停车费不传）"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/communtypayment/queryCommuntyPayInfoByTid',
				body: req
			});
		},
		queryRepairRecByVillage: function(){  //物业筛选小区后，根据小区查询报修记录
			var req = '{"params":{"village_id":"小区ID","type":"类型(PERSONAGE-个人报修  PUBLIC-公共报修)","current": "第几页"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/repair/queryRepairRecByVillage',
				body: req
			});
		},
		repairRecMaintenance: function(){  //物业管理维护报修信息
			var req = '{"params":{"id":"主键ID","status": "STATUS_WAIT待处理   STATUS_SEND 已分派   STATUS_DONE 处理完成 ","repair_time":"维修时间 yyyy-MM-dd HH:mm:ss","repair_user":"维修人","repair_tel":"维修人联系方式","remark":"维修备注"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/repair/repairRecMaintenance',
				body: req
			});
		},
		communtyPaymentInfoMaintenance: function(){  //物业管理维护该户的缴费信息
			var req = '{"params":{"tenement_id":"住户号ID","payment_type": "缴费类型 COMPAY_1/物业费 COMPAY_2/停车费 ","duration":"缴费时长，按月计算","paymentWay":"支付方式（支付宝/微信/现金）","responsiblePerson":"物业管理员ID（物业催缴时传值）","payUser":"支付人ID（自助缴费时传值）","money":"缴费总金额","serialnumber":"支付流水号，调用支付接口时必须回填支付宝的流水"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/communtypayment/communtyPaymentInfoMaintenance',
				body: req
			});
		},
		queryParkingInfoList: function(){  //物业管理维护该户的缴费信息
			var req = '{"params":{"village_id":"小区ID"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/park/queryParkingInfoList',
				body: req
			});
		},
		queryEstatePaymentById: function(){  //根据id查询物业缴费信息
			var req = '{"params":{"estateId":"1"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/pay/queryEstatePaymentById',
				body: req
			});
		},
		queryEstatePaymentRecByTenementId: function(){  //根据户号查询缴费记录
			var req = '{"params":{"tenementId":"户号ID","current":"第几页"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/communtypayment/queryEstatePaymentRecByTenementId',
				body: req
			});
		},
		queryEstateAdvertisements: function(){  //根据小区id查询小区广告信息
			var req = '{"params":{"village_id":"1"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/advertisement/queryEstateAdvertisements',
				body: req
			});
		},
		queryEstateAdvInfo: function(){  //根据广告id查询广告详情并且记录浏览次数
			var req = '{"params":{"advertisement_id":"1"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/estate/advertisement/queryEstateAdvInfo',
				body: req
			});
		}
	}
});
