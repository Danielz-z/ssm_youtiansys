package com.edu.service.impl;

import java.util.*;
import java.sql.Timestamp;
import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.edu.model.AlarmStats;
import com.edu.mapper.AlarmStatsMapper;
import com.edu.service.AlarmStatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:dyb1296
 * time:2024-4-13 23:44:19
 * email:dyb1296@qq.com
 */
@Service
public class AlarmStatsServiceImpl implements AlarmStatsService{//这里用implements关键字来实现接口，接口的意义在于一种规范化，这里不用这个也可以，但是就是为了规范才用的


	@Autowired
	public AlarmStatsMapper alarmStatsMapper;

	public void insert(AlarmStats alarmStats){
		alarmStats.setAddTime(new Timestamp(new Date(System.currentTimeMillis()).getTime()));
		alarmStatsMapper.insert(alarmStats);
	};//插入函数，这里调用Mapper直接操作数据库。

	public void deleteById(int id){
		alarmStatsMapper.deleteById(id);
	};//删除函数，这里调用Mapper直接操作数据库。

	public void update(AlarmStats alarmStats){
		alarmStatsMapper.update(alarmStats);//调用mapper中的更新代码
	};//更新

	public AlarmStats getById(int id){
		return alarmStatsMapper.getById(id);
	}//根据id选择实体对象，这里调用Mapper直接数据库。

	public List<AlarmStats> getList(String field,String fieldValue){
		return alarmStatsMapper.getList(field,fieldValue);
	}//获取列表

}
