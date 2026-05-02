<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/common/static/front/jsp/taglibs.jsp"%>
 <style>
</style>
		<div class="header_wrap">
			<div class="header">
				<span class="wel_word fl">欢迎访问<spring:message code="system_name" /></span>
				<span class="corner fr">
					<ul>
					  <c:if test="${userId1 == null }">
						  <li class="login_li"><a href="login_ulogin.do" class="tc">登录</a></li>
					  </c:if>
					  <c:if test="${userId1 != null }">
							  <li class="user_li nLi">
									<a href="javascript:void(0);">欢迎您：${userName }</a>
							  </li>

						  <li class="user_li nLi">
							   <a href="${ctx }/login_pass.do">修改密码</a>
							   </li>
						  <li class="user_li nLi">
							   <a href="${ctx }/login_utu.do">退出</a>
							   </li>
					  </c:if>
					</ul>
					<div class="clear"></div>
				</span>
				<div class="clear"></div>
			</div>
<%--			<div id="gray"></div>--%>
			</div>
		<!--nav start-->
		<div class="nav_menu">
			<a href="${ctx}/login_uIndex.do" class="logo fl"><img src="" /><span style="font-size: 30px"><spring:message code="system_name" /></span></a>
			<div class="nav_list fr">
				<ul id="nav" class="nav clearfix">
					<li class="nLi"></li>
					<li class="nLi">
						<h3><a href="${ctx}/gg_ugg.do">通知公告</a></h3>
					</li>
					<li class="nLi">
						<h3><a href="${ctx}/dt_udt.do">科研动态</a></h3>
					</li>
					<li class="nLi">
						<h3><a href="${ctx}/cg_ucg.do">教研成果</a></h3>
					</li>
					<li class="nLi">
						<h3><a href="${ctx}/kl_ukl.do">优秀课例</a></h3>
					</li>
					<li class="nLi">
						<h3><a href="${ctx}/zl_uzl.do">资料下载</a></h3>
					</li>
					<li class="nLi">
						<h3><a href="${ctx}/ly_view.do">留言板</a></h3>
					</li>
				</ul>
			</div>
		</div>
			<div class="clear"></div>
		</div>
