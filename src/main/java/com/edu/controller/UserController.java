package com.edu.controller;

import cn.hutool.crypto.digest.MD5;
import cn.hutool.json.JSONObject;
import com.edu.model.User;
import com.edu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import system.common.util.PageModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * author:icodedock.com
 * time:
 * email:dyb1296@gmail.com
 */
@Controller
@RequestMapping(value = "User")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login.do")
	public String login(HttpServletRequest request, User inputUser, Model model) {

		HttpSession session = request.getSession();
		String code = (String) session.getAttribute("code");
		String userCode = request.getParameter("code");
		if(code == null){
			model.addAttribute("errMsg", "超时请重新登录");
			return "../login";
		}
		if (!code.equals(userCode)) {
			model.addAttribute("errMsg", "验证码错误");
			return "../login";
		}
		User user = userService.getObjectByName(inputUser);
		if (null == user) {
			model.addAttribute("errMsg", "登录失败，用户名不存在");
			return "../login";
		}
		//$java_enable_md5_login
		boolean flag = user.getS_1().equals(inputUser.getS_1());

		if (!flag) {
			model.addAttribute("errMsg", "登录失败，密码错误");
			return "../login";
		}

		if(user.getS_12() == 1){
			model.addAttribute("errMsg", "登录失败,您的账户已经被禁用");
			return "../login";
		}

		session.setAttribute("user_id", user.getId());
		session.setAttribute("user_type", user.getS_11());
		session.setAttribute("type1", "admin");
		session.setAttribute("type2", "admin");
		session.setAttribute("name", user.getS_2());
		session.setAttribute("username", user.getS_0());
		session.setAttribute("sessionUser", user);
		return "../index";
	}


	@RequestMapping(value = "/resetPwd.do")
	@ResponseBody
	public String resetPwd(HttpServletRequest request, Integer id, Model model) {
		User user = userService.getById(id);
		JSONObject jsonObject = new JSONObject();
		if(user.getS_11().equals("admin")){
			user.setS_1(new MD5().digestHex("admin"));
			jsonObject.append("msg","尊敬的管理员，您的密码已经被初始化，新密码是admin");
		}else{
			user.setS_1(new MD5().digestHex("123456"));
			jsonObject.append("msg","该用户密码重置为123456，请通知用户登录并修改初始密码");
		}
		userService.update(user);
		return jsonObject.toString();
	}

	@RequestMapping(value = "/changeUserState.do")
	@ResponseBody
	public String changeUserState(HttpServletRequest request, Integer id, Model model) {
		JSONObject jsonObject = new JSONObject();

		HttpSession session = request.getSession();
		if(session.getAttribute("user_id") == null){
			model.addAttribute("errMsg", "超时请重新登录");
			return "../login";
		}
		User user = userService.getById(id);
		try {
			if(user.getS_12() == 1){
				user.setS_12(0);
			}else{
				user.setS_12(1);
			}
			userService.update(user);
			jsonObject.append("msg","yes");
			jsonObject.append("status",user.getS_12());
			return jsonObject.toString();
		} catch (Exception e) {
			jsonObject.append("msg","no");
			jsonObject.append("status",user.getS_12());
			return jsonObject.toString();
		}
	}

	public static void main(String[] args) {
		System.out.println(new MD5().digestHex("123456"));
		System.out.println(new MD5().digestHex("admin"));
	}

	public User md5Password(User user){ //为后续的扩展密码md5加密预留接口，后面可以调用这个函数直接对user类中的md5进行加密
		if(user == null || user.getS_1() == null){
			return user;
		}
		if(StringUtils.isEmpty(user.getS_1())){
			return user;
		}
		user.setS_1(new MD5().digestHex(user.getS_1()));
		return user;
	}

	@RequestMapping(value = "/updatepwd.do")
	public String updatepwd(HttpServletRequest request, User inputUser, Model model) {

		HttpSession session = request.getSession();
		if(session.getAttribute("user_id") == null){
			model.addAttribute("errMsg", "超时请重新登录");
			return "../login";
		}
		int user_id = (Integer) session.getAttribute("user_id");
		User userTmp = userService.getById(user_id);

		String oldPwd = inputUser.getS_3();
		String newPwd = inputUser.getS_4();
		String rePwd = inputUser.getS_5();
		if (null == oldPwd || "".equals(oldPwd) || null == newPwd
				|| "".equals(newPwd) || null == rePwd || "".equals(rePwd)) {
			model.addAttribute("errMsg", "密码信息不能为空");
			model.addAttribute("util", userTmp);
			return "User/updatepwd";
		}

		if (!newPwd.equals(rePwd)) {
			model.addAttribute("errMsg", "确认密码不一致");
			model.addAttribute("util", userTmp);
			return "User/updatepwd";
		}

		if (newPwd.equals(oldPwd)) {
			model.addAttribute("errMsg", "旧密码不能与新密码一致");
			model.addAttribute("util", userTmp);
			return "User/updatepwd";
		}
		//$java_enable_md5_changepassword_1
		if (!oldPwd.equals(userTmp.getS_1())) {
			model.addAttribute("errMsg", "旧密码错误");
			model.addAttribute("util", userTmp);
			return "User/updatepwd";
		}
		userTmp.setS_1(newPwd);
		//$java_enable_md5_changepassword_2
		userService.update(userTmp);
		return "User/uppwdok";
	}

	@RequestMapping(value = "/updateinfo.do")
	public String updateinfo(@RequestParam MultipartFile[] myfiles, HttpServletRequest request, User inputUser, Model model) throws IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("user_id") == null){
			model.addAttribute("errMsg", "超时请重新登录");
			return "../login";
		}
		for (MultipartFile file : myfiles) {
			if (!file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				String path = request.getSession().getServletContext()
						.getRealPath("upload")
						+ File.separator;
				String uploadName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
						+ fileName;
				File localFile = new File(path + uploadName);
				file.transferTo(localFile);
				inputUser.setS_16(uploadName);
				inputUser.setS_11(session.getAttribute("user_type").toString());
				userService.update(inputUser);
				model.addAttribute("util", inputUser);
				model.addAttribute("errMsg", "个人信息修改成功");
			}else{
				List<User> list = userService.getList("s_0", inputUser.getS_0());
				inputUser.setS_16(list.get(0).getS_16());
				inputUser.setS_11(session.getAttribute("user_type").toString());
				userService.update(inputUser);
				model.addAttribute("util", inputUser);
				model.addAttribute("errMsg", "个人信息修改成功");
			}
		}

		userService.update(inputUser);
		session.setAttribute("sessionUser", inputUser);
		calPercent(inputUser.getId(),request);
		return "User/updateinfo";
	}

	@RequestMapping(value = "/beforepass.do")
	public String beforepass(HttpServletRequest request, User inputUser, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user_id") == null){
			model.addAttribute("errMsg", "超时请重新登录");
			return "../login";
		}
		int user_id = (Integer) session.getAttribute("user_id");
		inputUser= userService.getById(user_id);
		model.addAttribute("util", inputUser);
		return "User/updatepwd";
	}

	@RequestMapping(value = "/beforeinfo.do")
	public String beforeinfo(HttpServletRequest request, User inputUser, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user_id") == null){
			model.addAttribute("errMsg", "超时请重新登录");
			return "../login";
		}
		int user_id = (Integer) session.getAttribute("user_id");
		inputUser= userService.getById(user_id);
		model.addAttribute("util", inputUser);
		return "User/updateinfo";
	}

	@RequestMapping(value = "/register.do")
	public String register(HttpServletRequest request, User inputUser, Model model) {
		HttpSession session = request.getSession();
		String code = (String) session.getAttribute("code");
		String userCode = request.getParameter("code");
		if (!code.equals(userCode)) {
			model.addAttribute("errMsg", "验证码错误");
			return "../register";
		}
		User user = userService.getObjectByName(inputUser);
		if (null != user) {
			model.addAttribute("errMsg", "该用户名已经存在");
			return "../register";
		}
		inputUser.setS_2(inputUser.getS_0());
		inputUser.setS_4("男");
		inputUser.setS_12(0);
		inputUser.setPercent("25%");
		inputUser.setS_11("user");
		//$java_enable_md5_register
		userService.insert(inputUser);
		model.addAttribute("registerMsg", "恭喜您，注册成功！");
		return "../login";
	}

	@RequestMapping(value = "/showUserInfo.do")
	public String showUserInfo(HttpServletRequest request, Integer id, Model model) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user_id") == null){
			model.addAttribute("errMsg", "超时请重新登录");
			return "../login";
		}
		User user = userService.getById(id);
		model.addAttribute("user", user);
		return "User/member-show";
	}

	@RequestMapping(value = "/initPage.do")
	public String initPage(HttpServletRequest request, Model model) {
		return "User/saveOrUpdate";
	}

	@RequestMapping(value = "/selectList.do")
	public String selectList(HttpServletRequest request, User inputUser, Model model) {
		inputUser= userService.getById(inputUser.getId());
		model.addAttribute("util", inputUser);
		return "User/saveOrUpdate";
	}


	@RequestMapping(value = "/getAllDataInPage.do")
	public String getAllDataInPage(HttpServletRequest request, User inputUser, Model model) {
		String field = request.getParameter("field");
		String fieldValue = request.getParameter("fieldValue");
		String pageNo = request.getParameter("pageModel.currentPageNo");
		int currentPageNo = 1;
		try {
			fieldValue = new String(fieldValue.getBytes("UTF-8"), "UTF-8");
			currentPageNo = Integer.parseInt(pageNo);
		} catch (Exception e) {
		}
		List<User> list = userService.getList(field, fieldValue);
		PageModel pageModel = new PageModel();
		pageModel = pageModel.getUtilByController(list, currentPageNo);
		model.addAttribute("pageModel", pageModel);
		model.addAttribute("fieldValue", fieldValue);
		model.addAttribute("field", field);
		return "User/find";
	}

	@RequestMapping(value = "/deleteManyDataByIds.do")
	public String deleteManyDataByIds(HttpServletRequest request, User inputUser,
									  Model model) {
		String ids[] = request.getParameterValues("id");
		for (String id : ids) {
			inputUser= new User();
			inputUser.setId(Integer.parseInt(id));
			try {
				userService.deleteById(inputUser.getId());
			} catch (Exception e) {
				model.addAttribute("msg", "<script>alertHui('删除多条数据提示','有其他的数据依赖该用户，删除失败，出错的用户名为"+inputUser.getS_0()+"!要想删除该用户，请删除该用户所关联的数据！');</script>");
			}
		}
		return this.getAllDataInPage(request, inputUser, model);
	}

	@RequestMapping(value = "/deleteUtil.do")
	public String deleteUtil(HttpServletRequest request, User inputUser, Model model) {
		try {
			List<User> list = userService.getList("s_11","admin");
			if(list.size() == 1 && inputUser.getId() == list.get(0).getId()){
				model.addAttribute("msg","<script>alertHui('删除数据提示','这个是唯一一个管理员账号，删除将导致程序崩溃！拒绝执行此操作！');</script>");
			}else{
				userService.deleteById(inputUser.getId());
			}

		} catch (Exception e) {
			model.addAttribute("msg", "<script>alertHui('删除数据提示','有其他的数据依赖该用户，删除失败，出错的用户名为"+inputUser.getS_0()+"!要想删除该用户，请删除该用户所关联的数据！');</script>");
		}
		return this.getAllDataInPage(request, inputUser, model);
	}

	@RequestMapping(value = "/saveOrupdate.do")
	public String saveOrupdate(@RequestParam MultipartFile[] myfiles, HttpServletRequest request, User inputUser,
							   Model model) throws IOException {

		boolean fileExists = false;
		for (MultipartFile file : myfiles) {
			if (!file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				String path = request.getSession().getServletContext()
						.getRealPath("upload")
						+ File.separator;
				String uploadName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
						+ fileName;
				File localFile = new File(path + uploadName);
				file.transferTo(localFile);
				inputUser.setS_16(uploadName);

				fileExists = true;
			}
		}
		List<User> list = userService.getList("s_0", inputUser.getS_0());
		if (0 == inputUser.getId()) {

			//$java_enable_md5_saveOrUpdateUser
			inputUser.setS_12(0);
 			userService.insert(inputUser);
		} else {

			if(!fileExists){
				inputUser.setS_16(list.get(0).getS_16());
			}
			inputUser.setS_11(list.get(0).getS_11());
			//$java_enable_md5_saveOrUpdateUser
			userService.update(inputUser);
			calPercent(inputUser.getId(),request);
		}
		return this.getAllDataInPage(request, inputUser, model);
	}

	@RequestMapping(value = "/upload.do")
	public String upload(@RequestParam MultipartFile[] myfiles,
						 HttpServletRequest request, User inputUser, Model model)
			throws IOException {
		for (MultipartFile file : myfiles) {
			if (!file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				String path = request.getSession().getServletContext()
						.getRealPath("image")
						+ File.separator;
				String uploadName = new SimpleDateFormat("yyyyMMddHHmmss")
						.format(new Date()) + fileName;
				File localFile = new File(path + uploadName);
				file.transferTo(localFile);
				inputUser.setS_0(uploadName);
				inputUser.setS_1(fileName);
				inputUser.setS_2(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(new Date()));
			}

			if (0 == inputUser.getId()) {
				userService.insert(inputUser);
			} else {
				userService.update(inputUser);
				calPercent(inputUser.getId(),request);
			}
			return this.getAllDataInPage(request, inputUser, model);
		}

		return this.getAllDataInPage(request, inputUser, model);
	}
	@RequestMapping(value = "/getInfo.do")
	public String getProjectInfo(HttpServletRequest request, Model model) {
		int num = userService.getTableNum("ssm_youtiansys");
		model.addAttribute("database",num);
		return "../common/welcome";
	}

	void calPercent(int uid,HttpServletRequest request){
		double total = 13;
		double index = 0;
		User user = userService.getById(uid);
		if(!StringUtils.isEmpty(user.getS_0())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_1())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_2())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_3())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_4())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_5())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_6())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_7())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_8())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_9())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_11())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_15())){
			index++;
		}
		if(!StringUtils.isEmpty(user.getS_16())){
			index++;
		}
		int result = (int)((index/total)*100);
		if(result<60){
			user.setS_10("您的资料完善度少于60%，请尽快完善个人资料！");
		}else{
			user.setS_10("");
		}
		user.setPercent(result+"%");
		userService.update(user);
		User user1 = (User)request.getSession().getAttribute("sessionUser");
		if(user.getId() == user1.getId()){
			request.getSession().setAttribute("sessionUser", user);
		}
	}
}
