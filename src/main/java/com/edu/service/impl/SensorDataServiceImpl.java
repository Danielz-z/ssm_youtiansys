package com.edu.service.impl;

import java.util.*;
import java.sql.Timestamp;
import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.edu.model.SensorData;
import com.edu.mapper.SensorDataMapper;
import com.edu.service.SensorDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:dyb1296
 * time:2024-4-13 17:39:13
 * email:dyb1296@qq.com
 */
@Service
public class SensorDataServiceImpl implements SensorDataService{//这里用implements关键字来实现接口，接口的意义在于一种规范化，这里不用这个也可以，但是就是为了规范才用的


	@Autowired
	public SensorDataMapper sensorDataMapper;

	public void insert(SensorData sensorData){
		sensorData.setAddTime(new Timestamp(new Date(System.currentTimeMillis()).getTime()));
		sensorDataMapper.insert(sensorData);
	};//插入函数，这里调用Mapper直接操作数据库。

	public void deleteById(int id){
		sensorDataMapper.deleteById(id);
	};//删除函数，这里调用Mapper直接操作数据库。

	public void update(SensorData sensorData){
		sensorDataMapper.update(sensorData);//调用mapper中的更新代码
	};//更新

	public SensorData getById(int id){
		return sensorDataMapper.getById(id);
	}//根据id选择实体对象，这里调用Mapper直接数据库。

	public List<SensorData> getList(String field,String fieldValue){
		return sensorDataMapper.getList(field,fieldValue);
	}//获取列表

}
