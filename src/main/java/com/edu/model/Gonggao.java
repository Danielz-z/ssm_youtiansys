package com.edu.model;

/**
 * author:dyb1296
 * time:2024-4-12 18:56:21
 * email:dyb1296@qq.com
 * 本文件和SSM结构的关系:SSM结构的架构就是JSP（浏览器）发送请求，然后请求到对应的Controller，然后Controller调用Service，Service调用Mapper，mapper调用数据库实现增删改查，最后由Controller返回到JSP完成全过程。
 * 本文件的作用就是组合数据库实体类
 * MVC层级划分：本文件在MVC模式中的M层(model)，即模型层
 */
import com.edu.ann.Tip;
import java.sql.Timestamp;
import com.edu.util.CommonUtil;
import java.util.Date;
import system.common.util.DateConvertorChinese;
public class Gonggao {//公告管理表
	@Tip(value = "主键ID")
	private int id;//主键，自动增加

	public Gonggao() {
		this.title = "欢迎大家使用本系统";
		this.content = "欢迎大家使用本系统（智慧油田感传控管理系统），系统可能还有不完善的地方，请见谅。";
		this.shijian = DateConvertorChinese.getDateStr(new Date());
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	@Tip(value = "标题")
	private String title;//标题
	public void setTitle(String title) {//set方法，用于设置title的值
		this.title = title;
	}

	public String getTitle() {//get方法，用于获取title的值
		return this.title;
	}

	@Tip(value = "内容")
	private String content;//内容
	public void setContent(String content) {//set方法，用于设置content的值
		this.content = content;
	}

	public String getContent() {//get方法，用于获取content的值
		return this.content;
	}

	@Tip(value = "发布时间")
	private String shijian;//发布时间
	public void setShijian(String shijian) {//set方法，用于设置shijian的值
		this.shijian = shijian;
	}

	public String getShijian() {//get方法，用于获取shijian的值
		return this.shijian;
	}

	@Tip(value = "备注")
	private String bz;//备注
	public void setBz(String bz) {//set方法，用于设置bz的值
		this.bz = bz;
	}

	public String getBz() {//get方法，用于获取bz的值
		return this.bz;
	}

	@Tip(value = "插入数据库时间")
	private Timestamp addTime;//记录本记录添加进数据库的时间
	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void styleClass(){
		this.setTitle(CommonUtil.styleString(getTitle()));
		this.setContent(CommonUtil.styleString(getContent()));
		this.setShijian(CommonUtil.styleString(getShijian()));
		this.setBz(CommonUtil.styleString(getBz()));
	}

}
