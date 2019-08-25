package com.ecjtu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @author Mr Wu
 * @create: 2019-08-25 19:09
 */
@Controller
@RequestMapping("file")
public class FileController {


    @RequestMapping("upload.action")
    public String load(MultipartFile file, Model model) {
        String picName = UUID.randomUUID().toString();
        //获取上传文件得元素得名称
        String fileName = file.getOriginalFilename();
        String substring = fileName.substring(fileName.lastIndexOf("."));
        //上传文件
        try {
            file.transferTo(new File("C:/Users/24255/Pictures/sky/" + picName + substring));
        } catch (IOException e) {
            e.printStackTrace();
        }
        String name = picName + substring;
        //存储数据库中，自需要把fileName写入数据库中
        model.addAttribute("files", name);
        //对象
        return "file";
    }
}
