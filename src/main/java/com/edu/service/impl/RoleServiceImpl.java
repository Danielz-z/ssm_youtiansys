package com.edu.service.impl;

import java.util.*;
import java.sql.Timestamp;
import java.sql.Date;
import org.apache.ibatis.annotations.Param;
import com.edu.model.Role;
import com.edu.mapper.RoleMapper;
import com.edu.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * author:dyb1296
 * time:2023-11-6 10:50:21
 * email:dyb1296@qq.com
 */
@Service
public class RoleServiceImpl implements RoleService{//这里用implements关键字来实现接口，接口的意义在于一种规范化，这里不用这个也可以，但是就是为了规范才用的


	@Autowired
	public RoleMapper roleMapper;

	public void insert(Role role){
		role.setAddTime(new Timestamp(new Date(System.currentTimeMillis()).getTime()));
		roleMapper.insert(role);
	};//插入函数，这里调用Mapper直接操作数据库。

	public void deleteById(int id){
		roleMapper.deleteById(id);
	};//删除函数，这里调用Mapper直接操作数据库。

	public void update(Role role){
		roleMapper.update(role);//调用mapper中的更新代码
	};//更新

	public Role getById(int id){
		return roleMapper.getById(id);
	}//根据id选择实体对象，这里调用Mapper直接数据库。

	public List<Role> getList(String field,String fieldValue){
		return roleMapper.getList(field,fieldValue);
	}//获取列表

}
