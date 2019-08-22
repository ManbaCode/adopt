package com.ecjtu.controller;

import com.ecjtu.entity.Admin;
import com.ecjtu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Mr Wu
 * @create: 2019-08-22 14:12
 */
@Controller
public class AdminLogin {

    @Autowired
    private AdminService adminService;

    @RequestMapping("login.action")
    public String login(Admin admin, Model model){
        Admin admin1 = adminService.loginAdmin(admin);
        System.out.println(admin1);
        if(admin1!=null){
            return "forward:admin/admins.action";
        }else {
            model.addAttribute("msg","账号或者密码有错，请重新输入！");
            return "admin/login";
        }
    }
}
