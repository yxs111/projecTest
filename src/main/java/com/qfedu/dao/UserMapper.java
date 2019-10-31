package com.qfedu.dao;

import com.qfedu.pojo.User;


import java.util.List;

public interface UserMapper {
    List<User> selectUserList(User user);
    int delUserById(int id);
    void insertUser(User user);
    User findById(int id);
    void updateUser(User user);

}
