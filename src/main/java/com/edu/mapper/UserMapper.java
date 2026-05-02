package com.edu.mapper;

import com.edu.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

	public void insert(User user);

	public void deleteById(int id);

	public void update(User user);

	public User getById(int id);

	public User getObjectByName(User user);

	public List<User> getList(@Param("field") String field,
			@Param("fieldValue") String fieldValue);

	public int getTableNum(String database);

}
