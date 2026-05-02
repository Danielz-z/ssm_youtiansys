package com.edu.model;

/**
 * author:dyb1296
 * time:2024-4-13 21:23:12
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
public class SafetyInfo {//油田安全情况表
	@Tip(value = "主键ID")
	private int id;//主键，自动增加

	public SafetyInfo() {
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	@Tip(value = "所属油田")
	private OilFieldInfo oilFieldInfo;//oilFieldInfo作为OilFieldInfo类的对象，在这里作为参数引入到SafetyInfo类中，在数据库中对应t_oilFieldInfo_id字段
	public void setOilFieldInfo(OilFieldInfo oilFieldInfo) {
		this.oilFieldInfo = oilFieldInfo;
	}

	public OilFieldInfo getOilFieldInfo() {
		return this.oilFieldInfo;
	}

	@Tip(value = "日期")
	private String shijian;//日期
	public void setShijian(String shijian) {//set方法，用于设置shijian的值
		this.shijian = shijian;
	}

	public String getShijian() {//get方法，用于获取shijian的值
		return this.shijian;
	}

	@Tip(value = "总体安全状况")
	private String overall;//总体安全状况
	public void setOverall(String overall) {//set方法，用于设置overall的值
		this.overall = overall;
	}

	public String getOverall() {//get方法，用于获取overall的值
		return this.overall;
	}

	@Tip(value = "事故数量")
	private Integer incident;//事故数量,这里使用整数类型
	public void setIncident(Integer incident) {//set方法，用于设置incident的值
		this.incident = incident;
	}

	public Integer getIncident() {//get方法，用于获取incident的值
		return this.incident;
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
		this.setShijian(CommonUtil.styleString(getShijian()));
		this.setOverall(CommonUtil.styleString(getOverall()));
		this.setBz(CommonUtil.styleString(getBz()));
	}

}
