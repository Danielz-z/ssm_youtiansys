package com.edu.service.impl;

import java.util.*;
import java.sql.Timestamp;
import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.edu.model.DailyAlarms;
import com.edu.mapper.DailyAlarmsMapper;
import com.edu.service.DailyAlarmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:dyb1296
 * time:2024-4-10 14:59:04
 * email:dyb1296@qq.com
 */
@Service
public class DailyAlarmsServiceImpl implements DailyAlarmsService{//这里用implements关键字来实现接口，接口的意义在于一种规范化，这里不用这个也可以，但是就是为了规范才用的


	@Autowired
	public DailyAlarmsMapper dailyAlarmsMapper;

	public void insert(DailyAlarms dailyAlarms){
		dailyAlarms.setAddTime(new Timestamp(new Date(System.currentTimeMillis()).getTime()));
		dailyAlarmsMapper.insert(dailyAlarms);
	};//插入函数，这里调用Mapper直接操作数据库。

	public void deleteById(int id){
		dailyAlarmsMapper.deleteById(id);
	};//删除函数，这里调用Mapper直接操作数据库。

	public void update(DailyAlarms dailyAlarms){
		dailyAlarmsMapper.update(dailyAlarms);//调用mapper中的更新代码
	};//更新

	public DailyAlarms getById(int id){
		return dailyAlarmsMapper.getById(id);
	}//根据id选择实体对象，这里调用Mapper直接数据库。

	public List<DailyAlarms> getList(String field,String fieldValue){
		return dailyAlarmsMapper.getList(field,fieldValue);
	}//获取列表

}
