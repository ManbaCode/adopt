package com.ecjtu.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author Mr Wu
 * @create: 2019-08-29 13:57
 */
public class Answer {

    private int id;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date answerTime;
    private String content;

    private Users users;
    private Admin admin;
    private Pet pet;
    private Answer answer;
    private Comment comment;

    public Answer() {
    }

    public Answer(int id, Date answerTime, String content, Users users, Admin admin, Pet pet, Answer answer, Comment comment) {
        this.id = id;
        this.answerTime = answerTime;
        this.content = content;
        this.users = users;
        this.admin = admin;
        this.pet = pet;
        this.answer = answer;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getAnswerTime() {
        return answerTime;
    }

    public void setAnswerTime(Date answerTime) {
        this.answerTime = answerTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }

    public Answer getAnswer() {
        return answer;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }


    @Override
    public String toString() {
        return "Answer{" +
                "id=" + id +
                ", answerTime=" + answerTime +
                ", content='" + content + '\'' +
                ", users=" + users +
                ", admin=" + admin +
                ", pet=" + pet +
                ", answer=" + answer +
                ", comment=" + comment +
                '}';
    }
}
