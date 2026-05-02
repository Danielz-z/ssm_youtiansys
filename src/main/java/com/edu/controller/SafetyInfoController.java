package com.edu.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;
 import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.poi.excel.*;
import java.io.*;
import java.lang.reflect.Field;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;//引用注解
import org.springframework.ui.Model;
import com.edu.ann.Tip;
import org.springframework.web.bind.annotation.RequestMapping;
import com.edu.model.*;
import com.edu.service.*;

import system.common.util.PageModel;

import com.edu.util.*;

/**
 * author:dyb1296
 * time:2024-4-13 2:50:26
 * email:dyb1296@qq.com
 * function:负责油田安全情况功能，这个是MVC的C层，也就是控制层，这个Controller类可以实现对SafetyInfo这个类的控制，接收浏览器发送的请求并处理。SafetyInfo类的具体介绍，在com.edu.model.SafetyInfo类下，本处不在赘述
 * 本文件和SSM结构的关系:SSM结构的架构就是JSP（浏览器）发送请求，然后请求到对应的Controller，然后Controller调用Service，Service调用Mapper，mapper调用数据库实现增删改查，最后由Controller返回到JSP完成全过程。
 * 本文件对应Controller，负责表t_safetyInfo
 * 箭头结构：JSP->[Controller]->Service->Mapper->数据库-->JSP
 * MVC层级划分：本文件在MVC模式中的C层，即控制层
 */
@Controller//说明这个文件是MVC三层架构的Controller，加了这个注解之后，spring可以自动扫描到这个类，可以自动对类进行配置，这里也体现使用了spring框架
@RequestMapping(value = "SafetyInfo")//定义请求的路径，路径为SafetyInfo，定义之后，浏览器获取数据就根据这个路径来进行访问，其他的同理，只要有@RequestMapping注解的都是这样
public class SafetyInfoController {//Controller包含在名字中是一种规范
	@Autowired//自动注入，Spring的注解，这样的话，程序就可以自动把这个类扫进来，不需要手动创建对象
	private SafetyInfoService safetyInfoService;//调用数据库mapper，mybatis框架的内容，可以实现增删改查
	@Autowired//自动注入，Spring的注解，这样的话，程序就可以自动把这个类扫进来，不需要手动创建对象
	private OilFieldInfoService oilFieldInfoService;//注入所属油田部分Service的代码，调用数据库mapper，mybatis框架的内容，可以实现增删改查

	@RequestMapping(value = "/initPage.do")//设置添加跳转的页面
	public String initPage(HttpServletRequest request, Model model) {//在点击添加的时候加载一些预置代码
		List<OilFieldInfo> listOilFieldInfo = oilFieldInfoService.getList(null, null);
		model.addAttribute("listOilFieldInfo", listOilFieldInfo);

		return "SafetyInfo/saveOrUpdate";//跳转到编辑油田安全情况页面
	}

	@RequestMapping(value = "/selectList.do")//新增或者编辑油田安全情况的时候调用，然后跳转到编辑页&添加油田安全情况页面
	public String selectList(HttpServletRequest request, SafetyInfo safetyInfo, Model model) {//获取列表，最后跳转到油田安全情况列表查询页面
		safetyInfo = safetyInfoService.getById(safetyInfo.getId());//获取要更新的对象
		model.addAttribute("util", safetyInfo);//传到前台
		List<OilFieldInfo> listOilFieldInfo = oilFieldInfoService.getList(null, null);
		model.addAttribute("listOilFieldInfo", listOilFieldInfo);
		return "SafetyInfo/saveOrUpdate";//跳转到编辑页面
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getAllDataInPage.do")//获取列表的数据
	public String getAllDataInPage(HttpServletRequest request, Model model) {
		String field = request.getParameter("field");
		String fieldValue = request.getParameter("fieldValue");//当前端有查询的时候，这里的fieldValue就不是空，否则是空
		try {
			fieldValue = new String(fieldValue.getBytes("UTF-8"), "UTF-8");//防止乱码
		} catch (Exception e) {}
		String pageNo = request.getParameter("pageModel.currentPageNo");//获取当前页码是多少
		int currentPageNo = 1;//设置初始化页码是1
		try{
			currentPageNo = Integer.parseInt(pageNo);//防止前端传的不是数字，加一个catch，这样避免报错
		}catch(Exception e){//防止出现异常
		}
		List<SafetyInfo> list = safetyInfoService.getList(field, fieldValue);//获取列表数据
		for (int i = 0; i < list.size(); i++) {
			list.get(i).styleClass();
		}

		PageModel pageModel = new PageModel();
		pageModel = pageModel.getUtilByController(list, currentPageNo);
		model.addAttribute("pageModel", pageModel);//查询后，把查询的条件类型回显到jsp中
		model.addAttribute("fieldValue", fieldValue);//查询后，把查询的关键字回显到jsp中
		model.addAttribute("field", field);

		List<OilFieldInfo> listOilFieldInfo = oilFieldInfoService.getList(null, null);
		HashMap<String, Integer> oilFieldInfoMap = new HashMap<String, Integer>();
		for(OilFieldInfo oilFieldInfo : listOilFieldInfo) {
			for (SafetyInfo safetyInfo : list) {
				if (safetyInfo.getOilFieldInfo().getId() == oilFieldInfo.getId()) {
					if (oilFieldInfoMap.get(oilFieldInfo.getLocation()) == null) {
						oilFieldInfoMap.put(oilFieldInfo.getLocation(), 1);
					} else {
						oilFieldInfoMap.put(oilFieldInfo.getLocation(), oilFieldInfoMap.get(oilFieldInfo.getLocation()) + 1);
					}
				}
			}
		}

		JSONArray oilFieldInfojsonArray = new JSONArray();
		for(String key:oilFieldInfoMap.keySet()){
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("name",key);
			jsonObject.put("value",oilFieldInfoMap.get(key));
			JSONObject colorObject = new JSONObject();
			colorObject.put("color",getRandomColor());
			jsonObject.put("itemStyle",colorObject);
			oilFieldInfojsonArray.put(jsonObject);
		}
		model.addAttribute("oilFieldInfojsonArray", oilFieldInfojsonArray.toString());

		return "SafetyInfo/find";//跳转到find.jsp页面，也就是列表页面，SafetyInfo文件夹下面	
}

	@RequestMapping(value = "/deleteUtil.do")
	public String deleteUtil(HttpServletRequest request, SafetyInfo safetyInfo, Model model) {//删除的代码
		try{
			safetyInfo = safetyInfoService.getById(safetyInfo.getId());
			if(safetyInfo == null){//如果这个数据已经不存在了，那么就跳转到列表页面
				return this.getAllDataInPage(request, model);
			}
			safetyInfoService.deleteById(safetyInfo.getId());//根据ID删除
		}catch(Exception e){
			model.addAttribute("msg", "<script>alertHui(\"删除失败\",\"有其他的数据依赖该数据，删除失败，请删除该数据-->'"+safetyInfo.getShijian()+"'关联的数据后在删除本数据！\");</script>");
			return this.getAllDataInPage(request, model);//返回到列表页面，对应admin文件夹下的SafetyInfo文件夹下的find.jsp
		}
		return this.getAllDataInPage(request, model);//返回到列表页面，对应admin文件夹下的SafetyInfo文件夹下的find.jsp
	}

	@RequestMapping(value = "/deleteManyDataByIds.do")//批量删除                    
	public String deleteManyDataByIds(HttpServletRequest request, Model model) {                                                 
		String ids[] = request.getParameterValues("id"); //获取ID的列表              
		for (String id : ids) {//考虑可能传多个id                                          
			try{
				safetyInfoService.deleteById(Integer.parseInt(id));//删除的核心代码
			}catch(Exception e){}
		}                                                                
		return this.getAllDataInPage(request, model);                    
	}                                                                  
	public static String getRandomColor(){
		String r,g,b;
		Random random = new Random();
		r = Integer.toHexString(random.nextInt(256)).toUpperCase();
		g = Integer.toHexString(random.nextInt(256)).toUpperCase();
		b = Integer.toHexString(random.nextInt(256)).toUpperCase();
		r = r.length()==1 ? "0" + r : r ;
		g = g.length()==1 ? "0" + g : g ;
		b = b.length()==1 ? "0" + b : b ;
		return "#"+( r+g+b);
	}


	@RequestMapping(value = "/saveOrupdate.do")//这里是编辑或者添加的具体代码
	public String saveOrupdate(HttpServletRequest request, SafetyInfo util, Model model) {
		List<SafetyInfo> list = safetyInfoService.getList("shijian", util.getShijian());
		List<OilFieldInfo> listOilFieldInfo = oilFieldInfoService.getList(null, null);
		model.addAttribute("listOilFieldInfo", listOilFieldInfo);
		if (0 == util.getId()) {
			if (list.size() > 0) {
				model.addAttribute("util", util);
				model.addAttribute("errMsg", "该信息已存在!");
				return "SafetyInfo/saveOrUpdate";
			}
			safetyInfoService.insert(util);
		} else {
			if (list.size() > 1) {
				model.addAttribute("util", util);
				model.addAttribute("errMsg", "该信息已存在!");
				return "SafetyInfo/saveOrUpdate";
			}
			safetyInfoService.update(util);
		}
		return this.getAllDataInPage(request, model);
	}

	@RequestMapping(value = "/export.do")
	public void export(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {//获取列表，最后跳转到列表查询页面，获取的是
		HashMap<String, Object> row2 = new HashMap<String, Object>();
		HashMap<String, Object> row = new HashMap<String, Object>();
		ArrayList<Map<String, Object>> rows = new ArrayList<Map<String, Object>>();
		String field = request.getParameter("field");
		String fieldValue = request.getParameter("fieldValue");//当前端有查询的时候，这里的fieldValue就不是空，否则是空
		try {
			fieldValue = new String(fieldValue.getBytes("UTF-8"), "UTF-8");//防止乱码
		} catch (Exception e) {}
		List<SafetyInfo> list = safetyInfoService.getList(field, fieldValue);//获取列表数据
		Class p= SafetyInfo.class;
		Field[] fields = p.getDeclaredFields();
		for(SafetyInfo safetyInfo:list) {
			for (int j = 0; j < fields.length; j++) {
				System.out.println(fields[j].getName().toLowerCase());
				Field declaredField = p.getDeclaredField(fields[j].getName());
				declaredField.setAccessible(true);
//				Tip tip = declaredField.getAnnotation(Tip.class);
 					//System.out.println(annotation.age()+":"+annotation.name());
					String name = declaredField.getAnnotation(Tip.class).value();
					if(name == null){
						continue;
					}
 					if(declaredField.getType().toString().equals("class java.lang.String")){
						row2.put(name, declaredField.get(safetyInfo));

					}else if(declaredField.getType().toString().equals("int")){
						row2.put(name, declaredField.get(safetyInfo));
					}
					if(declaredField.getType().toString().equals("class com.edu.model.OilFieldInfo")){
 						row2.put(name, ((OilFieldInfo)declaredField.get(safetyInfo)).getLocation());
					}
					row.putAll(row2);
			}
			rows.add(row);
			row2 = new HashMap<String, Object>();
			row = new HashMap<String, Object>();
		}
		String fileName = Thread.currentThread().getContextClassLoader().getResource("").getPath().substring(0,Thread.currentThread().getContextClassLoader().getResource("").getPath().length()-16)
		+"/upload/"+UUID.randomUUID().toString()+".xls";
		ExcelWriter writer = null;

		try {
			writer = ExcelUtil.getWriter(fileName);
			writer.addHeaderAlias("所属油田", "所属油田");
			writer.addHeaderAlias("日期", "日期");
			writer.addHeaderAlias("总体安全状况", "总体安全状况");
			writer.addHeaderAlias("事故数量", "事故数量");
			writer.addHeaderAlias("备注", "备注");
			writer.merge(5,"油田安全情况");
		} catch (Exception e){

		}
		try {
			// 一次性写出内容，使用默认样式，强制输出标题
			writer.write(rows, true);
			AdaptiveWidthUtils.setSizeColumn(writer.getSheet(),5);
		} catch (Exception e){

		}
		try {
			// 关闭writer，释放内存
			writer.close();//其实不写这句在功能上也可以，但是为了规范，最好写上
		} catch (Exception e){

		}
 		//转码，免得文件名中文乱码
//		fileName = URLEncoder.encode(fileName,"UTF-8");
		//设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename=" + UUID.randomUUID().toString()+".xls");
		//1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
		while((len = bis.read()) != -1){
			out.write(len);
			out.flush();
		}
		out.close();
	}

	@RequestMapping(value = "/showSafetyInfo.do")//这个是跳转到展示数据的页面，有些页面需要展示数据
	public String showSafetyInfo(HttpServletRequest request, Integer id, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user_id") == null){
			model.addAttribute("errMsg", "超时请重新登录");
			return "../login";
		}
		SafetyInfo safetyInfo = safetyInfoService.getById(id);
		model.addAttribute("safetyInfo", safetyInfo);
		return "SafetyInfo/show";
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getAllView.do")//获取列表的数据
	public String getAllView(HttpServletRequest request, Model model) {

		String pageNo = request.getParameter("pageModel.currentPageNo");//获取当前页码是多少
		int currentPageNo = 1;//设置初始化页码是1
		try{
			currentPageNo = Integer.parseInt(pageNo);//防止前端传的不是数字
		}catch(Exception e){
		}
		List<SafetyInfo> list = safetyInfoService.getList("", "");//获取列表数据
		PageModel pageModel = new PageModel();
		pageModel = pageModel.getUtilByController(list, currentPageNo);
		model.addAttribute("pageModel", pageModel);//查询后，把查询的条件类型回显到jsp中

		return "SafetyInfo/viewlist";//跳转到前台的列表
	}
	@RequestMapping(value = "/view.do")
	public String view(HttpServletRequest request, SafetyInfo safetyInfo, Model model) {//把页面的数据显示上来
		safetyInfo = safetyInfoService.getById(safetyInfo.getId());//获取要更新的对象
		model.addAttribute("obj", safetyInfo);//传到前台
		return "SafetyInfo/view";//跳转到编辑页面
	}
}
