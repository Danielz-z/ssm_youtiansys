package com.edu.util;


import cn.hutool.setting.dialect.Props;
import com.edu.model.User;
import org.hibernate.cfg.Configuration;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import system.common.util.DBUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;
import java.util.*;


public class ExportDB {

	public static Map<String,String> getAllProperty(){
		Props props = new Props("message_zh_CN.properties");
		Set<Object> set = props.keySet();
		Map<String,String> map = new HashMap<>();
		for(Object obj:set){
			map.put(String.valueOf(obj),props.getProperty(String.valueOf(obj)));
		}
		return map;
	}

	public static String getProperty(String key){
		Props props = new Props("message_zh_CN.properties");
		return props.getProperty(key);
	}
	public static void main(String[] args) throws IOException, ClassNotFoundException, IllegalAccessException, InstantiationException {
		Configuration cfg = new Configuration().configure();

		SchemaExport export = new SchemaExport(cfg);
		List<String> list = new ArrayList<>();
		export.create(true, true);
		User util = new User();

		Map<String,String> map = getAllProperty();
		for(String str:map.keySet()){
			if(str.startsWith("sys_")){
				list.add(str);
			}
		}
		String[] names = {"张三","李四","王二","孙武","刘大锤"};
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).equals("sys_admin")){
				util.setS_0("admin");
				if(getProperty("md5").equals("0")){
					util.setS_1("admin");
				}else if(getProperty("md5").equals("1")){
					util.setS_1("21232f297a57a5a743894a0e4a801fc3");
				}
				util.setS_2("管理员");
				util.setS_3("2000-01-01");
				util.setS_4("男");
				util.setS_5(RandomPhoneNumber.createMobile(0));
				util.setS_6("无");
				util.setS_7(RandomPhoneNumber.createMobile(1));
				util.setS_8("广东深圳");
				util.setS_9("北京市东城区");
				util.setS_11("admin");
				util.setS_12(0);
				util.setS_15("系统管理员账号，本账号请勿删除！");


				util.setPercent("100%");
				util.setS_16("20220706134712201807031200421549.jpg");
				new DBUtil().saveObject(util);
			}else{
				String roleName = list.get(i).substring(4);
				util = new User();
				util.setS_0(roleName);
				if(getProperty("md5").equals("0")){
					util.setS_1("123456");
				}else if(getProperty("md5").equals("1")){
					util.setS_1("e10adc3949ba59abbe56e057f20f883e");
				}
				util.setS_2(names[i]);
				util.setS_3("2000-01-01");
				util.setS_4("男");
				util.setS_5(RandomPhoneNumber.createMobile(0));
				util.setS_6("无");
				util.setS_7(RandomPhoneNumber.createMobile(1));
				util.setS_8("广东深圳");
				util.setS_9("北京市东城区");
				util.setS_11(roleName);
				util.setS_12(0);
				util.setS_15("本账号是"+new String(getProperty(list.get(i)).getBytes("ISO-8859-1"),"UTF-8")+"的测试账号");
				util.setPercent("100%");
				util.setS_16("person.png");
				new DBUtil().saveObject(util);
			}
		}
		Properties pro = new Properties();
		pro.load(new FileInputStream("src/main/resources/message_zh_CN.properties"));
		list = new ArrayList<>();
		for(String str:map.keySet()){
			list.add(str);
		}
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).equals("system_name")||list.get(i).startsWith("sys_")){
				continue;
			}
			pro.remove(list.get(i));
		}
		list = new ArrayList<>();
		for(String str:map.keySet()){
			if(str.startsWith("sys_")){
				list.add(str);
			}
			if(str.startsWith("system_")){
				list.add(str);
			}
		}
		for (int i = 0; i < list.size(); i++) {
			pro.setProperty(list.get(i),new String(getProperty(list.get(i)).getBytes("ISO-8859-1"),"UTF-8"));
		}
		FileWriter fw=new FileWriter("src/main/resources/message_zh_CN.properties");
		pro.store(fw, "");
		Class cl = Class.forName("com.edu.model.Gonggao");
		Object object=cl.newInstance();
		new DBUtil().saveObject(object);
		File file = null;
//		if (getProperty("kaifa").equals("eclipse")) {
//			deleteFolders(".idea");
//			file.delete();
//			file = new File(getProperty("project_name")+".iml");
//			file.delete();
//		}else if (getProperty("kaifa").equals("idea")) {
//			deleteFolders(".settings");
//			file = new File(".classpath");
//			file.delete();
//			file = new File(".project");
//			file.delete();
//
//		}
		file = new File("src/main/java/com/edu/util/ExportDB.java");
		file.delete();
		file = new File("src/main/java/system/common/util/DBUtil.java");
		file.delete();
	}


	/**
	 * 删除指定文件夹下文件
	 *
	 * @param filePath
	 */
	public static void deleteFolders(String filePath) {
		Path path = Paths.get(filePath);
		try {
			Files.walkFileTree(path, new SimpleFileVisitor<Path>() {
				@Override
				public FileVisitResult visitFile(Path file, BasicFileAttributes attributes) throws IOException {
					Files.delete(file);
					return FileVisitResult.CONTINUE;
				}

				@Override
				public FileVisitResult postVisitDirectory(Path dir,
														  IOException exc) throws IOException {
					Files.delete(dir);
					return FileVisitResult.CONTINUE;
				}
			});
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

/**
 * @author 陈小哥cw
 * @date 2020/12/22 9:10
 */
class RandomPhoneNumber {
	//中国移动
	public static final String[] CHINA_MOBILE = {
			"134", "135", "136", "137", "138", "139", "150", "151", "152", "157", "158", "159",
			"182", "183", "184", "187", "188", "178", "147", "172", "198"
	};
	//中国联通
	public static final String[] CHINA_UNICOM = {
			"130", "131", "132", "145", "155", "156", "166", "171", "175", "176", "185", "186", "166"
	};
	//中国电信
	public static final String[] CHINA_TELECOME = {
			"133", "149", "153", "173", "177", "180", "181", "189", "199"
	};

	/**
	 * 生成手机号
	 *
	 * @param op 0 移动 1 联通 2 电信
	 */
	public static String createMobile(int op) {
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		String mobile01;//手机号前三位
		int temp;
		switch (op) {
			case 0:
				mobile01 = CHINA_MOBILE[random.nextInt(CHINA_MOBILE.length)];
				break;
			case 1:
				mobile01 = CHINA_UNICOM[random.nextInt(CHINA_UNICOM.length)];
				break;
			case 2:
				mobile01 = CHINA_TELECOME[random.nextInt(CHINA_TELECOME.length)];
				break;
			default:
				mobile01 = "op标志位有误！";
				break;
		}
		if (mobile01.length() > 3) {
			return mobile01;
		}
		sb.append(mobile01);
		//生成手机号后8位
		for (int i = 0; i < 8; i++) {
			temp = random.nextInt(10);
			sb.append(temp);
		}
		return sb.toString();
	}


}
