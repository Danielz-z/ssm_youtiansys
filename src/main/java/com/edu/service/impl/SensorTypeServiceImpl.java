package com.edu.service.impl;

import java.util.*;
import java.sql.Timestamp;
import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.edu.model.SensorType;
import com.edu.mapper.SensorTypeMapper;
import com.edu.service.SensorTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:dyb1296
 * time:2024-4-14 15:58:11
 * email:dyb1296@qq.com
 */
@Service
public class SensorTypeServiceImpl implements SensorTypeService{//这里用implements关键字来实现接口，接口的意义在于一种规范化，这里不用这个也可以，但是就是为了规范才用的


	@Autowired
	public SensorTypeMapper sensorTypeMapper;

	public void insert(SensorType sensorType){
		sensorType.setAddTime(new Timestamp(new Date(System.currentTimeMillis()).getTime()));
		sensorTypeMapper.insert(sensorType);
	};//插入函数，这里调用Mapper直接操作数据库。

	public void deleteById(int id){
		sensorTypeMapper.deleteById(id);
	};//删除函数，这里调用Mapper直接操作数据库。

	public void update(SensorType sensorType){
		sensorTypeMapper.update(sensorType);//调用mapper中的更新代码
	};//更新

	public SensorType getById(int id){
		return sensorTypeMapper.getById(id);
	}//根据id选择实体对象，这里调用Mapper直接数据库。

	public List<SensorType> getList(String field,String fieldValue){
		return sensorTypeMapper.getList(field,fieldValue);
	}//获取列表

}
