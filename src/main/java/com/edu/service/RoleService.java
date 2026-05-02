package com.edu.service;

import java.util.*;
import com.edu.model.Role;

/**
 * author:dyb1296
 * time:2023-11-6 23:09:25
 * email:dyb1296@qq.com
 * 本文件和SSM结构的关系:SSM结构的架构就是JSP（浏览器）发送请求，然后请求到对应的Controller，然后Controller调用Service，Service调用Mapper，mapper调用数据库实现增删改查，最后由Controller返回到JSP完成全过程。
 * 本文件对应Service部分，负责表Role
 * 箭头结构：JSP->Controller->[Service]->Mapper->数据库-->JSP
 */
public interface RoleService {//service接口，使用的原因倒不是必要，本来Controller也可以自动调用数据库的Mapper进行操作数据库，但是如果项目代码比较多，直接调用mapper会导致controller中的代码比较多，这里写service的原因就是为了可以为controller层减轻压力，为后续扩充做准备。接口的学习文档https://www.runoob.com/java/java-interfaces.html

	public void insert(Role role);//插入函数

	public void deleteById(int id);//删除函数

	public void update(Role role);//更新

	public Role getById(int id);//根据id选择实体对象

	public List<Role> getList(String field,
			 String fieldValue);//获取列表

}
