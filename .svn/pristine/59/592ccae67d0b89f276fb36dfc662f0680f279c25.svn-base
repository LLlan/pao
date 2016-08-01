<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<h3 class="header smaller lighter blue">编辑维修记录</h3>
<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<form class="form-horizontal data-form" role="form" action="edit/exec" enctype="multipart/form-data">
			<!-- #section:elements.form -->
			<input type="hidden" name='id' value="${PAGE_DATA.id }">
			<!-- #section:elements.form -->
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 所属小区 </label>
			
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="villageId" value="${PAGE_DATA.village.villageName }" disabled="disabled" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 报修类型 </label>
			
				<div class="col-sm-9">
					<c:if test="${PAGE_DATA.type eq 'PERSONAGE'}">
						<input type="text" id="form-field-1" name="type" value="个人报修" disabled="disabled" class="col-xs-10 col-sm-5" />
					</c:if>
					<c:if test="${PAGE_DATA.type eq 'PUBLIC'}">
						<input type="text" id="form-field-1" name="type" value="公共报修" disabled="disabled" class="col-xs-10 col-sm-5" />
					</c:if>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 报修人 </label>
			
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="userId" value="${PAGE_DATA.user.username }" disabled="disabled" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 地址信息 </label>
			
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="addressInfo" value="${PAGE_DATA.addressInfo }" disabled="disabled" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 报修内容 </label>
			
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="content" value="${PAGE_DATA.content }" disabled="disabled" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 处理时间 </label>
			
				<div class="col-sm-5">
    				<input  type="text" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" 
    				value='<fmt:formatDate value="${PAGE_DATA.repairTime}" pattern="yyyy-MM-dd HH:mm:ss"/>'
    				name='repairTime' class="col-xs-10 col-sm-5" />
				</div>
				
			</div>
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 维修人 </label>
			
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="repairUser" value="${PAGE_DATA.repairUser }" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 维修人联系方式 </label>
			
				<div class="col-sm-9">
					<input type="text" id="form-field-1" name="repairTel" value="${PAGE_DATA.repairTel }" class="col-xs-10 col-sm-5" />
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 报修状态 </label>

				<div class="col-sm-9">
					<label class="checkbox-inline">
				      <input type="radio" name="status" value="STATUS_WAIT" <c:if test="${PAGE_DATA.status eq 'STATUS_WAIT' }">checked='checked'</c:if> /> 待处理
				    </label>
				    <label class="checkbox-inline">
				      <input type="radio" name="status" value="STATUS_SEND" <c:if test="${PAGE_DATA.status eq 'STATUS_SEND' }">checked='checked'</c:if> /> 已分派
				    </label>
				    <label class="checkbox-inline">
				      <input type="radio" name="status" value="STATUS_DONE" <c:if test="${PAGE_DATA.status eq 'STATUS_DONE' }">checked='checked'</c:if> /> 处理完成
				    </label>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 维修备注 </label>
			
				<div class="col-sm-5">
    				<textarea class="form-control" name="remark" rows="3">${PAGE_DATA.remark }</textarea>
				</div>
			</div>
			
			
			
			
			
			<div class="clearfix form-actions">
				<div class="col-md-offset-3 col-md-9">
					<button class="btn btn-info save" type="button">
						<i class="ace-icon fa fa-check bigger-110"></i>
						提交
					</button>
			
					&nbsp; &nbsp; &nbsp;
					<button class="btn reset" type="reset">
						<i class="ace-icon fa fa-refresh bigger-110"></i>
						重置
					</button>
					
					&nbsp; &nbsp; &nbsp;
					<button class="btn btn-danger cancel" type="button">
						<i class="ace-icon fa fa-undo bigger-110"></i>
						取消
					</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script src="${pageContext.request.contextPath}/plugin/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$(function() {
		$(".save").on("click", function() {
			$(".data-form").form({
				success:function(res) {
					//弹窗提示
					$.messager.alert(res.msg, function() {
						if(res) {
							//提交成功,跳转回查询页面
							action("vestate/estate/repairRecordManage/list");
						}
					});
				},
				error : function() {
					$.messager.alert("error", function(){});
				}
			});
		});
		

		$(".reset").on("click", function() {
			$(".data-form").formClear();
		});
		
		$(".cancel").on("click", function() {
			action("vestate/estate/repairRecordManage/list");
		});
		
	})
	
</script>