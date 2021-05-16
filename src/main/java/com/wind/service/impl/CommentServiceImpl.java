package com.wind.service.impl;

import com.wind.entity.Comment;
import com.wind.mapper.CommentMapper;
import com.wind.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-21 10:59
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;



    @Override
    public int addComment(Comment comment) {
        int i = commentMapper.addComment(comment);
        return i;
    }

    @Override
    public int deleteComment(Integer id) {
        int i = commentMapper.deleteComment(id);
        return i;
    }

    @Override
    public int updateComment(Comment comment) {
        int i = commentMapper.updateComment(comment);
        return 0;
    }

    @Override
    public void updateRelationUser(Integer user_id) {
        commentMapper.updateRelationUser(user_id);
    }

    @Override
    public void updateRelationPet(Integer pet_id) {
        commentMapper.updateRelationPet(pet_id);
    }

    @Override
    public List<Comment> getComments() {
        List<Comment> comments = commentMapper.getComments();
        return comments;
    }

    @Override
    public List<Comment> findByPetId(Integer pet_id) {
        List<Comment> byPetId = commentMapper.findByPetId(pet_id);
        return byPetId;
    }

    @Override
    public List<Comment> findByName(String name) {
        List<Comment> byName = commentMapper.findByName(name);
        return byName;
    }

    @Override
    public Comment findById(Integer id) {
        Comment byId = commentMapper.findById(id);
        return byId;
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        commentMapper.deleteBatch(ids);
    }
}
