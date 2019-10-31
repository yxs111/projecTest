package com.qfedu.service.impl;

import com.qfedu.dao.UserMapper;
import com.qfedu.pojo.User;

import com.qfedu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
@Autowired
private UserMapper userMapper;


    @Override
    public List<User> selectUserList(User user) {

        List<User>courseList=userMapper.selectUserList(user);
        return courseList;
    }

    @Override
    public boolean delUserById(int id) {
        int result = userMapper.delUserById(id);
        return result>0?true:false;
    }

    @Override
    public int saveOrUpdate(User user) {
        int result = 0;
        if (user.getId()==0){
            userMapper.insertUser(user);
        }else {
              userMapper.updateUser(user);
        }
        return result;
    }


    @Override
    public User findById(int id) {
        return userMapper.findById(id);
    }

}
