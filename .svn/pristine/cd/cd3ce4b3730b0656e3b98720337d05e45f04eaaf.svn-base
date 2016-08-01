var vapp = vapp || {};
$.extend(vapp, {
	ebusiness: {
		createShop : function(){  //创建店铺
			var req = '{"params":{"type": "店铺类型: YUCI-鱼刺平台 ESTATE-物业开店 EBUSINESS-周边商家 PROPRIETOR-业主店铺 THIRTPART-第三方平台", "category": "主营类目分类id", "name": "店铺名称", "notice": "店铺公告", "servicePhone": "联系电话", "address": "地址", "lng": "纬度", "lat": "经度", "locationInfo": "位置信息", "startBusinessTime": "开始营业时间", "endBusinessTime": "结束营业时间", "merchant": "店主用户id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shop/add',
				body: req
			});
		},
		updateShop : function(){  //更新店铺信息
			var req = '{"params":{"id": "店铺id", "category": "主营类目分类id", "name": "店铺名称", "notice": "店铺公告", "servicePhone": "联系电话", "address": "地址", "lng": "纬度", "lat": "经度", "locationInfo": "位置信息", "startBusinessTime": "开始营业时间", "endBusinessTime": "结束营业时间"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shop/update',
				body: req
			});
		},
		findShopByMerchant : function(){  //根据用户id查询店铺
			var req = '{"params":{"merchant": "店主用户id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shop/findByMerchant',
				body: req
			});
		},
		listShops: function(){  //列表店铺, 按照分类、名称搜索
			var req = '{"params":{"category": "主营类目", "name": "店铺名称", "type": "店铺类型: YUCI-鱼刺平台 ESTATE-物业开店 EBUSINESS-周边商家 PROPRIETOR-业主店铺 THIRTPART-第三方平台", "estate": "物业编码", "village": "小区id", "pageNo": "当前页数", "pageSize": "每页显示数据"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shop/list',
				body: req
			});
		},
		findShopById : function(){  //根据店铺id获取店铺数据
			var req = '{"params":{"id": "店铺id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shop/load',
				body: req
			});
		},
		createProductSpu : function(){  //创建商品
			var req = '{"params":{"name": "商品名称", "productCode": "商品编码", "description": "描述", "price": "价格", "stock": "库存", "isFreeShipping": "NO-不包邮 YES-包邮", "shop": "店铺id", "category": ["1"], "productSkus": [{"productCode": "商品编码", "model": "型号", "price": "价格", "stock":"库存"}]}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/productSpu/edit',
				body: req
			});
		},
		updateProductSpu : function(){  //更新商品信息
			var req = '{"params":{"id":"商品spu id", "name": "商品名称", "productCode": "商品编码", "description": "描述", "price": "价格", "stock": "库存", "isFreeShipping": "NO-不包邮 YES-包邮", "shop": "10", "category": ["1"], "productSkus": [{"id": "商品sku id", "productCode": "商品编码", "model": "型号", "price": "价格", "stock":"库存"}], "pictures": [{"id": "商品图片id", "pictureFile": "图片文件地址", "sortNo":"排序编号"}]}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/productSpu/edit',
				body: req
			});
		},
		listProductSpus : function(){  //列表店铺下的所有商品
			var req = '{"params":{"name": "商品名称", "shop": "店铺id", "category": "空-所有分类 -1-未分类 1-商品分类id", "status":"SHELVE-上架 UNSHELVE-下架 FAILURE-失效"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/productSpu/list',
				body: req
			});
		},
		updateProductSpuStatus: function(){  //(批量)修改商品状态
			var req = '{"params":{"products":[{"id": "商品spu id", "status": "SHELVE-上架 UNSHELVE-下架 FAILURE-失效"}]}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/productSpu/updateStatus',
				body: req
			});
		},
		findProductSpu: function(){  //查询单个商品详细信息
			var req = '{"params":{"id": "商品spu id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/productSpu/load',
				body: req
			});
		},
		listProductSkus: function(){  //列表店铺下的商品
			var req = '{"params":{"name": "商品名称", "shop": "店铺id", "category": "空-所有分类 -1-未分类 1-商品分类id", "pageNo": "当前页数", "pageSize": "每页显示数据", "sortType": "0-价格 1-销量 不填-综合", "sortDirection": "asc-升序 desc-降序"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/productSku/list',
				body: req
			});
		},
		findProductSku: function(){  //查询单个商品详细信息
			var req = '{"params":{"id": "商品sku id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/productSku/load',
				body: req
			});
		},
		listProductCategories: function(){  //列表平台提供的商品分类
			var req = '{"params":{"parent": "父分类id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/productCategory/list',
				body: req
			}); 
		},
		listShopProductCategories : function(){  //列表店铺创建的商品分类
			var req = '{"params":{"shop": "店铺id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shopProductCategory/list',
				body: req
			});
		},
		addShopProductCategory : function(){  //增加商品分类列表
			var req = '{"params":{"shop":"店铺id", "name":"分类名称", "sortNo":"排序编号"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shopProductCategory/add',
				body: req
			});
		},
		updateShopProductCategory : function(){  //修改商品分类列表
			var req = '{"params":{"id": "分类id", "name": "分类名称", "sortNo":"排序编号"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shopProductCategory/update',
				body: req
			});
		},
		deleteShopProductCategory : function(){  //删除商品分类
			var req = '{"params":{"id": "分类id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shopProductCategory/delete',
				body: req
			});
		},
		listShoppingCartItems : function(){  //买家在在店铺中的购物车商品列表
			var req = '{"params":{"shop": "1-店铺id(可选)", "user": "1-当前用户id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shoppingCart/list',
				body: req
			});
		},
		addShoppingCartItem : function(){  //将商品加入购物车操作
			var req = '{"params":{"shop": "1-店铺id(可选)", "user": "1-当前用户id", "product": "1-商品sku id", "amount": "10-购买商品的数量"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shoppingCart/add',
				body: req
			});
		},
		updateShoppingCartItem : function(){  //修改购物车中商品的操作
			var req = '{"params":{"shop": "1-店铺id(可选)", "user": "1-当前用户id", "product": "1-商品sku id", "amount": "10-购买商品的数量"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shoppingCart/update',
				body: req
			});
		},
		deleteShoppingCartItem : function(){  //将商品从购物车删除
			var req = '{"params":{"shop": "1-店铺id(可选)", "user": "1-当前用户id", "product": "1-商品sku id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shoppingCart/delete',
				body: req
			});
		},
		deleteShopShoppingCart : function(){  //删除用户在某个店铺中的购物车数据
			var req = '{"params":{"shop": "1-店铺id(可选)", "user": "1-当前用户id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shoppingCart/delete',
				body: req
			});
		},
		confirmProductOrder : function(){  //确认订单页面，订单结算
			var req = '{"params":{"userId": "当前买家用户id", "shop":"店铺id", "deliveryAddress":"收货地址id", "shopPayment": "支付方式编码code", "shopDistribution":"配送方式id", "coupon":"用户优惠券id", "leaveWords":"买家留言", "products":[{"product":"商品Sku id", "purchaseNum":"购买数量"}]}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/confirm',
				body: req
			});
		},
		listUserShopCoupons : function(){  //用户查看优惠券
			var req = '{"params":{"user": "用户id","shop":"店铺id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/userCoupon/list',
				body: req
			});
		},
		submitProductOrder : function(){  //提交订单
			var req = '{"params":{"userId": "当前买家用户id", "shop":"店铺id", "deliveryAddress":"收货地址id", "shopPayment": "支付方式编码code", "shopDistribution":"配送方式id", "coupon":"用户优惠券id", "leaveWords":"买家留言", "products":[{"product":"商品Sku id", "purchaseNum":"购买数量"}]}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/submit',
				body: req
			});
		},
		payProductOrder : function(){  //用户付款
			var req = '{"params":{"userId": "当前买家用户id", "order":"订单id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/paying',
				body: req
			});
		},
		payOnDeliveryProductOrder : function(){  //用户货到付款回调
			var req = '{"params":{"userId": "当前买家用户id", "order":"订单id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/payOnDelivery',
				body: req
			});
		},
		receiptProductOrder : function(){  //用户确认收货
			var req = '{"params":{"userId": "当前买家用户id", "order":"订单id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/receipt',
				body: req
			});
		},
		cancelProductOrder : function(){  //用户取消订单
			var req = '{"params":{"userId": "当前买家用户id", "order":"订单id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/cancel',
				body: req
			});
		},
		deleteProductOrder : function(){  //用户删除订单
			var req = '{"params":{"userId": "当前买家用户id", "order":"订单id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/delete',
				body: req
			});
		},
		listProductOrders : function(){  //列表订单
			var req = '{"params":{"userId": "当前买家用户id", "status":"WAITFORAPPROVE-等待审核 CONFIRMED-已确认 SUCCESSFUL_TRADE-交易成功 FAILED_TRADE-交易未成功 CANCEL-取消订单", "paymentStatus": "NOTPAID-未付款 PAID-已付款  FAILEDPAID-付款失败 PAYONDELIVERY-货到付款", "deliveryStatus": "ASSEMBLYING-正在配货 ASSEMBLY-已配货 DELIVERED-已发货 ARRIVED-已送达 UNDERSTOCK-库存不足", "pageNo": "当前页数", "pageSize": "每页显示数据"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/list',
				body: req
			});
		},
		loadProductOrder : function(){  //加载单个订单信息
			var req = '{"params":{"id": "订单id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/load',
				body: req
			});
		},
		listShopProductOrders : function(){  //列表卖家所有的订单
			var req = '{"params":{"shop": "店铺id", "status":"WAITFORAPPROVE-等待审核 CONFIRMED-已确认 SUCCESSFUL_TRADE-交易成功 FAILED_TRADE-交易未成功 CANCEL-取消订单", "paymentStatus": "NOTPAID-未付款 PAID-已付款  FAILEDPAID-付款失败 PAYONDELIVERY-货到付款", "deliveryStatus": "ASSEMBLYING-正在配货 ASSEMBLY-已配货 DELIVERED-已发货 ARRIVED-已送达 UNDERSTOCK-库存不足", "pageNo": "当前页数", "pageSize": "每页显示数据"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/listShopOrders',
				body: req
			});
		},
		updateProductOrder: function(){  //修改订单基本信息
			var req = '{"params":{"id":"订单id", "userId":"买家用户id", "deliveryAddress":"收货地址id", "shopPayment": "支付方式编码code", "shopDistribution":"配送方式id", "leaveWords":"买家留言"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/update',
				body: req
			});
		},
		updateDeliveryAddress : function(){  //卖家修改收货地址(卖家发货之前)
			var req = '{"params":{"id":"订单id", "deliveryPostalCode": "邮政编码", "contacterPhone": "收货人电话", "contacterName":"收货人姓名", "deliveryAddress":"收货地址"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/updateDeliveryAddress',
				body: req
			});
		},
		deliverProductOrder : function(){  //订单发货处理
			var req = '{"params":{"userId": "当前卖家用户id", "order":"订单id", "expressNo": "物流单号"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/order/deliver',
				body: req
			});
		},
		addComment : function(){  // 新增评论
			var req = '{"params":{"appraiserId": "当前买家用户id(388)", "appraiserType":"评论人类型（0用户  1商家）","appraiseType":"0好评1中评2差评", "productId":"商品id(50)", "orderId": "订单id","contents": "评论内容","commontId": "评论父级Id(1)"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/comment/add',
				body: req
			});
		},
		addCustomer : function(){  // 新增评论
			var req = '{"params":{"userId": "当前登录用户id(388)", "customerId":"当前买家Id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/customer/add',
				body: req
			});
		},
		listShopPayments : function(){
			var req = '{"params":{"shop": "店铺id"}}';
			restapi.initialRequest({
				url: 'vapp/restapi/ebusiness/shopPayment/list',
				body: req
			});
		}
	}
});
