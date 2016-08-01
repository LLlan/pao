<%@ page language="java" pageEncoding="UTF-8"%>
<%
    String ctx = request.getContextPath();
    request.setAttribute("ctx",ctx);
%>
<div class="row-fluid" style="margin:20px;text-align: center">
    <p><a href="${ctx}/announceManage/getAnnounceList">小区公告</a> </p>
    <p><a href="${ctx}/guideManage/getGuideList">办事指南</a> </p>
</div>