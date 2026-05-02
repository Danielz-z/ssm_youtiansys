<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/common/static/front/jsp/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><spring:message code="system_name" /></title>
	<link rel="stylesheet" type="text/css" href="/ssm_youtiansys/common/static/front/resource/css/style.css" />
	<link rel="stylesheet" type="text/css" href="/ssm_youtiansys/common/static/front/resource/css/popup.css"/>
	<script src="/ssm_youtiansys/common/static/front/resource/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<body>
<%@ include file="/common/static/front/jsp/menu.jsp" %>
<!--inside content start-->
<div class="inside_wrap">
	<div class="inside_con">
		<div class="inside_box">
			<div class="ic_wrap fr">
				<h3 class="n_title">${obj.shijian}<span class="n_date">${obj.addTime}</span></h3>
				<p>${obj.bz}</p>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<!--footer start-->
<%@ include file="/common/static/front/jsp/footer.jsp" %>

<script src="/ssm_youtiansys/common/static/front/resource/js/jquery.SuperSlide.2.1.js" type="text/javascript"></script>
<script src="/ssm_youtiansys/common/static/front/resource/js/common.js"></script>
<script src="/ssm_youtiansys/common/static/front/resource/js/jquery.slides.min.js"></script>
</body>
</body>
</html>
</head>
