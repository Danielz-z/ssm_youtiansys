<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	Calendar calendar = Calendar.getInstance();
	int now = calendar.get(Calendar.YEAR);
%>
<style>
	footer{
		position: relative;
		bottom: 0;
		width: 98%;
		/*height: 60px;*/
	}
</style>
<footer class="hui-layout-footer">
	<div class="hui-footer">
		<div class="hui-layout-content">
			<nav class="hui-footer-nav">
				<a target="_blank" href="${pageContext.request.contextPath}">项目首页</a>
				<%--                <span class="hui-pipe">|</span>--%>
			</nav>
			<p>Copyright &copy;<%=now-1%>-<%=now%> <spring:message code="system_name" /> All Rights Reserved. <br>
				京ICP备00000000号-1
			</p>
		</div>
	</div>
</footer>
<!-- dcFooter 结束 -->
<div class="clear"></div>