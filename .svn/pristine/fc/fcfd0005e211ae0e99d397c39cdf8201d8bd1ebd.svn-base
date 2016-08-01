<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%
	String ctx = request.getContextPath();
	request.setAttribute("ctx",ctx);
%>
<style type="text/css">
	.content {
		width: 980px;
		margin: 0 auto;
		background: #F5F7FA;
	}
	.content-page {
		width: 980px;
		margin: 0 auto;
	}
	.clearfix {
		zoom: 1;
	}
	.card_top_theme2 {
		border-left: 1px solid #E5E5E5;
		border-top: 1px solid #E5E5E5;
		border-right: 1px solid #E5E5E5;
		margin-right: -2px;
	}
	.card_top_wrap {
		background-color: #F2F4F7;
		background-image: -moz-linear-gradient(top,#F5F7FA,#F2F4F7);
		background-image: -webkit-linear-gradient(top,#F5F7FA,#F2F4F7);
		background-image: -o-linear-gradient(top,#F5F7FA,#F2F4F7);
		background-image: -webkit-linear-gradient(top,#F5F7FA,#F2F4F7);
		background-image: linear-gradient(top,#F5F7FA,#F2F4F7);
		_background: #F2F4F7;
	}
	.card_top_theme2 .card_title_fname {
		font-size: 20px;
		font-weight: bold;
		margin-top: 5px;
	}
	.card_title_fname:visited {
		text-decoration: none;
		color: #333;
	}
	a:visited {
		text-decoration: none;
	}
	.pb_content {
		background: url(http://tb2.bdstatic.com/tb/static-pb/img/pb_bright_background_7d89132.png) repeat-y;
	}
	.pb_content {
		width: 980px;
		background: #F5F7FA;
		border-right: 1px solid #e5e5e5;
	}
	.core_title_wrap_bright {
		width: 980px;
		height: 56px;
		line-height: 56px;
		background: #fff;
		border-bottom: 1px solid #BBBDBF;
		position: relative;
	}
	.core_title_txt {
		margin-left: 20px;
		position: relative;
		z-index: 10;
		font-family: "microsoft yahei" simhei sans-serif;
		font-weight: 400;
		font-size: 16px;
	}
	.pull_left, .pull-left {
		float: left!important;
	}
	.text_overflow, .text-overflow {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.l_post_bright {
		border: 0;
		border-left: 1px solid #E5E5E5;
		border-bottom: 1px solid #E1E4E6;
		background: url(http://tb2.bdstatic.com/tb/static-pb/widget/post_list/img/bg_ba2195f.jpg) repeat-y;
		width: 980px;}
	.d_author,.d_author_anonym {
		width: 130px;
		float: left;
		text-align: center;
		padding: 15px 0;
	}
	li {
		display: list-item;
		text-align: -webkit-match-parent;
	}
	.d_post_content_main {
		position: relative;
		float: left;
		width: 788px;
		padding: 0 0 8px 20px;
		background: #fff;
	}
	html, body, div, p, ul, li, ol, dl, dt, dd, pre, code, table, tr, td, form, fieldset, legend, button, input, textarea, h1, h2, h3, h4, h5, h6, hr, blockquote {
		margin: 0;
		padding: 0;
	}
	.d_post_content {
		line-height: 24px;
		font-size: 14px;
		word-wrap: break-word;
	}
	.l_post_bright .d_post_content_main .p_content {
		height: auto!important;
		height: 170px;
		min-height: 170px;
	}
	.d_post_content {
		line-height: 24px;
		font-size: 14px;
		word-wrap: break-word;
	}
	.core_reply_tail {
		line-height: 28px;
		text-align: right;
	}
	li{list-style: none;}
	img{display:inline-block;width:150px; height:120px;}
	.p_author_name{font-weight: bold;}
	</style>

<form class="form-inline search_form" method="post" action="${ctx}/vestate/estate/invitationManage/detail">
	<input id="id" name = "id" type="hidden" value="${invitation.id}"/>
<div class="content clearfix">
<c:if test="${requestScope.PAGE.current==1}">
	<div class="l_post l_post_bright j_l_post clearfix ">
		<div class="card_top_wrap clearfix card_top_theme2 ">
			<a class="card_title_fname" title=""> ${invitation.invitationCate.name}吧</a>
		</div>
		<div class="pb_content clearfix">
			<div class="core_title_wrap_bright clearfix"><h3>回复：${invitation.invitationTitle}</h3></div>
		</div>
			<div class="d_author">
				<ul class="p_author">
					<li class="d_name" >
						<a class="p_author_name">${invitation.userName}</a>
					</li>
					<li class="d_name" >
					</li>
					<li class="d_name" >
						<h4>楼主</h4>
					</li>
				</ul>
			</div>
			<div class="d_post_content_main  d_post_content_firstfloor">
				<div class="p_content ">
					<br><br><br><br>
					<div class="d_post_content j_d_post_content ">
					<c:if test="${invitation.picList!=null}">
						<c:forEach var="item" items="${invitation.picList}" >
							<img src="${url_prefix}${item.path}">
						</c:forEach>
					</c:if>
						<br><br>
						${invitation.invitationContent}
					</div>
				</div>
				<div class="thread_recommend thread-recommend">
					<div class="core_reply_tail clearfix">
						<span class="tail-info">楼主</span>
						<span class="tail-info"><fmt:formatDate value="${invitation.invitationTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>

					</div>
				</div>
			</div>
		</div>
</c:if>
		<c:if test="${PAGE.records!=null}">
			<c:forEach var="item" items="${PAGE.records}" >
			<div class="l_post l_post_bright j_l_post clearfix ">
			<div class="d_author">
				<div class="louzhubiaoshi_wrap">
					<div class="louzhubiaoshi  j_louzhubiaoshi" author="${item.fromUserName}">
						<a></a>
					</div>
				</div>
				<ul class="p_author">
					<li class="d_name" >
						<a>${item.fromUserName}</a>
					</li>
				</ul>
			</div>
			<div class="d_post_content_main  d_post_content_firstfloor">
				<div class="p_content ">
					<br><br>
					<div class="d_post_content j_d_post_content ">
						<c:if test="${item.picList!=null}">
							<c:forEach var="pic" items="${item.picList}" >
								<img src="${url_prefix}${pic.path}">
							</c:forEach>
							<br><br>
						</c:if>

						${item.commentContent}
					</div>
				</div>
				<div class="thread_recommend thread-recommend">
					<div class="core_reply_tail clearfix">
						<span class="tail-info">${item.floorCode}楼</span>
						<span class="tail-info"><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>

					</div>
				</div>
			</div>
		</div>
			</c:forEach>
		</c:if>
</div>
</form>
<div class="content-page"><tiles:insertDefinition name="vestate.base.page.definition"></tiles:insertDefinition></div>
<div class="clearfix form-actions">
	<div class="col-md-offset-3 col-md-9">
		<button class="btn btn-danger cancel" type="button">
			<i class="ace-icon fa fa-undo bigger-110"></i> 返回
		</button>
	</div>
</div>
<script type="text/javascript">
	$(".cancel").on("click", function() {
		action("/vestate/estate/invitationManage/list");
	});
</script>