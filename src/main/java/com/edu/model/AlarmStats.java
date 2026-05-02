package com.edu.model;

/**
 * author:dyb1296
 * time:2024-4-11 11:26:42
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
public class AlarmStats {//报警类型统计表
	@Tip(value = "主键ID")
	private int id;//主键，自动增加

	public AlarmStats() {
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	@Tip(value = "所属油田")
	private OilFieldInfo oilFieldInfo;//oilFieldInfo作为OilFieldInfo类的对象，在这里作为参数引入到AlarmStats类中，在数据库中对应t_oilFieldInfo_id字段
	public void setOilFieldInfo(OilFieldInfo oilFieldInfo) {
		this.oilFieldInfo = oilFieldInfo;
	}

	public OilFieldInfo getOilFieldInfo() {
		return this.oilFieldInfo;
	}

	@Tip(value = "报警类型")
	private AramType aramType;//aramType作为AramType类的对象，在这里作为参数引入到AlarmStats类中，在数据库中对应t_aramType_id字段
	public void setAramType(AramType aramType) {
		this.aramType = aramType;
	}

	public AramType getAramType() {
		return this.aramType;
	}

	@Tip(value = "次数")
	private String count;//次数
	public void setCount(String count) {//set方法，用于设置count的值
		this.count = count;
	}

	public String getCount() {//get方法，用于获取count的值
		return this.count;
	}

	@Tip(value = "日期")
	private String date;//日期
	public void setDate(String date) {//set方法，用于设置date的值
		this.date = date;
	}

	public String getDate() {//get方法，用于获取date的值
		return this.date;
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
		this.setCount(CommonUtil.styleString(getCount()));
		this.setDate(CommonUtil.styleString(getDate()));
		this.setBz(CommonUtil.styleString(getBz()));
	}

}
