package com.ecjtu.mapper;

import com.ecjtu.entity.Answer;

/**
 * @author Mr Wu
 * @create: 2019-08-29 14:03
 */
public interface AnswerMapper {


    /**
     * 更具id查询用户的信息
     * @param id 回复的id
     * @return answer
     * */
    Answer findById(Integer id);

}
