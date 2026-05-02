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
			<td>${dailyAlarms.oilFieldInfo.location}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">传感器类型：</th>
			<td>${dailyAlarms.sensorType.stype}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">状态：</th>
			<td>${dailyAlarms.status}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">时间：</th>
			<td>${dailyAlarms.time}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">位置：</th>
			<td>${dailyAlarms.location}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">备注：</th>
			<td>${dailyAlarms.bz}</td>
		</tr>

		</tbody>
	</table>
</div>

<!--请在下方写此页面业务相关的脚本-->

</body>
</html>
