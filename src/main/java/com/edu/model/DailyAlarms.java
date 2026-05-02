package com.edu.model;

/**
 * author:dyb1296
 * time:2024-4-12 2:57:37
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
public class DailyAlarms {//当日报警情况表
	@Tip(value = "主键ID")
	private int id;//主键，自动增加

	public DailyAlarms() {
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	@Tip(value = "所属油田")
	private OilFieldInfo oilFieldInfo;//oilFieldInfo作为OilFieldInfo类的对象，在这里作为参数引入到DailyAlarms类中，在数据库中对应t_oilFieldInfo_id字段
	public void setOilFieldInfo(OilFieldInfo oilFieldInfo) {
		this.oilFieldInfo = oilFieldInfo;
	}

	public OilFieldInfo getOilFieldInfo() {
		return this.oilFieldInfo;
	}

	@Tip(value = "传感器类型")
	private SensorType sensorType;//sensorType作为SensorType类的对象，在这里作为参数引入到DailyAlarms类中，在数据库中对应t_sensorType_id字段
	public void setSensorType(SensorType sensorType) {
		this.sensorType = sensorType;
	}

	public SensorType getSensorType() {
		return this.sensorType;
	}

	@Tip(value = "状态")
	private String status;//状态
	public void setStatus(String status) {//set方法，用于设置status的值
		this.status = status;
	}

	public String getStatus() {//get方法，用于获取status的值
		return this.status;
	}

	@Tip(value = "时间")
	private String time;//时间
	public void setTime(String time) {//set方法，用于设置time的值
		this.time = time;
	}

	public String getTime() {//get方法，用于获取time的值
		return this.time;
	}

	@Tip(value = "位置")
	private String location;//位置
	public void setLocation(String location) {//set方法，用于设置location的值
		this.location = location;
	}

	public String getLocation() {//get方法，用于获取location的值
		return this.location;
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
		this.setStatus(CommonUtil.styleString(getStatus()));
		this.setTime(CommonUtil.styleString(getTime()));
		this.setLocation(CommonUtil.styleString(getLocation()));
		this.setBz(CommonUtil.styleString(getBz()));
	}

}
