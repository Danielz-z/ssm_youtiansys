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
			<th class="text-r" width="80">位置：</th>
			<td>${oilFieldInfo.location}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">当前状态：</th>
			<td>${oilFieldInfo.status}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">日产量：</th>
			<td>${oilFieldInfo.production}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">备注：</th>
			<td>${oilFieldInfo.bz}</td>
		</tr>

		</tbody>
	</table>
</div>

<!--请在下方写此页面业务相关的脚本-->

</body>
</html>
