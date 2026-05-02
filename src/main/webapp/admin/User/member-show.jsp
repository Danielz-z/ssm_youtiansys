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
<div class="cl pd-20" style=" background-color:#5bacb6">
	<img class="avatar size-XL l"  src="/ssm_youtiansys/upload/${user.s_16 }" onerror="this.src='/ssm_youtiansys/upload/person.png';this.onerror=null;">
	<dl style="margin-left:80px; color:#fff">
		<dt>
			<span class="f-18">${user.s_2}</span>
			<span class="pl-10 f-12">角色：
				<c:if test="${user.s_11 == 'user'}">
					老人角色
				</c:if>
                <c:if test="${user.s_11 == 'hugong'}">
					护工角色
				</c:if>
                <c:if test="${user.s_11 == 'admin'}">
					管理员角色
				</c:if>
				</span>
			<%--			<span class="pl-10 f-12">角色：${user.u_percent}</span>--%>
		</dt>
		<dd class="pt-10 f-12" style="margin-left:0">${user.s_9}</dd>
	</dl>
</div>
<div class="pd-20">
	<table class="table">
		<tbody>
		<tr>
			<th class="text-r" width="80">用户名：</th>
			<td>${user.s_0}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">性别：</th>
			<td>${user.s_4}</td>
		</tr>
		<tr>
			<th class="text-r" width="80">生日：</th>
			<td>${user.s_3}</td>
		</tr>
		<tr>
			<th class="text-r">手机：</th>
			<td>${user.s_5}</td>
		</tr>
		<tr>
			<th class="text-r">qq：</th>
			<td>${user.s_6}</td>
		</tr>
		<tr>
			<th class="text-r">微信：</th>
			<td>${user.s_7}</td>
		</tr>
		<tr>
			<th class="text-r">籍贯：</th>
			<td>${user.s_8}</td>
		</tr>
		<%--		<tr>--%>
		<%--			<th class="text-r">地址：</th>--%>
		<%--			<td>${user.s_9}</td>--%>
		<%--		</tr>--%>

		</tbody>
	</table>
</div>

<!--请在下方写此页面业务相关的脚本-->
</body>
</html>