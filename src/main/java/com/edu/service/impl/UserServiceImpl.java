package com.edu.service.impl;

import com.edu.mapper.UserMapper;
import com.edu.model.User;
import com.edu.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    public void insert(User user){
        userMapper.insert(user);
    }

    public void deleteById(int id){
        userMapper.deleteById(id);
    }

    public void update(User user){
        userMapper.update(user);
    }

    public User getById(int id){
       return userMapper.getById(id);
    }

    public User getObjectByName(User user){
        return userMapper.getObjectByName(user);
    }

    public List<User> getList(@Param("field") String field,
                              @Param("fieldValue") String fieldValue){
        return userMapper.getList(field,fieldValue);
    }

    @Override
    public int getTableNum(String database) {
        return userMapper.getTableNum(database);
    }
}
