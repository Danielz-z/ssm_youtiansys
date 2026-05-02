<!-- /**
 * author:dyb1296
 * time:2024-4-12 10:03:27
 * email:dyb1296@qq.com
 * function:油田基本情况列表（如果是管理员或者有操作权限时候就是列表页面）
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
<base href="<%=basePath%>">                                             
<title><spring:message code="system_name" />-油田基本情况</title>                    
<script type="text/javascript" src="/ssm_youtiansys/common/static/echarts/echarts.min.js"></script>
<script type="text/javascript">                                         
	function topPage() {                                                    
                                                                          
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.topPageNo}";                              
		window.location = contextPath                                         
				+ '/OilFieldInfo/getAllDataInPage.do?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function previousPage() {                                               
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.previousPageNo}";                         
		window.location = contextPath                                         
				+ '/OilFieldInfo/getAllDataInPage.do?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function nextPage() {                                                   
                                                                          
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.nextPageNo}";                             
		window.location = contextPath                                         
				+ '/OilFieldInfo/getAllDataInPage.do?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function bottomPage() {                                                 
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.buttomPageNo}";                           
		window.location = contextPath                                         
				+ '/OilFieldInfo/getAllDataInPage.do?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function datadel() {                                                    
                                                                          
		var ids = document.getElementsByName("id");                         
		var flag = 0;                                                         
		for ( var i = 0; i < ids.length; i++) {                               
			if (ids[i].checked) {                                               
				flag = 1;                                                         
				break;                                                            
			}                                                                   
		}                                                                     
		if (flag == 1) {
			layer.confirm("确定删除吗", {
				btn : ['确定', '取消']
				// 按钮
			},function(index){
				layer.close(index);
				document.myform.submit();
				return true;
			},function(index){
				layer.close(index);
				return false;
			})
		} else {                                                              
			alertHui("提示","至少选中一条记录");                                             
			return false;                                                       
		}
                                                                          
	}                                                                       
</script>                                                                 
<script type="text/javascript">
		function confirmDel(url){
			layer.confirm("确定删除吗", {
				btn : ['确定', '取消']
				// 按钮
			},function(index){
				layer.close(index);
				window.location.href = (url);
				return true;
			},function(index){
				layer.close(index);
				return false;
			})
		}
</script>
</head>                                                                   
<body class="pos-r">                                                                  
	<div>                                                                                 
		<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i> 首页              
		<span class="c-gray en">&gt;</span>油田基本情况 <span class="c-gray en">&gt;</span>
		油田基本情况列表 <a class="btn btn-success radius r"                                      
			style="line-height:1.6em;margin-top:3px"                                        
			href="javascript:location.replace(location.href);" title="刷新"><i            
			class="Hui-iconfont">&#xe68f;</i> </a> </nav>                                   
		<div class="page-container">                                                      
			<div class="text-c">                                                            
				<form                                                                           
					action="${pageContext.request.contextPath}/OilFieldInfo/getAllDataInPage.do">    
					<select id="field" name="field" class="select"
						style="width:120px;height:32px;">

						<option <c:if test="${field == 'location'}">selected</c:if> value="location" />
							位置
						</option>
						<option <c:if test="${field == 'status'}">selected</c:if> value="status" />
							当前状态
						</option>
						<option <c:if test="${field == 'production'}">selected</c:if> value="production" />
							日产量
						</option>					</select>
					 <input type="text" name="fieldValue" id="fieldValue"                              
						value="${fieldValue }" placeholder=" 请输入查找关键字" style="width:250px"                        
						class="input-text">                                                                           
					<button name="" id="" class="btn btn-success" type="submit">                              
						<i class="Hui-iconfont">&#xe665;</i> 搜索                                                     
					</button>                                                                                         
					&nbsp;&nbsp; <input class="btn btn-success" type="button"                                     
						value="清空"                                                                                  
						onclick="javascript: document.getElementById('fieldValue').value='';" />                      
					&nbsp;&nbsp;                                                                                      
				</form>                                                                                             
			</div>                                                                                                
			<div class="cl pd-5 bg-1 bk-gray mt-20">                                                            
				<span class="l">
			<c:if test="${user_type == 'admin'}"><a href="javascript:;" onclick="datadel()"                                    
					class="btn btn-danger radius">                            
						批量删除</a> 
			</c:if><c:if test="${user_type == 'admin' }">
			<a class="btn btn-primary radius" style="margin-left:20px;"                    
					href="${pageContext.request.contextPath}/OilFieldInfo/initPage.do"><i                   
						class="Hui-iconfont">&#xe600;</i> 添加</a>
			 </c:if>

					<a class="btn btn-primary radius" style="margin-left:20px;" href="${pageContext.request.contextPath}/OilFieldInfo/export.do"> <i class="Hui-iconfont">&#xe640;</i> 导出全部数据</a>
					</span> <span class="r">检索列表<strong></strong>
				</span>                                                                                             
			</div>                                                                                                
			<div class="mt-20">                                                                                 
					<!--删除全部-->
				<form                                                                                               
					action="${pageContext.request.contextPath}/OilFieldInfo/deleteManyDataByIds.do"                     
					name="myform" id="myform" method="post">                                                    
					<table                                                                                            
						class="table table-border table-bordered table-bg table-hover table-sort radius">                    
						<thead>                                                                                         
							<tr class="text-c">                                                                         
								<th width="60"><input name="" type="checkbox" value="">&nbsp;全选                   
								</th>                                                                                       
								<th width="40">主键ID</th>
								<th>位置</th>
								<th>当前状态</th>
								<th>日产量</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${fn:length(pageModel.list) < 1}">
								<tr class="text-c va-m">                    
									<td colspan=32>无记录
									<c:if test="${ user_type ne 'admin'}">
										<span style="color: #d9534f"><i>（系统检测您不是管理员账号，可能您没有权限看见该处数据或者您只能看见和您相关的数据）</i></span>
									</c:if></td>                   
								</tr>                                         
							</c:if>                                         

							<c:forEach var="tmp" items="${pageModel.list}">
								<tr class="text-c">
									<td><input name="id" value="${tmp.id }" type="checkbox">
									</td>                                                         
									<td>${tmp.id}</td>
									<td>${tmp.location }</td>
									<td>${tmp.status }</td>
									<td>${tmp.production }</td>

								<c:if test="${user_type == 'admin'}">
									<td class="td-manage">
									<a                                    
										                                                                           
										href="${pageContext.request.contextPath}/OilFieldInfo/selectList.do?id=${tmp.id }"  type="button" class="hui-btn hui-btn-success radius" 
										title="编辑"> 编辑</a> 
									<a                             
										                             
										href="javascript:confirmDel('${pageContext.request.contextPath}/OilFieldInfo/deleteUtil.do?id=${tmp.id }')"  type="button" class="hui-btn hui-btn-danger radius" 
										title="删除">删除 </a>                                
									</td>                                                                                       

								</c:if>

								<c:if test="${user_type != 'admin'}">
									<td class="td-manage">
									<a href="javascript:;" class="hui-btn hui-btn-secondary radius" onclick="layer_show('油田基本情况详情查看','/ssm_youtiansys/OilFieldInfo/showOilFieldInfo.do?id='+${tmp.id },'360','400')">查看 </a>                                
									</td>                                                                                       

								</c:if>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<br />
		<table width="90%" height="30" border="0" align="center"
			cellpadding="0" cellspacing="0" class="rd1">
			<tr>
				<td nowrap class="rd19" height="2" width="36%">
					<div align="left">
						<font>&nbsp;共&nbsp;${pageModel.totalRecords}&nbsp;条</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<font>当前第</font>&nbsp; <font color="#FF0000">${pageModel.currentPageNo}</font>&nbsp;/&nbsp;${pageModel.totalPages}
						<font>页</font>
					</div>
				</td>
				<td nowrap class="rd19" width="64%">
					<div align="right">
						<input name="btnTopPage" class="btn btn-success" type="button"
							id="btnTopPage" value="首页 " title="首页"
							onClick="javascript:topPage();">
						<input name="btnPreviousPage" class="btn btn-success" type="button"
							id="btnPreviousPage" value=" &lt;  " title="上页"
							onClick="javascript:previousPage();">
						<input name="btnNextPage" class="btn btn-success" type="button"
							id="btnNextPage" value="  &gt; " title="下页" onClick="javascript:nextPage();">
						<input name="btnBottomPage" class="btn btn-success" type="button"
							id="btnBottomPage" value=" 尾页" title="尾页"
							onClick="javascript:bottomPage();">
					</div>
				</td>
			</tr>
		</table>
	</div>
	</div>
	
${msg}
<%@ include file="/admin/system/footer.jsp"%>
</body>
</html>
