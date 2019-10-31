package com.qfedu.controller;


import com.qfedu.pojo.User;

import com.qfedu.service.UserService;
import com.qfedu.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;


/*
    Ctrl + N 可以通过类名查找源代码，包括jar包中的代码
 */
@Controller
@RequestMapping("/user")
public class UserController {
       @Autowired

        private UserService userService;



    @RequestMapping("/list")
    public String list(Model model, User user){

        List<User> users = userService.selectUserList(user);
        model.addAttribute("users",users);

        return "/behind/userList";
    }


@RequestMapping("/delUserById")
@ResponseBody
public String delUserById(Integer id) {
    boolean result = userService.delUserById(id);
    if (result) {
        return "success";
    } else {
        return "fail";
    }
}

    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(User user){
        userService.saveOrUpdate(user);
        return "redirect:/user/list";
    }
    @RequestMapping("insertUser")
    public String insertUser (){

        return "behind/addUser";

    }
    @RequestMapping("updateUser")
    public String updateUser (int id,Model model){
        User user=userService.findById(id);
        model.addAttribute("user",user);

        return "behind/addUser";

    }


}
