<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="row">
	<div class="col-xs-12">
        <h3 class="header smaller lighter blue">店铺管理</h3>
        
        <div class="row">
	        <div class="col-xs-12">
		        <form class="form-inline search_form" method="post" action="${pageContext.request.contextPath}/vestate/ebusiness/shop/list">
		            <div class="form-group">
		                <label class="control-label">店铺名称</label>
		                <input type="text" name="name" id="name" class="form-control" value="${PARAMS.name}"   placeholder="店铺名称"/>
		            </div>
			       <%--  <shiro:hasPermission name="M0000002:add"> --%>
				        <button type="submit" class="btn btn-success btn-sm tooltip-success list search" id="btn">
					        <i class="ace-icon glyphicon glyphicon-search"></i>查询
				        </button>
				        <button type="button" class="btn btn-purple btn-sm tooltip-success add">
				            <i class="ace-icon glyphicon glyphicon-plus"></i>新增
				        </button>
			        <%--   </shiro:hasPermission> --%>
			        <button type="button" class="btn btn-sm btn-primary batch-upgrade">
					    <i class="ace-icon fa fa-refresh bigger-120"></i>批量升级店铺
				    </button>
			    </form>
	        </div>
        </div>
        <div class="row">
	        <div class="col-xs-12">
		        <table class="table table-bordered table-striped">
			        <thead>
				        <tr>
					        <th width="2%"><input type="checkbox" name="all" id="all" onclick="selectAllCheckBox()"></th>
					        <th>店铺名称</th>
					        <th>店铺类型</th>
					        <th>主营类目</th>
					        <th>等级</th>
					        <th>是否提交认证资料</th>
					        <th>状态</th>
					        <th width="16%">操作</th>
					    </tr>
					</thead>
			        <tbody>
				        <c:forEach var="item" items="${PAGE.records}" varStatus="vs">
					        <tr data-id="${item.id}">
						        <td><input type="checkbox" name="check" id="${item.id}" data-id="${item.id}"></td>
						        <td>
						            <a href="#none" class="goto-detail">
						                <c:if test="${item.avatar != null and item.avatar != ''}">
						                    <img width="46px" src="${FILEURLPREFIX}${item.avatar}">
						                </c:if>
						                <span style="padding: 0 10px;"><c:out value="${item.name}" /></span>
						            </a>
						        </td>
						        <td>
						            <c:if test="${item.type=='PROPRIETOR'}">业主</c:if>
						            <c:if test="${item.type=='EBUSINESS'}">商家</c:if>
						            <c:if test="${item.type=='ESTATE'}">物业</c:if>
						            <c:if test="${item.type=='YUCI'}">鱼刺平台</c:if>
						        </td>
						        <td><c:out value="${item.category.name}" /></td>
						        <td>
						            <c:if  test="${item.grade != null and item.grade != ''}">
						                <c:forEach var="i" begin="1" end="${item.grade}">
									        <i data-alt="2" class="star-on-png" title="poor"></i>   
								        </c:forEach>
						            </c:if>
						        </td>
						        <td><c:if test="${not empty item.ebusinessUser.realName and not empty item.ebusinessUser.idCardNo }">是</c:if></td>
						        <td status="${item.status}">
						            <c:if test="${item.status=='UNAUTHERIZED'}">未认证</c:if>
						            <c:if test="${item.status=='WAITFORCHECK'}">待审核</c:if>
						            <c:if test="${item.status=='CHECNOTTHROUGH'}">审核不通过</c:if>
						            <c:if test="${item.status=='NORMALITY'}">正常</c:if>
						            <c:if test="${item.status=='CLOSE'}">关闭</c:if>
						        </td>
						        <td>
							        <button class="btn btn-sm btn-info edit" itemStatus="${item.status}">
								        <i class="ace-icon glyphicon glyphicon-pencil bigger-120"></i>编辑
							        </button>
							        <button class="btn btn-sm btn-primary upgrade" data-id="${item.id}">
								        <i class="ace-icon fa fa-refresh bigger-120"></i>升级店铺
							        </button>
							        <c:if test="${item.status=='WAITFORCHECK' or item.status=='CHECNOTTHROUGH' }">
								        <button class="btn btn-sm btn-warning shenhe" bid="${item.id}" bstatus="${item.status}" bremark="${item.remark }"  bRealName="${item.ebusinessUser.realName}" bIdCardNo="${item.ebusinessUser.idCardNo }" 
								        bIdCardFront="${item.ebusinessUser.idCardFront }"  bIdCardReverse="${item.ebusinessUser.idCardReverse }"   bHousePropertyFront="${item.ebusinessUser.housePropertyFront }"  bHousePropertyReverse="${item.ebusinessUser.housePropertyReverse }">
									        <i class="ace-icon glyphicon glyphicon-ok bigger-120"></i>审核
									    </button>
							        </c:if>
							        <c:if test="${item.status=='NORMALITY'}">
								        <button class="btn btn-sm btn-danger remove" id="isStart" status=${item.status}>
									        <i class="ace-icon glyphicon glyphicon-lock bigger-120 "></i>关闭店铺
								        </button>
							        </c:if>
							        <c:if test="${item.status=='CLOSE' }">
								        <button class="btn btn-sm btn-danger remove" id="isStart" status=${item.status}>
									       <i class="ace-icon glyphicon glyphicon-lock bigger-120 "></i>开启店铺
								        </button>
							        </c:if>
							    </td>
							</tr>
				        </c:forEach>
				    </tbody>
				</table>
				<tiles:insertDefinition name="vestate.base.page.definition"></tiles:insertDefinition>
		    </div>
		</div>
	</div>
</div>

<input  type="hidden" id="FILEURLPREFIX" value="${FILEURLPREFIX }">
<script type="text/javascript">
    var shop = {
    	upgrade: function(shopIds){  //升级店铺
    		if(shopIds && shopIds.length>0){
    			$.businAjax('${contextPath}/vestate/ebusiness/shop/upgrade/exec', {'shopIds': shopIds.join(',')}, function(res) {
    				if(res.code || res.resultCode == 'SD0001') {
						//提交成功,跳转回查询页面
						action("vestate/ebusiness/shop/list");
					}
        		}, true);
    		}
    	}
    };
</script>
<script type="text/javascript">
	$(function() {
		//跳转到添加按钮页面
		$(".add").on("click", function() {
			location.href = "${pageContext.request.contextPath}/vestate/ebusiness/shop/add";
		});
		
		// 升级店铺
		$('.upgrade').click(function(){
			var shopId = $(this).attr('data-id');
			if(shopId){
				var shopIds = [];
				shopIds.push(shopId);
				shop.upgrade(shopIds);
			}
		});
		// 批量升级店铺
		$('.batch-upgrade').click(function(){
			var ck_shops = $('input[type="checkbox"]:checked');
			if(!ck_shops || ck_shops.length<=0){
				$.messager.alert('请勾选需要升级的店铺', function(){});
			} else{
				var shopIds = [];
				for(var i=0; i<ck_shops.length; i++){
					var ck_shop = ck_shops[i];
					if(!ck_shop){
						continue;
					}
					var shopId = $(ck_shop).attr('data-id');
					if(!shopId){
						continue;
					}
					shopIds.push(shopId);
				}
				shop.upgrade(shopIds);
			}
		});
		
		// 店铺详情
		$('.goto-detail').click(function(){
			var shopId = $(this).parents('tr').attr('data-id');
			if(shopId){
				location.href = '${pageContext.request.contextPath}/vestate/ebusiness/shop/detail?id=' + shopId;
			}
		});
		
	});
	
	//开启店铺还是关闭店铺
	if ($(".remove").length > 0) {
		$(".remove").click(
			function() {
							var status = $(this).attr("status");
							if ($(this).attr("status") == "CLOSE") {
								//confirm("您确定开启店铺吗？");
								var id = $(this).parents('tr').attr('data-id');
								var url = "${pageContext.request.contextPath}/vestate/ebusiness/shop/updateShopStatus/exec";
								
								$.messager.confirm(
										"您确定开启店铺吗？",
										function(r) {//回调函数
											if(r) {
												$.businAjax(
														url,
														{"id": id,"status":status},
														function(res) {
															$.messager.alert(res.msg, function() {
																if(res.code) {
																	//提交成功,跳转回查询页面
																	action("vestate/ebusiness/shop/list");
																}
															});
														}
													);
											} else {
												//点击取消时触发
											}
										}
								);
							}
							if ($(this).attr("status") == "CHECNOTTHROUGH") {

								//confirm("店铺还在待审核状态,无法开启店铺!");
								$.messager.alert("店铺还在待审核状态,无法开启店铺!", function(){});
								return;
							}
							if ($(this).attr("status") == "NORMALITY") {
								var id = $(this).parents('tr').attr('data-id');
								var url = "${pageContext.request.contextPath}/vestate/ebusiness/shop/updateShopStatus/exec";
								$.messager.confirm(
										"您确定关闭店铺吗？",
										function(r) {//回调函数
											if(r) {
												$.businAjax(
														url,
														{"id": id,"status":status},
														function(res) {
															$.messager.alert(res.msg, function() {
																if(res.code) {
																	//提交成功,跳转回查询页面
																	action("vestate/ebusiness/shop/list");
																}
															});
														}
													);
											} else {
												//点击取消时触发
											}
										}
								);
							}

						});
	}
	//批量的，暂时没用到
	function selectAllCheckBox() {
		var aa = document.getElementsByName("check");

		if (document.getElementById("all").checked) {

			for (var i = 0; i < aa.length; i++) {
				aa.item(i).checked = true;
			}
		} else {
			for (var i = 0; i < aa.length; i++) {
				aa.item(i).checked = false;
			}

		}

	}

	//跳转到编辑页面
	if ($(".edit").length > 0) {
		$(".edit").click(function() {
			var  status=$(this).attr("itemStatus");
			if(status=='CLOSE')
				{
					$.messager.alert(
							"店铺已经关闭,不能编辑哦", 
							function(){//回调函数
							}
					);
				}else{
					var id = $(this).parents('tr').attr('data-id');
					location.href = "${pageContext.request.contextPath}/vestate/ebusiness/shop/edit?id="
							+ id + "";
					
				}
			});
	}
	//审核
	if ($(".shenhe").length > 0) {
		$(".shenhe").click(function() {
			bootbox.dialog({
			    title : "审核店铺",
			    message : "<div class=' ' style='margin-top:25px;width:600px'>"
			    	+"<form class='form-horizontal' role='form'>"
			    	+"<div class='form-group' >"
					+"<label class='col-sm-3 control-label no-padding-right' style='margin-top:-5px'  "
					+"	for='txtOldPwd'>真实姓名</label>"
					+"<div class='col-sm-9' >"
					+"<input  id='realName'   disabled >"
					+"</div>"
				+"</div>"
				+"<div class='space-4'></div>"
				+"<div class='form-group'>"
					+"<label class='col-sm-3 control-label no-padding-right'"
					+"	for='txtOldPwd'  style='margin-top:-5px'>身份证号码</label>"
					+"<div class='col-sm-9'>"
					+"<input  id='idCardNo'   disabled >"
					+"</div>"
				+"</div>"
				+"<div class='form-group'>"
				+"<label class='col-sm-3 control-label no-padding-right'"
					+"for='idCardPicture' style='margin-top:-5px'>身份图片</label>"
				+"<div class='col-sm-9'  id='idCardPicture' >"
				+"<input  type='hidden'  id='hidePic'  style='width:152px;height:25px;font-size:13px;'  disabled/>"
				+"<img  id='idCardFront'   width='160px'/> <img  id='idCardReverse' width='160px'  /> "
				+"</div>"
			+"</div>"
			
				+"<div class='form-group'>"
				+"<label class='col-sm-3 control-label no-padding-right'"
					+"for='txtOldPwd'  style='margin-top:-5px'>房产证图片</label>"
				+"<div class='col-sm-9'  >"
				+"<input  type='hidden'  id='hidePicHouse'  style='width:152px;height:25px;font-size:13px;'  disabled/>"
				+"<img  id='housePropertyFront'  width='160px' /> <img  id='housePropertyReverse'  width='160px'/>"
				+"</div>"
			+"</div>"
				+"<div class='space-4'></div>"
					+"<div class='form-group'>"
					+"<label class='col-sm-3 control-label no-padding-right' for='txtOldPwd'  style='margin-top:-3px'>请审核</label>"
					+"<div class='col-sm-9'>"
					+"<input type='hidden' id='sid'>"
					+"<select id='isStatus'>"
					+"<option value='CHECNOTTHROUGH' id='no'>审核不通过</option>"
					+"<option value='NORMALITY' id='yes'>审核通过</option>"
					+"</select>"
					+"</div>"
					+"</div>"
					+"<div class='space-4'></div>"
					+"<div class='form-group'>"
					+"<label class='col-sm-3 control-label no-padding-right' for='txtNewPwd1'>备注</label>"
					+"<div class='col-sm-7'>"
						+"<textarea rows='5' cols='3' class='col-sm-12' id='reason'  placeholder='备注'></textarea>"
					+"</div>"
					+"</div>"
					+"</form>"
					+"</div>",
			    buttons : {
			        "submit" : {
			            "label" : "提交",
			            "className" : "btn-sm btn-info",
			            "callback" : function() {
			            	var sid = $("#sid").val();
							var remark = $("#reason").val();
							var status = $("#isStatus").val();
									
									$.businAjax(
											"${pageContext.request.contextPath}/vestate/ebusiness/shop/updateOneShopStatus/exec",
											{"id" : sid,"remark" : remark,"status" : status},
											function(res) {
												$.messager.alert(res.msg, function() {
													if(res.code) {
														//提交成功,跳转回查询页面
														action("vestate/ebusiness/shop/list");
													}
												});
											}
										);
			            }
			        },
			        "cancel" : {
			            "label" : "取消",
			            "className" : "btn-sm btn-info",
			            "callback" : function() { }
			        }
			    }
			});
			
			$("#reason").val($(this).attr("bremark"));
			if($(this).attr("bRealName")=="")
			{
				$("#realName").val("该用户未传真实姓名");
			
			}else{
				$("#realName").val($(this).attr("bRealName"));
			}
			
			if($(this).attr("bIdCardNo")=="")
			{
				$("#idCardNo").attr("color","#6FB3E0");
				$("#idCardNo").val("该用户未传身份证号码");
				
			}else{
				$("#idCardNo").val($(this).attr("bIdCardNo"));
			}
			if($(this).attr("bIdCardFront")==""  && $(this).attr("bIdCardReverse")=="")
			{
					$("#idCardFront").hide();
					$("#idCardReverse").hide();
					$("#hidePic").attr("type","text");
					$("#hidePic").val("该用户还没有上传身份证!");
			}else{
				var idCardFrontPath=$("#FILEURLPREFIX").val()+$(this).attr("bIdCardFront");
				$("#idCardFront").attr("src",idCardFrontPath);
				
				var  idCardReversePath=$("#FILEURLPREFIX").val()+$(this).attr("bIdCardReverse");
				$("#idCardReverse").attr("src",idCardReversePath);
				
			}
			
			if($(this).attr("bHousePropertyFront")==""  &&  $(this).attr("bHousePropertyReverse")=="")
				{
						$("#housePropertyFront").hide();
						$("#housePropertyReverse").hide();
						$("#hidePicHouse").attr("type","text");
						$("#hidePicHouse").val("该用户还没有上传房产证!");
				}else{
					
					var   housePropertyFrontPath= $("#FILEURLPREFIX").val()+$(this).attr("bHousePropertyFront"); 
					$("#housePropertyFront").attr("src",housePropertyFrontPath);
					var housePropertyReversePath=$("#FILEURLPREFIX").val()+$(this).attr("bHousePropertyReverse"); 
					$("#housePropertyReverse").attr("src",housePropertyReversePath);
				}
			
			if ($(this).attr("bstatus") == "CHECNOTTHROUGH") {
				document.getElementById("no").selected = "selected";

			} else {
				document.getElementById("yes").selected = "selected";
			}

			$("#sid").val($(this).attr("bid"));
		});
	}

</script>