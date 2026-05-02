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
<title><spring:message code="system_name" />
</title>

</head>
<body>
	<div class="page-container">
		<form
			action="${pageContext.request.contextPath}/User/saveOrupdate.do" enctype="multipart/form-data"
			method="post" class="form form-horizontal" id="form-article-add">
			<c:if test="${util.id != null}">                                          
				<input id="id" name="id" value="${util.id }" type="hidden" />
			</c:if>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
						class="c-red">*</span>图片预览：</label>
				<div class="formControls col-xs-6 col-sm-3">
					<img src="/ssm_youtiansys/upload/${util.s_16 }"  onerror="this.src='/ssm_youtiansys/upload/person.png';this.onerror=null;" width="200" height="200" alt="">
				</div>
				<label class="form-label col-xs-2 col-sm-2"><span
						class="c-red">*</span>图片上传：</label>
				<div class="formControls col-xs-8 col-sm-4">
					<input type="file" name="myfiles">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>用户名：</label>
				<div class="formControls col-xs-6 col-sm-3">
					<input name="s_0" id="util.s_0" value="${util.s_0 }"
						class="input-text" type="text" />
				</div>
				<label class="form-label col-xs-2 col-sm-2"><span
					class="c-red">*</span>密码：</label>
				<div class="formControls col-xs-8 col-sm-4">
					<input name="s_1" id="util.s_1" value="${util.s_1 }" <c:if test="${util.s_1 ne null}">
						disabled="disabled"
					</c:if>
						class="input-text" type="password" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>姓名：</label>
				<div class="formControls col-xs-6 col-sm-3">
					<input name="s_2" id="util.s_2" value="${util.s_2 }"
						class="input-text" type="text" />
				</div>
				<label class="form-label col-xs-2 col-sm-2"><span
					class="c-red">*</span>出生日期：</label>
				<div class="formControls col-xs-8 col-sm-4">
					<input type="text" name="s_3" value="${util.s_3 }" readonly="readonly"
						onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd'})" id="datemin"
						class="input-text Wdate" style="width:180px;">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">性别：</label>
				<div class="formControls col-xs-6 col-sm-3">
					<input name="s_4" type="radio"
						<c:if test="${util.s_4 != '男' }">checked</c:if> value="男" /> 男 <input
						name="s_4" type="radio"
						<c:if test="${util.s_4 == '女'}">checked</c:if> value="女" /> 女
				</div>
				<label class="form-label col-xs-2 col-sm-2"></span>联系方式：</label>
				<div class="formControls col-xs-8 col-sm-4">
					<input name="s_5" id="util.s_5" value="${util.s_5 }"
						class="input-text" type="text" />
				</div>
			</div>


			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">QQ：</label>
				<div class="formControls col-xs-6 col-sm-3">
					<input name="s_6" id="util.s_6" value="${util.s_6 }"
						class="input-text" type="text" />
				</div>
				<label class="form-label col-xs-2 col-sm-2">微信：</label>
				<div class="formControls col-xs-8 col-sm-4">
					<input name="s_7" id="util.s_7" value="${util.s_7 }"
						class="input-text" type="text" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">籍贯：</label>
				<div class="formControls col-xs-6 col-sm-3">
					<input name="s_8" id="util.s_8" value="${util.s_8 }"
						class="input-text" type="text" />
				</div>
				<label class="form-label col-xs-2 col-sm-2">家庭住址：</label>
				<div class="formControls col-xs-8 col-sm-4">
					<input name="s_9" id="util.s_9" value="${util.s_9 }"
						class="input-text" type="text" />
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>身份类型：</label>
				<div class="formControls col-xs-6 col-sm-3">
					<span class="select-box"> <select name="s_11"
							<c:if test="${ util.id ne null }">
								disabled = "disabled"
							</c:if>
						class="select">
						    $role_select_code
					</select>
					</span>
				</div>
				<label class="form-label col-xs-2 col-sm-2">备注：</label>
				<div class="formControls col-xs-8 col-sm-4">

					<input name="s_15" id="util.s_15" value="${util.s_15 }"
						class="input-text" type="text" />
				</div>
			</div>
	</div>

	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
			<button class="btn btn-primary radius" type="submit">
				<i class="Hui-iconfont">&#xe632;</i> 保存
			</button>
			<a type="button" id = "changpwd" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe66c;</i> 重置密码
			</a>
			<button onClick="layer_close();" class="btn btn-default radius"
				type="button"><i class="Hui-iconfont">&#xe66b;</i>取消</button>
			&nbsp;&nbsp; <font style="margin-left:20px;" color=red><font color=red>${errMsg } </font></font>
		</div>
	</div>
	</form>
		<script type="application/javascript">
			function layer_close(){
				window.history.go(-1);
			}
			$("#changpwd").click(function(){
				var id = $("#id").val();
				$.post("${pageContext.request.contextPath}/User/resetPwd.do",{"id":id},function(data,status){
					alertHui("密码重置成功通知",jQuery.parseJSON(data).msg);
				});
			});
		</script>
	</div>
	<%@ include file="/admin/system/footer.jsp"%>
</body>
</html>
