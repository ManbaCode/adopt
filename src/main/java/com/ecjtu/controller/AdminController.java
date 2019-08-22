package com.ecjtu.controller;

import com.ecjtu.entity.Admin;
import com.ecjtu.service.AdminService;
import com.ecjtu.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-22 10:22
 */
@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/admins.action")
    public String getAdmins(Model model){
        List<Admin> admins = adminService.getAdmins();
        model.addAttribute("admins",admins);
        return "admin/admin";
    }

    @RequestMapping("/create.action")
    @ResponseBody
    public Message addAdmin(Admin admin){
        int i = adminService.addAdmin(admin);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("/delete.action")
    @ResponseBody
    public Message deleteAdmin(Integer id){
        int i = adminService.deleteAdmin(id);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }


    @RequestMapping("/update.action")
    @ResponseBody
    public Message updateAdmin(Admin admin){
        int i = adminService.updateAdmin(admin);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("/findById.action")
    @ResponseBody
    public Admin findById(Integer id){
        Admin admin = adminService.findById(id);
        if(admin!=null){
            return admin;
        }else{
            return null;
        }
    }
    @RequestMapping("/findByName.action")
    @ResponseBody
    public Admin findByIName(String adminName){
        Admin admin = adminService.findByName(adminName);
        if(admin!=null){
            return admin;
        }else{
            return null;
        }
    }

}
