<!-- /**
 * author:dyb1296
 * time:2024-4-14 11:35:02
 * email:dyb1296@qq.com
 * function:当日报警情况文件上传成功页面
 */ -->    
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
	<meta http-equiv="Refresh" content="3;URL=${pageContext.request.contextPath}/DailyAlarms/getAllDataInPage.do">
	<base href="<%=basePath%>">
	<title><spring:message code="system_name" /></title>
	<style type="text/css">
		.hui-result {
			padding-top: 60px;
			padding-bottom: 60px;
		}
		.hui-result .hui-result-icon {
			text-align: center;
		}
		.hui-result .hui-result-icon .hui-iconfont {
			font-size: 72px;
		}
		.hui-result .hui-result-title {
			font-size: 24px;
			color: #afb5bf;
		}
		.hui-result .hui-result-extra {
			font-size: 14px;
			color: #afb5bf;
		}
		.hui-result.hui-result-success .hui-iconfont {
			color: #5eb95e;
		}
		.hui-result.hui-result-info .hui-iconfont {
			color: #5a98de;
		}
		.hui-result.hui-result-warning .hui-iconfont {
			color: #f37b1d;
		}
		.hui-result.hui-result-error .hui-iconfont {
			color: #c00;
		}
	</style>
</head>
<body>
<div class="hui-result hui-result-info">
	<div class="hui-result-icon"><i class="hui-iconfont va-m">&#xe6e1;</i></div>
	<div class="hui-result-title" style="text-align: center">文件上传成功</div>
		<div style="margin-left: 46%;margin-right: 46%;margin-top: 20px" class="hui-result-extra">
			<p>3秒后跳转</p>
			<p>您也可以<a href="${pageContext.request.contextPath}/DailyAlarms/getAllDataInPage.do" class="c-primary ml-20">返回</a></p>
		</div>
</div>
<%@ include file="/admin/system/footer.jsp"%>
</body>
</html>
