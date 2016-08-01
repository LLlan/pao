<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<style>

	.search_form .buttonClass {
		background: #9585bf;
	}
	
	.search_form .uploadify-button:hover {
		background-color: red !important;
		background: red !important;
	}

	#data_process_message_id{
		text-indent: 17px;
		display: inline-block;
		font-weight: bold;
		color: #AD4242;
	}
	
	.uploadify-queue{
		height: 50px;
		position: absolute;
		top: 0;
		left: 147px;
		width: 600px;
	}
	
	.uploadify-queue .cancel{
		display:none
	}
</style>

<!-- uploadify -->
<link href="${pageContext.request.contextPath}/plugin/uploadify3.2/uploadify.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/plugin/uploadify3.2/swfobject.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/plugin/uploadify3.2/jquery.uploadify.min.js" type="text/javascript"></script>


<div class="row">
	<div class="col-xs-12" style="height: 60px;">
		<form class="form-inline search_form" method="post" action="">
			<input type="hidden" name="villageId" value="${house.villageId }" />
			<%-- 楼栋名称:
			<input name="name" value="${PARAMS.name }" class="form-control"/>
			<button type="button" class="btn btn-success btn-sm tooltip-success list">
				<i class="ace-icon glyphicon glyphicon-search"></i>查询
			</button> --%>
			<button style=" float:left;margin-right: 10px;" type="button" class="btn btn-purple btn-sm tooltip-success add">
				<i class="ace-icon glyphicon glyphicon-plus"></i>新增
			</button>
			<button style=" float:left;margin-right: 10px;" type="button" class="btn btn-purple btn-sm tooltip-success goBack">
				<i class="ace-icon glyphicon glyphicon-plus"></i>返回小区列表
			</button>
			<div style="height: 42px; float:left;position: relative;">
				<input type="file" name="uploadify" id="uploadify" style="display:none"/>
			</div>
			<div style="height:0px;width:0px;clear:both;display:none"></div>
		</form>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>楼栋名称</th>
	          <th>楼栋描述</th>
	          <th>操作</th>
	        </tr>
	      </thead>
	      <tbody>
	       	  <c:forEach items="${PAGE_DATA.records }" var="pageData">
	      	  		<tr>
			          <td>${pageData.name }</td>
			          <td>${pageData.remark }</td>
			          <td>
			          	<button class="btn btn-sm btn-info edit" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120"></i>编辑
						</button>
						<button class="btn btn-sm btn-info whdy" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120"></i>维护单元
						</button>
			            <button class="btn btn-sm btn-danger remove" fid=${pageData.id }>
							<i class="ace-icon fa fa-trash-o bigger-120 "></i>删除
						</button>
			          </td>
	        		</tr>
	      	  </c:forEach>
	      </tbody>
	    </table>
	</div>
</div>

<tiles:insertDefinition name="vestate.base.page.definition"></tiles:insertDefinition>

<script type="text/javascript">
	$(function() {
		//小区id;
		var villageId = $("input[name='villageId']").val();
		$(".remove").on("click", function() {
			var id = $(this).attr("fid");
			var url = "${pageContext.request.contextPath}/vestate/estate/villageManage/index/houseDel";
			$.messager.confirm("当前操作会删除该楼栋下属单元和住户信息,确定要删除吗?", function(r) {
				if (r) {
					$.businAjax(url,{"id" : id},function(res) {
						$.messager.alert(res.msg, function() {
							if(res.code) {
								//提交成功,跳转回查询页面
								action("vestate/estate/villageManage/houseList?villageId="+villageId);
							} else {
								//自定义异常,$.post检测不了系统异常;比如请求不到url...
							}
						});
					});
				}; 
			});
		});
		
		$(".add").on("click", function() {
			action("vestate/estate/villageManage/index/houseAdd?villageId="+villageId);
		});
		$(".edit").on("click", function() {
			var id = $(this).attr("fid");
			action("vestate/estate/villageManage/index/houseEdit?id=" + id+"&villageId="+villageId);
		});
		//维护单元
		$(".whdy").on("click", function() {
			var id = $(this).attr("fid");
			action("vestate/estate/villageManage/plateList?houseId=" + id+"&villageId="+villageId);
		});
		$(".goBack").on("click", function() {
			action("vestate/estate/villageManage/list");
		});
	});
</script>


<script type="text/javascript">
	$(document).ready(function() {
		//传递小区参数;
		var vid = $("input[name='villageId']").val();
		
		setTimeout(function () {
			$('#uploadify').uploadify({
				'uploader' : '${pageContext.request.contextPath}/vestate/estate/villageManage/import/exec?id='+vid,
				'swf' : '${pageContext.request.contextPath}/plugin/uploadify3.2/uploadify.swf',
				'cancelImage' : '',
				'buttonText' : '导入小区模板',
				'height' : 33,
				'buttonClass' : 'buttonClass',
				'fileObjName' : 'fileData',
	            'auto': true,
	            'multi' : false, /* 单个文件上传 */
	            'fileTypeExts' : '*.xlsx;*.xls',
	            'fileSizeLimit' : '10MB',
	            'removeCompleted' : false,
				'onSelect' : function (event,queueID,fileObj) {
					/* alert(event); */
				},
				'successTimeout' : 1000,
				/*
					onUploadSuccess(file, data, response)
					当文件上传成功时触发

					file – 文件对象
					data – 服务端输出返回的信息
					response – 有输出时为true,如果无响应为false，如果返回的是false,当超过successTimeout设置的时间后假定为true
				*/
	            'onUploadSuccess' : function(file, data, response) {
	            	$('#uploadify-queue').remove();
	            	var jsonObj = JSON.parse(data);
	            	if (jsonObj.code) {
	            		//刷新页面,并计算导入的数据;
	            		$.messager.alert("成功导入<br/>"+jsonObj.data.houseCount+"条楼栋信息，<br/>"
	            				+jsonObj.data.cellCount+"条单元信息，<br/>"+jsonObj.data.tenementCount+"条住户信息，<br/><br/>更新"
	            				+jsonObj.data.tenementUpdateCount+"条住户信息！<br/>新增"+jsonObj.data.estateConfig+"条物业费配置信息！", function(){
	            			common_search(1);
	            		} );
	            	} else {
	            		//失败的信息;
	            		$.messager.alert(jsonObj.msg, function(){} );
	            	}
	            },
	            'onUploadProgress' : function(file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {
	            	if (totalBytesUploaded >= totalBytesTotal) {
	            		$('#uploadify-queue .data').html('<span id="data_process_message_id">上传完成！正在处理数据，请耐心等待！...</span>');
	            	}
	            }
			});
		}, 200);  
	});
</script>