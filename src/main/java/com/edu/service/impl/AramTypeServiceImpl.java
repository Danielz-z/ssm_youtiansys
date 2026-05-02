package com.edu.service.impl;

import java.util.*;
import java.sql.Timestamp;
import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.edu.model.AramType;
import com.edu.mapper.AramTypeMapper;
import com.edu.service.AramTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:dyb1296
 * time:2024-4-13 13:11:35
 * email:dyb1296@qq.com
 */
@Service
public class AramTypeServiceImpl implements AramTypeService{//这里用implements关键字来实现接口，接口的意义在于一种规范化，这里不用这个也可以，但是就是为了规范才用的


	@Autowired
	public AramTypeMapper aramTypeMapper;

	public void insert(AramType aramType){
		aramType.setAddTime(new Timestamp(new Date(System.currentTimeMillis()).getTime()));
		aramTypeMapper.insert(aramType);
	};//插入函数，这里调用Mapper直接操作数据库。

	public void deleteById(int id){
		aramTypeMapper.deleteById(id);
	};//删除函数，这里调用Mapper直接操作数据库。

	public void update(AramType aramType){
		aramTypeMapper.update(aramType);//调用mapper中的更新代码
	};//更新

	public AramType getById(int id){
		return aramTypeMapper.getById(id);
	}//根据id选择实体对象，这里调用Mapper直接数据库。

	public List<AramType> getList(String field,String fieldValue){
		return aramTypeMapper.getList(field,fieldValue);
	}//获取列表

}
