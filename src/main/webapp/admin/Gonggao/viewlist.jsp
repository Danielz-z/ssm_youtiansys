<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@include file="/common/static/front/jsp/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><spring:message code="system_name" /></title>
	<link rel="stylesheet" type="text/css" href="${ctx}/common/static/front/resource/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${ctx}/common/static/front/resource/css/popup.css"/>
	<script src="${ctx}/common/static/front/resource/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<body>
<%@ include file="/common/static/front/jsp/menu.jsp" %>
<!--inside content start-->
<div class="inside_wrap">
	<div class="inside_con">
		<div class="inside_box">
			<div class="ic_wrap fr">
				<h1>公告展示</h1>
				<ul class="news_list">
					<c:forEach items="${pageModel.list}" var="data" varStatus="l">
						<li><a href="${ctx}/Gonggao/view.do?id=${data.id}">${data.title }</a><span class="date">[
						 	${data.addTime}]
						 	</span></li>

					</c:forEach>
				</ul>
				<!--分页-->
				<div class="record">
					<!-- 分页开始 -->
					<pg:pager >
						<pg:last>
							共${pageModel.totalRecords}记录,共${pageModel.totalPages}页,
						</pg:last>
						当前第${pageModel.currentPageNo}页
						<pg:first>
							<a href="${ctx}/Gonggao/getAllView.do?pageModel.currentPageNo=${pageModel.topPageNo}">首页</a>
						</pg:first>
						<pg:prev>
							<a href="${ctx}/Gonggao/getAllView.do?pageModel.currentPageNo=${pageModel.previousPageNo}">上一页</a>
						</pg:prev>
						<pg:pages>
									<font color="red">[${pageModel.currentPageNo }]</font>

						</pg:pages>

						<pg:next>
							<a href="${ctx}/Gonggao/getAllView.do?pageModel.currentPageNo=${pageModel.nextPageNo}">下一页</a>
						</pg:next>
						<pg:last>
							<a href="${ctx}/Gonggao/getAllView.do?pageModel.currentPageNo=${pageModel.buttomPageNo}">尾页</a>
						</pg:last>
					</pg:pager>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
</div>
</div>
<!--footer start-->
<%@ include file="/common/static/front/jsp/footer.jsp" %>

<script src="${ctx}/common/static/front/resource/js/jquery.SuperSlide.2.1.js" type="text/javascript"></script>
<script src="${ctx}/common/static/front/resource/js/common.js"></script>
<script src="${ctx}/common/static/front/resource/js/jquery.slides.min.js"></script>
</body>
</body>
</html>
</head>
