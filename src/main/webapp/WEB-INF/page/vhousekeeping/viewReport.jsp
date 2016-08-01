<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String basePath = request.getContextPath();
	request.setAttribute("basePath",basePath);
%>

<style type="text/css">
	img{width:30px;height: 30px;display:inline-block;}
</style>
<!-- DataTable定义区 -->
<input id="reportId" name="reportId" type="hidden" value="${report.id}"/>
<div class="row-fluid">
	<div class="span12">
		<h2>举报详情</h2>
			<div class="input_div">
				<label >举报类型：</label> <label >${report.reportType}</label>
			</div>
			<br />
			<br/>
			<div class="input_div">
				<label >举报内容：</label><label >${report.reportContent}</label>
			</div>
			<br />
			<br/>
			<div class="input_div">
				<label>
					<c:choose>
						<c:when test="${report.reportSort=='1'}">
							帖子信息
						</c:when>
						<c:when test="${report.reportSort=='2'}">
							跟帖信息
						</c:when>
						<c:otherwise>
							评论信息
						</c:otherwise>
					</c:choose>：
				</label> <label ><a href="${basePath}/vestate/estate/invitationManage/list?id=${report.invitation.id}&invitationTitle=${report.invitation.invitationTitle}">${report.invitation.invitationTitle}</a></label>
			</div>
			<br />
		<c:if test="${report.reportSort=='1'}">
			<div class="input_div" style="border: 1px solid #b3b3b3;background-color: #7399b8">
				<label>帖子标题：</label>
				&nbsp;&nbsp;&nbsp;&nbsp;<label>${invitation.invitationTitle}</label>
				<br/>
				<label>帖子内容：</label>
				&nbsp;&nbsp;&nbsp;&nbsp;<label>${invitation.invitationContent}</label>
				<br/>
				<c:if test="${invitation.picList!=null}">
					<label>帖子图片：</label>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<label>
						<c:forEach var="item" items="${invitation.picList}" >
							<img src="${url_prefix}${item.path}">
						</c:forEach>
					</label>
				</c:if>
				<br/>
				<label>发帖人：</label>
				&nbsp;&nbsp;&nbsp;&nbsp;<label>${invitation.userName}</label>
				<br/>
				<input id="del_id" name="del_id" value="${invitation.id}" sort="${report.reportSort}" type="hidden"/>
				<input id="invitationId" name="invitationId" value="${invitation.id}" type="hidden"/>
			</div>
		</c:if>
		<c:if test="${report.reportSort=='2'}">
			<div class="input_div" style="border: 1px solid #b3b3b3;background-color: #7399b8; color:#000000;">
				<label>跟帖内容：</label>
				&nbsp;&nbsp;&nbsp;&nbsp;<label>${commentInfo.commentContent}</label>
				<br/>
				<c:if test="${commentInfo.picList!=null}">
					<label>跟帖图片：;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>
						<c:forEach var="item" items="${commentInfo.picList}" >
							<img src="${url_prefix}${item.path}">
						</c:forEach>
					</label>
				</c:if>
				<label>跟帖人：</label>
				&nbsp;&nbsp;&nbsp;&nbsp;<label>${commentInfo.fromUserName}</label>
				<br/>
				<input id="del_id" name="del_id" value="${commentInfo.id}" sort="${report.reportSort}" type="hidden"/>
				<input id="invitationId" name="invitationId" value="${commentInfo.invitationId}" type="hidden"/>


			</div>
		</c:if>
		<c:if test="${report.reportSort=='3'}">
			<div class="input_div" style="border: 1px solid #b3b3b3;background-color: #7399b8">
				<label>评论内容：</label>
				&nbsp;&nbsp;&nbsp;&nbsp;<label>${commentInfo.commentContent}</label>
				<br/>
				<c:if test="${commentInfo.picList!=null}">
				<label>评论图片：;&nbsp;&nbsp;&nbsp;&nbsp;
					<label>
						<c:forEach var="item" items="${commentInfo.picList}" >
							<img src="${url_prefix}${item.path}">
						</c:forEach>
					</label>
				</c:if>
				<label>回复人/被回复人：</label>
				&nbsp;&nbsp;&nbsp;&nbsp;<label>${commentInfo.fromUserName}/${commentInfo.toUserName}</label>
				<input id="del_id" name="del_id" value="${commentInfo.id}" sort="${report.reportSort}" type="hidden"/>
				<input id="invitationId" name="invitationId" value="${commentInfo.invitationId}" type="hidden"/>
			</div>
		</c:if>
		<br /><br />
		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info remove" type="button">
					<i class="ace-icon fa fa-check bigger-110"></i> 删除帖子内容
				</button>

				&nbsp; &nbsp; &nbsp;
				<button class="btn btn-danger cancel" type="button">
					<i class="ace-icon fa fa-undo bigger-110"></i> 取消
				</button>
			</div>
		</div>
		</form>
	</div>
</div>


<script type="text/javascript">
$(function(){
	$(".remove").click(function(){
		var del_id = $("#del_id").val();
		var sort = $("#del_id").attr("sort");
		var reportId = $("#reportId").val();
		var invitationId = $("#invitationId").val();
		$.messager.confirm(
				"您确认要删除该条数据吗",
				//回调函数
				function(r) {
					//r是返回的信息，点击确认的时候为true 取消的时候为false
					if(r) {
						//当点击确认时触发
						$.businAjax(
								"${pageContext.request.contextPath}/vestate/estate/reportManage/del/exec",
								{"id":reportId,"sort":sort,"del_id":del_id,invitationId:invitationId},
								function(res) {
									$.messager.alert(res.msg, function() {
										if(res.code) {
											//提交成功,跳转回查询页面
											action("/vestate/estate/reportManage/list");
										}
									});
								}
						)
					} else {
						//点击取消时触发
					}
				}
		);
	});
	$(".cancel").on("click", function() {
		action("vestate/estate/reportManage/list");
	});
});
</script>