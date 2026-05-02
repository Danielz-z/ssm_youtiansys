<!-- /**
 * author:dyb1296
 * time:2024-4-11 11:40:17
 * email:dyb1296@qq.com
 * function:传感器类型更新或者添加（如果点击编辑，那么就是更新页面，如果点击添加进入此页面就是新增，因为添加和更新要输入的东西一样，所以做成一个页面，这样减少代码冗余）
 * MVC模式:本文件对应MVC模式下的V层（view层，也叫视图层）
 * 本文件和SSM结构的关系:SSM结构的架构就是JSP（浏览器）发送请求，然后请求到对应的Controller，然后Controller调用Service，Service调用Mapper，mapper调用数据库实现增删改查，最后由Controller返回到JSP完成全过程。
 * 本文件对应JSP
 * 箭头结构：[JSP]->Controller->Service->Mapper->数据库->获得数据or操作完成数据库后返回[JSP]
 */ -->    
<%@ page language="java" contentType="text/html; charset=UTF-8"    
	pageEncoding="UTF-8"%>                                               
<%                                                                     
	String path = request.getContextPath();                              
	String basePath = request.getScheme() + "://"                      
			+ request.getServerName() + ":" + request.getServerPort()      
			+ path + "/";                                                  
%>                                                                     
<!--下面几个都是引入一些js,css文件，把这个引入放在对应的JSP中，这样直接引入JSP的时候就可以把对应的css，js引入进来，这样写比较简洁-->
<%@ include file="/common/css.jsp"%><!--引入css-->                                 
<%@ include file="/common/js.jsp"%><!--引入js-->                                   
<%@ include file="/common/taglib.jsp"%>                              
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">      
<html>                                                                 
<head>                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!--防止中文乱码-->
<base href="<%=basePath%>">                                          
<title><spring:message code="system_name" /></title>                 
<script type="text/javascript" src="/ssm_youtiansys/common/static/echarts/echarts.min.js"></script>

		<script type="text/javascript">
			function check(){
				var stype = document.getElementById("stype");
				if('' == stype.value.replace(/(^\s*)|(\s*$)/g, "") ){
					alertHui("提示","请输入内容");
					stype.value = "";
					stype.focus();
					return false;
				}
				var bz = document.getElementById("bz");
				if('' == bz.value.replace(/(^\s*)|(\s*$)/g, "") ){
					alertHui("提示","请输入内容");
					bz.value = "";
					bz.focus();
					return false;
				}
				return true;
			}
		</script>
</head>                                                                
<body>                                                                            
<!--表单主体-->
	<div class="page-container">                                                  
		<form name=myform                                                           
onsubmit="startsync()"			action="${pageContext.request.contextPath}/SensorType/saveOrupdate.do"
			method="post" class="form form-horizontal" >                            
			<c:if test="${util.id != null}">                                          
				<input name="id" value="${util.id }" type="hidden" />          
			</c:if>                                                                     
			<div class="row cl">                                              
				<label class="form-label col-xs-4 col-sm-2"><span               
					class="c-red"></span>类型：</label>                           
				<div class="formControls col-xs-8 col-sm-9">                    
					<input type="text" class="input-text" name="stype"     
						value="${util.stype }" placeholder="类型" id="stype" >
				</div>                                                            
			</div>                                                              
			<div class="row cl">                                                    
				<label class="form-label col-xs-4 col-sm-2">备注：</label>            
				<div class="formControls col-xs-8 col-sm-9">                          
					<textarea id="bz" class="textarea" name="bz">${util.bz }</textarea>
				</div>                                                                  
			</div>                                                                    
			<div class="row cl">                                                                   
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">                      
					<c:if test="${util.id == null || user_type == 'admin'}">
					<button                                                                              
						class="btn btn-primary radius" type="submit" id="submit">                                  
						<i class="Hui-iconfont">&#xe632;</i> 保存                                        
					</button>                                                                            
					<!--保存按钮，因为form标签中有action的路径，所以提交后发送到对应页面-->
					<button onClick="layer_close();" class="btn btn-default radius"                  
						type="button"><i class="Hui-iconfont">&#xe66b;</i>取消</button>&nbsp;&nbsp;                  
						<font style="margin-left:20px;" color=red>${errMsg } </font>
					</c:if>
				</div>                                                                                 
			</div>                                                                                   
		<script type="text/javascript">
				var he = HE.getEditor('bz');//其中的editor是文本输入框(textarea)的id
				he.getHtml();//获取HTML代码
				he.getText();//获取纯文本
				he.sync();//将编辑器里面的内容同步到文本输入框(textarea)
				function startsync(){
					he.sync();
				}
			</script>                      
<script type="text/javascript">
				var submit=document.getElementById("submit");
				if(submit){

				}else{
					var inputs = document.getElementsByTagName("input");
					for(var i = 0;i<inputs.length;i++){
						inputs[i].disabled = "disabled";
					}
					var textareas = document.getElementsByTagName("textarea");
					for(var i = 0;i<textareas.length;i++){
						textareas[i].disabled = "disabled";
					}
					var radios = document.getElementsByTagName("radio");
					for(var i = 0;i<radios.length;i++){
						radios[i].disabled = "disabled";
					}
				}
			</script>
	</form> </div>                                                                                       
                                                                                               
<!--点击取消的时候，执行这个函数-->
<script type="application/javascript">
	function layer_close(){
		window.history.go(-1);
	}
</script>
${msg}
<%@ include file="/admin/system/footer.jsp"%>
</body>                                                                                        
</html>                                                                                        
