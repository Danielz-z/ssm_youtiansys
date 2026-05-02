package com.edu.service.impl;

import java.util.*;
import java.sql.Timestamp;
import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.edu.model.OilFieldInfo;
import com.edu.mapper.OilFieldInfoMapper;
import com.edu.service.OilFieldInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:dyb1296
 * time:2024-4-10 14:01:26
 * email:dyb1296@qq.com
 */
@Service
public class OilFieldInfoServiceImpl implements OilFieldInfoService{//这里用implements关键字来实现接口，接口的意义在于一种规范化，这里不用这个也可以，但是就是为了规范才用的


	@Autowired
	public OilFieldInfoMapper oilFieldInfoMapper;

	public void insert(OilFieldInfo oilFieldInfo){
		oilFieldInfo.setAddTime(new Timestamp(new Date(System.currentTimeMillis()).getTime()));
		oilFieldInfoMapper.insert(oilFieldInfo);
	};//插入函数，这里调用Mapper直接操作数据库。

	public void deleteById(int id){
		oilFieldInfoMapper.deleteById(id);
	};//删除函数，这里调用Mapper直接操作数据库。

	public void update(OilFieldInfo oilFieldInfo){
		oilFieldInfoMapper.update(oilFieldInfo);//调用mapper中的更新代码
	};//更新

	public OilFieldInfo getById(int id){
		return oilFieldInfoMapper.getById(id);
	}//根据id选择实体对象，这里调用Mapper直接数据库。

	public List<OilFieldInfo> getList(String field,String fieldValue){
		return oilFieldInfoMapper.getList(field,fieldValue);
	}//获取列表

}
