package com.ecjtu.controller;

import com.ecjtu.entity.Comment;
import com.ecjtu.service.CommentService;
import com.ecjtu.util.Message;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-22 10:23
 */
@Controller
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("comments.action")
    @ResponseBody
    public Message getComments(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,4);
        List<Comment> comments = commentService.getComments();
        System.out.println(comments);
        PageInfo page=new PageInfo(comments,2);
        return Message.success().add("pageInfo",page);
    }

    @RequestMapping("/create.action")
    @ResponseBody
    public Message createComment(Comment comment){
        if(commentService.addComment(comment)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("/delete.action")
    @ResponseBody
    public Message deleteComment(Integer id){
        if(commentService.deleteComment(id)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("/update.action")
    @ResponseBody
    public Message updateComment(Comment comment){
        if(commentService.updateComment(comment)>0){
            return Message.success();
        }else{
            return Message.fail();
        }
    }

    @RequestMapping("/findById.action")
    @ResponseBody
    public Comment findById(Comment comment){
        Comment byId = commentService.findById(comment);
        if(byId!=null){
            return byId;
        }else{
            return null;
        }
    }


}
