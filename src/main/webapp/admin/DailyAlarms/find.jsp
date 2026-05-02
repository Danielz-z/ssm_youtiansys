<!-- /**
 * author:dyb1296
 * time:2024-4-12 17:46:53
 * email:dyb1296@qq.com
 * function:当日报警情况列表（如果是管理员或者有操作权限时候就是列表页面）
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
<title><spring:message code="system_name" />-当日报警情况</title>                    
<script type="text/javascript" src="/ssm_youtiansys/common/static/echarts/echarts.min.js"></script>
<script type="text/javascript">                                         
	function topPage() {                                                    
                                                                          
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.topPageNo}";                              
		window.location = contextPath                                         
				+ '/DailyAlarms/getAllDataInPage.do?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function previousPage() {                                               
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.previousPageNo}";                         
		window.location = contextPath                                         
				+ '/DailyAlarms/getAllDataInPage.do?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function nextPage() {                                                   
                                                                          
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.nextPageNo}";                             
		window.location = contextPath                                         
				+ '/DailyAlarms/getAllDataInPage.do?pageModel.currentPageNo=' + pageNo     
				+ '&field=' + field + '&fieldValue=' + fieldValue + '';           
	}                                                                       
                                                                          
	function bottomPage() {                                                 
		var contextPath = "${pageContext.request.contextPath}";             
		var field = document.getElementById("field").value;                 
		var fieldValue = document.getElementById("fieldValue").value;       
		var pageNo = "${pageModel.buttomPageNo}";                           
		window.location = contextPath                                         
				+ '/DailyAlarms/getAllDataInPage.do?pageModel.currentPageNo=' + pageNo     
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
		<span class="c-gray en">&gt;</span>当日报警情况 <span class="c-gray en">&gt;</span>
		当日报警情况列表 <a class="btn btn-success radius r"                                      
			style="line-height:1.6em;margin-top:3px"                                        
			href="javascript:location.replace(location.href);" title="刷新"><i            
			class="Hui-iconfont">&#xe68f;</i> </a> </nav>                                   
		<div class="page-container">                                                      
			<div class="text-c">                                                            
				<form                                                                           
					action="${pageContext.request.contextPath}/DailyAlarms/getAllDataInPage.do">    
					<select id="field" name="field" class="select"
						style="width:120px;height:32px;">

						<option <c:if test="${field == 'oilFieldInfo.location'}">selected</c:if> value="t_oilFieldInfo.location" />
							所属油田
						</option>
						<option <c:if test="${field == 'sensorType.stype'}">selected</c:if> value="t_sensorType.stype" />
							传感器类型
						</option>
						<option <c:if test="${field == 'status'}">selected</c:if> value="status" />
							状态
						</option>
						<option <c:if test="${field == 'time'}">selected</c:if> value="time" />
							时间
						</option>
						<option <c:if test="${field == 'location'}">selected</c:if> value="location" />
							位置
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
					href="${pageContext.request.contextPath}/DailyAlarms/initPage.do"><i                   
						class="Hui-iconfont">&#xe600;</i> 添加</a>
			 </c:if>

					<a class="btn btn-primary radius" style="margin-left:20px;" href="${pageContext.request.contextPath}/DailyAlarms/export.do"> <i class="Hui-iconfont">&#xe640;</i> 导出全部数据</a>
					</span> <span class="r">检索列表<strong></strong>
				</span>                                                                                             
			</div>                                                                                                
			<div class="mt-20">                                                                                 
					<!--删除全部-->
				<form                                                                                               
					action="${pageContext.request.contextPath}/DailyAlarms/deleteManyDataByIds.do"                     
					name="myform" id="myform" method="post">                                                    
					<table                                                                                            
						class="table table-border table-bordered table-bg table-hover table-sort radius">                    
						<thead>                                                                                         
							<tr class="text-c">                                                                         
								<th width="60"><input name="" type="checkbox" value="">&nbsp;全选                   
								</th>                                                                                       
								<th width="40">主键ID</th>
								<th>所属油田<i class="hui-iconfont">&#xe6ff;</i></th>
								<th>传感器类型<i class="hui-iconfont">&#xe6ff;</i></th>
								<th>状态</th>
								<th>时间</th>
								<th>位置</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${fn:length(pageModel.list) < 1}">
								<tr class="text-c va-m">                    
									<td colspan=52>无记录
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
									<td><a style="font-weight: bold;color: firebrick" href="javascript:;" onclick="layer_show('所属油田查看','/ssm_youtiansys/OilFieldInfo/showOilFieldInfo.do?id='+${tmp.oilFieldInfo.id },'460','500')">${tmp.oilFieldInfo.location }</a></td>
									<td><a style="font-weight: bold;color: firebrick" href="javascript:;" onclick="layer_show('传感器类型查看','/ssm_youtiansys/SensorType/showSensorType.do?id='+${tmp.sensorType.id },'460','500')">${tmp.sensorType.stype }</a></td>
									<td>${tmp.status }</td>
									<td>${tmp.time }</td>
									<td>${tmp.location }</td>

								<c:if test="${user_type == 'admin'}">
									<td class="td-manage">
									<a                                    
										                                                                           
										href="${pageContext.request.contextPath}/DailyAlarms/selectList.do?id=${tmp.id }"  type="button" class="hui-btn hui-btn-success radius" 
										title="编辑"> 编辑</a> 
									<a                             
										                             
										href="javascript:confirmDel('${pageContext.request.contextPath}/DailyAlarms/deleteUtil.do?id=${tmp.id }')"  type="button" class="hui-btn hui-btn-danger radius" 
										title="删除">删除 </a>                                
									</td>                                                                                       

								</c:if>

								<c:if test="${user_type != 'admin'}">
									<td class="td-manage">
									<a href="javascript:;" class="hui-btn hui-btn-secondary radius" onclick="layer_show('当日报警情况详情查看','/ssm_youtiansys/DailyAlarms/showDailyAlarms.do?id='+${tmp.id },'360','400')">查看 </a>                                
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
					&nbsp;加<i class="hui-iconfont">&#xe6ff;</i>的列表示当前列的数据来自其他的表

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
<div id="tab_demo" class="hui-tab">
		<div class="hui-tab-header clearfix">
			<span role="tab">统计图</span>
			<span role="tab">统计一</span>
			<span role="tab">统计二</span>
		</div>
		<div class="hui-tab-content pd-10">
		下面是统计图，请点击选项卡
		</div>
		<div class="hui-tab-content pd-10">

		<div>
			<h1>当日报警情况中分油田基本情况数量占比</h1>
			<div id="containerOilFieldInfo" style="width: 800px;height: 300px;"></div>
			<script type="text/javascript">
				var domOilFieldInfo = document.getElementById('containerOilFieldInfo');
				var myChartOilFieldInfo = echarts.init(domOilFieldInfo, null, {
					renderer: 'canvas',
					useDirtyRect: false
				});
				var appOilFieldInfo = {};

				var optionOilFieldInfo;

				optionOilFieldInfo = {
					title: {
						text: '',
						subtext: '',
						left: 'center'
					},
					tooltip: {
						trigger: 'item'
					},
					legend: {
						orient: 'vertical',
						left: 'left'
					},
					color: ['#fc8251', '#5470c6', '#91cd77', '#ef6567', '#f9c956', '#75bedc'],					series: [
						{
							name: '油田基本情况数量',
							type: 'pie',
							radius: '50%',
							data: ${oilFieldInfojsonArray},
							emphasis: {
								itemStyle: {
									shadowBlur: 10,
									shadowOffsetX: 0,
									shadowColor: 'rgba(0, 0, 0, 0.5)'
								}
							}
						}
					]
				};


				if (optionOilFieldInfo && typeof optionOilFieldInfo === 'object') {
					myChartOilFieldInfo.setOption(optionOilFieldInfo);
				}

				window.addEventListener('resize', myChartOilFieldInfo.resize);
			</script>
		</div>
		</div>
		<div class="hui-tab-content pd-10">

		<div>
			<h1>当日报警情况中分传感器类型数量占比</h1>
			<div id="containerSensorType" style="width: 800px;height: 300px;"></div>
			<script type="text/javascript">
				var domSensorType = document.getElementById('containerSensorType');
				var myChartSensorType = echarts.init(domSensorType, null, {
					renderer: 'canvas',
					useDirtyRect: false
				});
				var appSensorType = {};

				var optionSensorType;

				optionSensorType = {
					title: {
						text: '',
						subtext: '',
						left: 'center'
					},
					tooltip: {
						trigger: 'item'
					},
					legend: {
						orient: 'vertical',
						left: 'left'
					},
					color: ['#fc8251', '#5470c6', '#91cd77', '#ef6567', '#f9c956', '#75bedc'],					series: [
						{
							name: '传感器类型数量',
							type: 'pie',
							radius: '50%',
							data: ${sensorTypejsonArray},
							emphasis: {
								itemStyle: {
									shadowBlur: 10,
									shadowOffsetX: 0,
									shadowColor: 'rgba(0, 0, 0, 0.5)'
								}
							}
						}
					]
				};


				if (optionSensorType && typeof optionSensorType === 'object') {
					myChartSensorType.setOption(optionSensorType);
				}

				window.addEventListener('resize', myChartSensorType.resize);
			</script>
		</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#tab_demo").Huitab();
		$("#tab_demo2").Huitab({
			tabEvent:"mousemove",
			index:0
		});
	</script>
	</div>
	</div>
	
${msg}
<%@ include file="/admin/system/footer.jsp"%>
</body>
</html>
