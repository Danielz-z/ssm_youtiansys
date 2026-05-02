<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<dl id="menu-product">
	<dt>
		<i class="Hui-iconfont">&#xe62c;</i> 个人资料<i
			class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
	</dt>
	<dd>
		<ul>
			<li><a
				data-href="${pageContext.request.contextPath}/User/beforeinfo.do"
				data-title="修改个人资料" href="javascript:void(0)"><i class="Hui-iconfont">&#xe60c;</i>修改个人资料</a>
			</li>
			<li><a
				data-href="${pageContext.request.contextPath}/User/beforepass.do"
				data-title="修改密码" href="javascript:void(0)"><i class="Hui-iconfont">&#xe63f;</i>修改密码</a>
			</li>
		</ul>
	</dd>
</dl>

<c:if test="${user_type == 'admin'}">
	<dl id="menu-product">
		<dt>
			<i class="Hui-iconfont">&#xe62b;</i> <a
					data-href="${pageContext.request.contextPath}/User/getAllDataInPage.do"
					data-title="用户管理" href="javascript:void(0)">用户管理</a><i
				class="Hui-iconfont menu_dropdown-arrow"><</i>
		</dt>
	</dl>
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/Gonggao/getAllDataInPage.do"
					data-title="公告管理" href="javascript:void(0)">公告管理</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/OilFieldInfo/getAllDataInPage.do"
					data-title="油田基本情况" href="javascript:void(0)">油田基本情况</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/SafetyInfo/getAllDataInPage.do"
					data-title="油田安全情况" href="javascript:void(0)">油田安全情况</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/AramType/getAllDataInPage.do"
					data-title="报警类型" href="javascript:void(0)">报警类型</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/AlarmStats/getAllDataInPage.do"
					data-title="报警类型统计" href="javascript:void(0)">报警类型统计</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/SensorType/getAllDataInPage.do"
					data-title="传感器类型" href="javascript:void(0)">传感器类型</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/DailyAlarms/getAllDataInPage.do"
					data-title="当日报警情况" href="javascript:void(0)">当日报警情况</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/SensorData/getAllDataInPage.do"
					data-title="传感器数据" href="javascript:void(0)">传感器数据</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
</c:if>
<c:if test="${user_type == 'user'}">
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/Gonggao/getAllDataInPage.do"
					data-title="公告查看" href="javascript:void(0)">公告查看</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/OilFieldInfo/getAllDataInPage.do"
					data-title="油田基本情况" href="javascript:void(0)">油田基本情况</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/SafetyInfo/getAllDataInPage.do"
					data-title="油田安全情况" href="javascript:void(0)">油田安全情况</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/AramType/getAllDataInPage.do"
					data-title="报警类型" href="javascript:void(0)">报警类型</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/AlarmStats/getAllDataInPage.do"
					data-title="报警类型统计" href="javascript:void(0)">报警类型统计</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/SensorType/getAllDataInPage.do"
					data-title="传感器类型" href="javascript:void(0)">传感器类型</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/DailyAlarms/getAllDataInPage.do"
					data-title="当日报警情况" href="javascript:void(0)">当日报警情况</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
	<dl id="menu-product">                                                   
		<dt>                                                                     
			<i class="Hui-iconfont">&#xe667;</i> <a                              
					data-href="${pageContext.request.contextPath}/SensorData/getAllDataInPage.do"
					data-title="传感器数据" href="javascript:void(0)">传感器数据</a><i 
				class="Hui-iconfont menu_dropdown-arrow"><</i>              
		</dt>                                                                    
	</dl>                                                                      
</c:if>
