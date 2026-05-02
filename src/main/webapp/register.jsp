<%--
  Created by dyb1296.
  User: dyb1296
  Date: 2022/7/16
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="system_name" />-注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/static/login/lib/layui-v2.6.3/css/layui.css" media="all">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/common/lib/jquery/1.9.1/jquery.min.js"></script>
    <style>
        .main-body {top:50%;left:50%;position:absolute;-webkit-transform:translate(-50%,-50%);-moz-transform:translate(-50%,-50%);-ms-transform:translate(-50%,-50%);-o-transform:translate(-50%,-50%);transform:translate(-50%,-50%);overflow:hidden;}
        .login-main .login-bottom .center .item input {display:inline-block;width:227px;height:22px;padding:0;position:absolute;border:0;outline:0;font-size:14px;letter-spacing:0;}
        .login-main .login-bottom .center .item .icon-1 {background:url(${pageContext.request.contextPath}/login/images/login/icon-login.png) no-repeat 1px 0;}
        .login-main .login-bottom .center .item .icon-2 {background:url(${pageContext.request.contextPath}/login/images/login/icon-login.png) no-repeat -54px 0;}
        .login-main .login-bottom .center .item .icon-3 {background:url(${pageContext.request.contextPath}/login/images/login/icon-login.png) no-repeat -106px 0;}
        .login-main .login-bottom .center .item .icon-4 {background:url(${pageContext.request.contextPath}/login/images/login/icon-login.png) no-repeat 0 -43px;position:absolute;right:-10px;cursor:pointer;}
        .login-main .login-bottom .center .item .icon-5 {background:url(${pageContext.request.contextPath}/login/images/login/icon-login.png) no-repeat -55px -43px;}
        .login-main .login-bottom .center .item .icon-6 {background:url(${pageContext.request.contextPath}/login/images/login/icon-login.png) no-repeat 0 -93px;position:absolute;right:-10px;margin-top:8px;cursor:pointer;}
        .login-main .login-bottom .tip .icon-nocheck {display:inline-block;width:10px;height:10px;border-radius:2px;border:solid 1px #9abcda;position:relative;top:2px;margin:1px 8px 1px 1px;cursor:pointer;}
        .login-main .login-bottom .tip .icon-check {margin:0 7px 0 0;width:14px;height:14px;border:none;background:url(login/images/login/icon-login.png) no-repeat -111px -48px;}
        .login-main .login-bottom .center .item .icon {display:inline-block;width:33px;height:22px;}
        .login-main .login-bottom .center .item {width:288px;height:35px;border-bottom:1px solid #dae1e6;margin-bottom:35px;}
        .login-main {width:428px;position:relative;float:left;}
        .login-main .login-top {height:80px;background-color:#148be4;border-radius:12px 12px 0 0;font-family:SourceHanSansCN-Regular;font-size:30px;font-weight:400;font-stretch:normal;letter-spacing:0;color:#fff;line-height:80px;text-align:center;overflow:hidden;-webkit-transform:rotate(0);-moz-transform:rotate(0);-ms-transform:rotate(0);-o-transform:rotate(0);transform:rotate(0);}
        .login-main .login-top .bg1 {display:inline-block;width:74px;height:74px;background:#fff;opacity:.1;border-radius:0 74px 0 0;position:absolute;left:0;top:43px;}
        .login-main .login-top .bg2 {display:inline-block;width:94px;height:94px;background:#fff;opacity:.1;border-radius:50%;position:absolute;right:-16px;top:-16px;}
        .login-main .login-bottom {width:428px;background:#fff;border-radius:0 0 12px 12px;padding-bottom:20px;}
        .login-main .login-bottom .center {width:288px;margin:0 auto;padding-top:40px;padding-bottom:15px;position:relative;}
        .login-main .login-bottom .tip {clear:both;height:16px;line-height:16px;width:288px;margin:0 auto;}
        body {background:url(${pageContext.request.contextPath}/login/images/login/loginbg.png) 0% 0% / cover no-repeat;position:static;font-size:12px;}
        input::-webkit-input-placeholder {color:#a6aebf;}
        input::-moz-placeholder {/* Mozilla Firefox 19+ */            color:#a6aebf;}
        input:-moz-placeholder {/* Mozilla Firefox 4 to 18 */            color:#a6aebf;}
        input:-ms-input-placeholder {/* Internet Explorer 10-11 */            color:#a6aebf;}
        input:-webkit-autofill {/* 取消Chrome记住密码的背景颜色 */            -webkit-box-shadow:0 0 0 1000px white inset !important;}
        html {height:100%;}
        .login-main .login-bottom .tip {clear:both;height:16px;line-height:16px;width:288px;margin:0 auto;}
        .login-main .login-bottom .tip .login-tip {font-family:MicrosoftYaHei;font-size:12px;font-weight:400;font-stretch:normal;letter-spacing:0;color:#9abcda;cursor:pointer;}
        .login-main .login-bottom .tip .forget-password {font-stretch:normal;letter-spacing:0;color:#1391ff;text-decoration:none;position:absolute;right:62px;}
        .login-main .login-bottom .login-btn {width:288px;height:40px;background-color:#1E9FFF;border-radius:16px;margin:24px auto 0;text-align:center;line-height:40px;color:#fff;font-size:14px;letter-spacing:0;cursor:pointer;border:none;}
        .login-main .login-bottom .center .item .validateImg {position:absolute;right:1px;cursor:pointer;height:36px;border:1px solid #e6e6e6;}
        .footer {left:0;bottom:0;color:#fff;width:100%;position:absolute;text-align:center;line-height:30px;padding-bottom:10px;text-shadow:#000 0.1em 0.1em 0.1em;font-size:14px;}
        .padding-5 {padding:5px !important;}
        .footer a,.footer span {color:#fff;}
        @media screen and (max-width:428px) {.login-main {width:360px !important;}
            .login-main .login-top {width:360px !important;}
            .login-main .login-bottom {width:360px !important;}
        }
    </style>
</head>
<body>
<div class="main-body">
    <div class="login-main">
        <div class="login-top">
            <span><spring:message code="system_name" /></span>
            <span class="bg1"></span>
            <span class="bg2"></span>
        </div>
        <form class="layui-form login-bottom" action="${pageContext.request.contextPath}/User/register.do"  method="post" onsubmit="return check()">
            <div class="center">
                <div class="item">
                    <span class="icon icon-2"></span>
                    <input type="text" name="s_0" lay-verify="required"  placeholder="请输入登录账号" maxlength="24"/>
                </div>

                <div class="item">
                    <span class="icon icon-3"></span>
                    <input type="password" id="password" name="s_1" lay-verify="required"  placeholder="请输入密码" maxlength="20">
                    <span class="bind-password icon icon-4"></span>
                </div>

                <div class="item">
                    <span class="icon icon-3"></span>
                    <input type="password" id="repassword"   lay-verify="required"  placeholder="请确认密码" maxlength="20">
                    <input type="hidden" name="s_11" value="user" />
                    <span id="rp" class="icon icon-4"></span>
                </div>

                <div id="validatePanel" class="item" style="width: 137px;">
                    <input type="text" name="code" placeholder="请输入验证码" maxlength="4">
                    <a href="javascript:changeCodeImg()">
                        <img id="captchaPic" class="validateImg" width="90" height="30" src="${pageContext.request.contextPath}/verifyCodeImageGenServlet"></a>
                </div>

            </div>
            <div class="tip">
                <a href="${pageContext.request.contextPath}/login.jsp" class="forget-password">用户登录</a>
            </div>
            <div class="layui-form-item" style="text-align:center; width:100%;height:100%;margin:0px;">
                <button class="login-btn" lay-submit="" lay-filter="login">立即注册</button><br><br>
                <font
                        style="margin-left:20px;" color=red><font color=red>${errMsg} </font> </font>
            </div>
        </form>
    </div>
</div>
<div class="footer">
    ©版权所有 <spring:message code="system_name" />
</div>
<script src="${pageContext.request.contextPath}/common/static/login/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form','jquery'], function () {
        var $ = layui.jquery,
            form = layui.form,
            layer = layui.layer;

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

        $('.icon-nocheck').on('click', function () {
            if ($(this).hasClass('icon-check')) {
                $(this).removeClass('icon-check');
            } else {
                $(this).addClass('icon-check');
            }
        });

    });
</script>
<script>
    function changeCodeImg() {
        var num = Math.ceil(Math.random() * 10000);//生成一个随机数（防止缓存）
        $("#captchaPic").attr('src', "${pageContext.request.contextPath}/verifyCodeImageGenServlet?num=" + num);
    }
</script>
<script>
    function check(){
        var password = document.getElementById("password").value;
        var repassword = document.getElementById("repassword").value;
        if(password == repassword && password != null){
            return true;
        }else{
            regtip();
            return false;
        }
    }

    $('.bind-password').on('click', function () {
        if ($(this).hasClass('icon-5')) {
            $(this).removeClass('icon-5');
            $("input[name='s_1']").attr('type', 'password');
        } else {
            $(this).addClass('icon-5');
            $("input[name='s_1']").attr('type', 'text');
        }
    });

    $('#rp').on('click', function () {
        if ($(this).hasClass('icon-5')) {
            $(this).removeClass('icon-5');
            $("#repassword").attr('type', 'password');
        } else {
            $(this).addClass('icon-5');
            $("#repassword").attr('type', 'text');
        }
    });

    function regtip() {
        layer.open({
            type : 1,
            area : [ '360px', '200px' ],
            fix : false, //不固定
            maxmin : true,
            shade : 0.4,
            title : '帮助信息',
            content : '<div style="margin-left:20px;margin-top:10px;">您输入的密码两次不一致！</div>'
        });
    }

</script>
</body>
</html>