<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ include file="/common/css.jsp"%>
<%@ include file="/common/js.jsp"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<base href="<%=basePath%>">
	<title>用户查看</title>
</head>
<body>
<div class="pd-20">
	<table class="table">
		<tbody>
		<tr>
			<th class="text-r" width="80">所属油田：</th>
			<td>${safetyInfo.oilFieldInfo.location}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">日期：</th>
			<td>${safetyInfo.shijian}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">总体安全状况：</th>
			<td>${safetyInfo.overall}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">事故数量：</th>
			<td>${safetyInfo.incident}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">备注：</th>
			<td>${safetyInfo.bz}</td>
		</tr>

		</tbody>
	</table>
</div>

<!--请在下方写此页面业务相关的脚本-->

</body>
</html>
