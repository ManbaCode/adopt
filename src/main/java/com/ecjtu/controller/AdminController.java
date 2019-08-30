package com.ecjtu.controller;

import com.ecjtu.entity.Admin;
import com.ecjtu.service.AdminService;
import com.ecjtu.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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


    @RequestMapping("admins.action")
    @ResponseBody
    public Message getAdmins(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        // 引入PageHelper分页插件
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pn,4);
        List<Admin> admins = adminService.getAdmins();
        // startPage后面紧跟的这个查询就是一个分页查询
        System.out.println(admins+"admins");
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo page=new PageInfo(admins,2);
        return Message.success().add("pageInfo",page);
    }

    @RequestMapping("create.action")
    @ResponseBody
    public Message addAdmin(Admin admin){
        int i = adminService.addAdmin(admin);
        System.out.println(i);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("delete.action")
    @ResponseBody
    public Message deleteAdmin(Integer id){
        int i = adminService.deleteAdmin(id);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }


    @RequestMapping("update.action")
    @ResponseBody
    public Message updateAdmin(Admin admin, @RequestParam(value = "file")MultipartFile file){
        String load = FileLoad.load(file);
        admin.setPic(load);
        int i = adminService.updateAdmin(admin);
        System.out.println(i);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("findById.action")
    @ResponseBody
    public Message findById(Integer id) throws ParseException {
        Admin admin = adminService.findById(id);
        if(admin!=null){
            return Message.success().add("admin",admin);
        }else{
            return Message.fail();
        }
    }
    @RequestMapping("/findByName.action")
    @ResponseBody
    public Message findByName(String adminName){
        Admin admin = adminService.findByName(adminName);
        List<Admin> page=new ArrayList<>();
        page.add(admin);
        System.out.println(page);
        return Message.success().add("pageInfo",page);
    }


    @RequestMapping("logout.action")
    public String logout(){
        return "admin/login";
    }

}
