package com.edu.model;

/**
 * author:dyb1296
 * time:2023-11-6 21:07:27
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
public class Role {//角色管理表
	@Tip(value = "主键ID")
	private int id;//主键，自动增加

	public Role() {
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	@Tip(value = "角色名称")
	private String name;//角色名称
	public void setName(String name) {//set方法，用于设置name的值
		this.name = name;
	}

	public String getName() {//get方法，用于获取name的值
		return this.name;
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
		this.setName(CommonUtil.styleString(getName()));
		this.setBz(CommonUtil.styleString(getBz()));
	}

}
