package com.ecjtu.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-20 14:23
 */
public class Comment {

    private Integer id;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date commentTime;
    private String content;

    private Users user;
    private Admin admin;
    private Pet pet;
    private List<Answer> answers;
    public Comment() {
    }

    public Comment(Date commentTime, String content) {
        this.commentTime = commentTime;
        this.content = content;
    }

    public Comment(Integer id, Date commentTime, String content, Users user, Admin admin, Pet pet, List<Answer> answers) {
        this.id = id;
        this.commentTime = commentTime;
        this.content = content;
        this.user = user;
        this.admin = admin;
        this.pet = pet;
        this.answers = answers;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", commentTime=" + commentTime +
                ", content='" + content + '\'' +
                ", user=" + user +
                ", admin=" + admin +
                ", pet=" + pet +
                ", answers=" + answers +
                '}';
    }
}
