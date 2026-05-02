package com.edu.mapper;

import java.util.*;
import org.apache.ibatis.annotations.Param;
import com.edu.model.SensorData;

/**
 * author:dyb1296
 * time:2024-4-14 4:44:59
 * email:dyb1296@qq.com
 * function:实现数据库操作，比如ABCMapper，那么就是实现对ABC这个表的增删改查，这里体现使用了Mybatis框架
 * 本文件和SSM结构的关系:SSM结构的架构就是JSP（浏览器）发送请求，然后请求到对应的Controller，然后Controller调用Service，Service调用Mapper，mapper调用数据库实现增删改查，最后由Controller返回到JSP完成全过程。
 * 本文件对应Mapper，负责表SensorData
 * 箭头结构：JSP->Controller->Service->[Mapper]->数据库-->JSP
 */
public interface SensorDataMapper {//Mapper结尾是为了规范，当看见XXXMapper时候就可以意识到这个是操作数据库用的，执行对应的代码直接实现增删改查，不需要手动拼接数据库语句，非常的方便

	public void insert(SensorData sensorData);//插入函数

	public void deleteById(int id);//删除函数

	public void update(SensorData sensorData);//更新

	public SensorData getById(int id);//根据id选择实体对象

	public List<SensorData> getList(@Param("field") String field,
			@Param("fieldValue") String fieldValue);//获取列表

}
