<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<title><spring:message code="system_name" /></title>
</head>
<body>
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl">
			<div style="margin-right:120px;">
				<a class="logo navbar-logo f-l mr-10 hidden-xs" style="font-size:20px"
				   href="index.jsp"><i class="hui-iconfont">&#xe62e;</i>&nbsp;<spring:message code="system_name" /><span style="font-size: 10px"> <b><spring:message code="sys_${user_type}" /></b></span>
				</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs"
						href="index.jsp"> </a> <span
					class="logo navbar-slogan f-l mr-10 hidden-xs"> </span> <a
					aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
					href="javascript:;">&#xe667;</a>
			</div>
			<nav class="nav navbar-nav">

			</nav>
			<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
				<ul class="cl">
					<li>欢迎光临</li>
					<li class="dropDown dropDown_hover"><a
							class="dropDown_A">${username } <img style="border-radius:15px;width:30px;height: 30px"  class="hui-image hui-image-responsive" src="/ssm_youtiansys/upload/${sessionUser.s_16 }"  onerror="this.src='/ssm_youtiansys/upload/person.png';this.onerror=null;"><i class="Hui-iconfont">&#xe6d5;</i> </a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" onClick="myselfinfo()">帮助</a>
							</li>
							<li><a href="#">退出</a>
							</li>
						</ul></li>
					<li id="Hui-skin" class="dropDown right dropDown_hover"><a
							href="javascript:;" class="dropDown_A" title="换肤"><i
							class="Hui-iconfont" style="font-size:18px">&#xe62a;</i> </a>
						<ul class="dropDown-menu menu radius box-shadow">
							<li><a href="javascript:;" data-val="default" title="默认（渐变）">默认（渐变）</a>
							</li>
							<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
							</li>
							<li><a href="javascript:;" data-val="green" title="绿色">绿色</a>
							</li>
							<li><a href="javascript:;" data-val="red" title="红色">红色</a>
							</li>
							<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
							</li>
							<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a>
							</li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<%@ include file="/admin/system/menu2.jsp"%>
	</div>
</aside>
<div class="dislpayArrow hidden-xs">
	<a class="pngfix" href="javascript:void(0);"
	   onClick="displaynavbar(this)"></a>
</div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面"
										 data-href="common/welcome.jsp">我的桌面</span> <em></em>
				</li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group">
			<a id="js-tabNav-prev" class="btn radius btn-default size-S"
			   href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i> </a><a
				id="js-tabNav-next" class="btn radius btn-default size-S"
				href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i> </a>
		</div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="User/getInfo.do"></iframe>
		</div>
	</div>
</section>
<%
	if(request.getSession().getAttribute("sessionUser") == null){
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}
%>

</body>
</html>
