package com.edu.service.impl;

import java.util.*;
import java.sql.Timestamp;
import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.edu.model.Gonggao;
import com.edu.mapper.GonggaoMapper;
import com.edu.service.GonggaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:dyb1296
 * time:2024-4-12 1:45:43
 * email:dyb1296@qq.com
 */
@Service
public class GonggaoServiceImpl implements GonggaoService{//这里用implements关键字来实现接口，接口的意义在于一种规范化，这里不用这个也可以，但是就是为了规范才用的


	@Autowired
	public GonggaoMapper gonggaoMapper;

	public void insert(Gonggao gonggao){
		gonggao.setAddTime(new Timestamp(new Date(System.currentTimeMillis()).getTime()));
		gonggaoMapper.insert(gonggao);
	};//插入函数，这里调用Mapper直接操作数据库。

	public void deleteById(int id){
		gonggaoMapper.deleteById(id);
	};//删除函数，这里调用Mapper直接操作数据库。

	public void update(Gonggao gonggao){
		gonggaoMapper.update(gonggao);//调用mapper中的更新代码
	};//更新

	public Gonggao getById(int id){
		return gonggaoMapper.getById(id);
	}//根据id选择实体对象，这里调用Mapper直接数据库。

	public List<Gonggao> getList(String field,String fieldValue){
		return gonggaoMapper.getList(field,fieldValue);
	}//获取列表

}
