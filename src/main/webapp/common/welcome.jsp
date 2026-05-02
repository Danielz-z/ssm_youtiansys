<%@ page import="java.util.Calendar" %>
<%--
  Created by dyb1296.
  User: www.icodedock.com
  Date: 2022/7/15
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/ssm_youtiansys/common/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/ssm_youtiansys/common/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/ssm_youtiansys/common/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/ssm_youtiansys/common/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/ssm_youtiansys/common/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/ssm_youtiansys/common/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/ssm_youtiansys/common/static/h-ui.admin/css/style.css" />
    <%@ include file="/common/taglib.jsp"%>
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>我的桌面</title>
</head>
<body>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<div class="page-container">
    <p class="f-20 text-success">欢迎您使用本系统，当前您的角色为<span class="hui-label hui-label-success radius" ><spring:message code="sys_${user_type}" /></span>
  <c:if test="${ user_type eq 'admin'}">
        <span style="color: #d9534f"><i>鉴于您的权限很高，请不要随便删除管理员角色的账号！</i></span>
    </c:if></p>
    <p>登录IP：127.0.0.1 </p>
  您的个人信息资料完善度(${sessionUser.percent}) ${sessionUser.s_10}
    <div class="hui-progress">
        <div class="hui-progress-bar" style="background: #f2f2f2">
            <span class="sr-only" style="width:${sessionUser.percent}"></span>
        </div>
    </div>

<table class="table table-border table-bordered table-bg mt-20">
        <thead>
        <tr>
            <th colspan="2" scope="col">本项目信息</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th width="30%">项目访问地址</th>
            <td><span id="lbServerName"><%=basePath%></span></td>
        </tr>
        <tr>
            <td>数据库表的数量以及解释</td>
            <td>${database}张表(分别是t_user(用户表),t_gonggao(公告管理表),t_oilfieldinfo(油田基本情况表),t_safetyinfo(油田安全情况表),t_aramtype(报警类型表),t_alarmstats(报警类型统计表),t_sensortype(传感器类型表),t_dailyalarms(当日报警情况表),t_sensordata(传感器数据表))</td>
        </tr>

        <tr>
            <td>技术框架 </td>

            <td><ol class="hui-list hui-list-top">
             <li class="hui-list-item"><span class="num">前端</span>HTML+CSS+JS+Jquery+H-ui+Ajax</li>
             <li class="hui-list-item"><span class="num">后端</span>Java+Jsp+Spring+SpringMVC+Mybatis(简称SSM框架)</li>
             <li class="hui-list-item"><span class="num">服务器</span>Tomcat</li>
             <li class="hui-list-item"><span class="num">数据库</span>Mysql数据库</li>
      </ol></td>
        </tr>
        <tr>
            <td>基本功能概略 </td>
            <td>系统功能：[用户管理,登录,修改个人信息]
            <br>业务功能：[公告管理, 油田基本情况, 油田安全情况, 报警类型, 报警类型统计, 传感器类型, 当日报警情况, 传感器数据]
            <br>亮点技术1:[富文本编辑器|HandyEditor]
            <br>亮点技术2:[统计图功能|Echarts]
            <br>亮点技术3:[数据导出功能|POI]</td>
        </tr>

        <tr>
            <td>作者信息 </td>
            <td>dyb1296</td>
        </tr>

        <tr>
            <td>联系方式 </td>
            <td>dyb1296@qq.com</td>
        </tr>

        <tr>
            <td>完成时间 </td>
            <td>2024-03-31~2024-04-15</td>
        </tr>
        </tbody>
    </table></div>
<BR/>
<BR/>
<%
    Calendar calendar = Calendar.getInstance();
    int now = calendar.get(Calendar.YEAR);
%>
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
<script type="text/javascript" src="/ssm_youtiansys/common/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/ssm_youtiansys/common/static/h-ui/js/H-ui.min.js"></script>

</body>
</html>
