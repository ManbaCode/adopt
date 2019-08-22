package com.ecjtu.controller;

import com.ecjtu.entity.Blog;
import com.ecjtu.service.BlogService;
import com.ecjtu.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-20 15:06
 */
@Controller
@RequestMapping("blog")
public class BlogController {

    @Autowired
    private BlogService blogService;


    @RequestMapping("blogs.action")
    public String getBlog(ModelAndView modelAndView){
        List<Blog> blogs = blogService.getBlogs();
        modelAndView.addObject("blogs",blogs);
        return "admin/blog";
    }

    /**
    * 这是传给前端的数据
    * */
    @RequestMapping("blog.action")
    public String getBlogs(ModelAndView modelAndView){
        List<Blog> blogs = blogService.getBlogs();
        modelAndView.addObject("blogs",blogs);
        return "blog";
    }

    @RequestMapping("addBlog.action")
    @ResponseBody
    public Message addBlog(Blog blog){
        int i = blogService.addBlog(blog);
        if(i>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("deleteBlog.action")
    @ResponseBody
    public Message deleteBlog(Integer id){
        if(blogService.deleteBlog(id)>0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("updateBlog.action")
    @ResponseBody
    public Message updateBlog(Blog blog){
        if(blogService.updateBlog(blog)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("findById.action")
    @ResponseBody
    public Blog findById(Integer id){
        Blog blog = blogService.findById(id);
        return blog;
    }

    @RequestMapping("findByTime.action")
    public Blog findByTime(ModelAndView modelAndView, Date actionTime){
        Blog blog = blogService.findByTime(actionTime);
        return blog;
    }

}
