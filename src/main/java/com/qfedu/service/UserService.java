package com.qfedu.service;

import com.qfedu.pojo.User;


import java.util.List;

public interface UserService {
    List<User> selectUserList(User user);
    boolean delUserById(int id);
    int saveOrUpdate(User User);
    User findById(int id);

}
