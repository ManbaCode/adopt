package com.ecjtu.controller;

import com.ecjtu.entity.Comment;
import com.ecjtu.service.CommentService;
import com.ecjtu.util.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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


    @RequestMapping("/getComments.action")
    public String getComments(ModelAndView modelAndView){
        List<Comment> comments = commentService.getComments();
        modelAndView.addObject("comments",comments);
        return "admin/comment";
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
