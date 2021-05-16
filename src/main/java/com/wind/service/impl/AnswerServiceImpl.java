package com.wind.service.impl;

import com.wind.entity.Answer;
import com.wind.mapper.AnswerMapper;
import com.wind.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-09-07 09:20
 */
@Service
public class AnswerServiceImpl implements AnswerService {

    @Autowired
    private AnswerMapper answerMapper;

    @Override
    public List<Answer> findByCommentId(Integer id) {
        List<Answer> answers = answerMapper.findByCommentId(id);
        return answers;
    }

    @Override
    public int addAnswer(Answer answer) {
        int i = answerMapper.addAnswer(answer);
        return i;
    }

    @Override
    public int addAnswers(Answer answer) {
        int i = answerMapper.addAnswers(answer);
        return i;
    }

    @Override
    public Answer findById(Integer id) {
        Answer answer = answerMapper.findById(id);
        return answer;
    }

}
