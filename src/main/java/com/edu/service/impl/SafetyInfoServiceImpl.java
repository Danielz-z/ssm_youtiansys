package com.edu.service.impl;

import java.util.*;
import java.sql.Timestamp;
import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.edu.model.SafetyInfo;
import com.edu.mapper.SafetyInfoMapper;
import com.edu.service.SafetyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:dyb1296
 * time:2024-4-11 11:35:38
 * email:dyb1296@qq.com
 */
@Service
public class SafetyInfoServiceImpl implements SafetyInfoService{//这里用implements关键字来实现接口，接口的意义在于一种规范化，这里不用这个也可以，但是就是为了规范才用的


	@Autowired
	public SafetyInfoMapper safetyInfoMapper;

	public void insert(SafetyInfo safetyInfo){
		safetyInfo.setAddTime(new Timestamp(new Date(System.currentTimeMillis()).getTime()));
		safetyInfoMapper.insert(safetyInfo);
	};//插入函数，这里调用Mapper直接操作数据库。

	public void deleteById(int id){
		safetyInfoMapper.deleteById(id);
	};//删除函数，这里调用Mapper直接操作数据库。

	public void update(SafetyInfo safetyInfo){
		safetyInfoMapper.update(safetyInfo);//调用mapper中的更新代码
	};//更新

	public SafetyInfo getById(int id){
		return safetyInfoMapper.getById(id);
	}//根据id选择实体对象，这里调用Mapper直接数据库。

	public List<SafetyInfo> getList(String field,String fieldValue){
		return safetyInfoMapper.getList(field,fieldValue);
	}//获取列表

}
