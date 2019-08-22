package com.ecjtu.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * @author Mr Wu
 * @create: 2019-08-20 14:23
 */
public class Admin {
    private Integer id;
    private String adminName;
    private String adminPwd;
    private String realName;
    private String telephone;
    private String Email;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;
    private String sex;
    private String remark;
    List<Comment> commentList;

    public Admin() {
    }

    public Admin( String adminName, String adminPwd, String realName, String telephone, String Email, Date birthday, String sex, String remark) {
        this.adminName = adminName;
        this.adminPwd = adminPwd;
        this.realName = realName;
        this.telephone = telephone;
        this.Email = Email;
        this.birthday = birthday;
        this.sex = sex;
        this.remark = remark;
    }

    public Admin(String adminName, String adminPwd, String realName, String telephone, String Email, Date birthday, String sex, String remark, List<Comment> commentList) {
        this.adminName = adminName;
        this.adminPwd = adminPwd;
        this.realName = realName;
        this.telephone = telephone;
        Email = this.Email;
        this.birthday = birthday;
        this.sex = sex;
        this.remark = remark;
        this.commentList = commentList;
    }

    public Admin(Integer id, String adminName, String adminPwd, String realName, String telephone, String Email, Date birthday, String sex, String remark, List<Comment> commentList) {
        this.id = id;
        this.adminName = adminName;
        this.adminPwd = adminPwd;
        this.realName = realName;
        this.telephone = telephone;
        this.Email = Email;
        this.birthday = birthday;
        this.sex = sex;
        this.remark = remark;
        this.commentList = commentList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    public void setAdminPwd(String adminPwd) {
        this.adminPwd = adminPwd;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        Email = Email;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", adminName='" + adminName + '\'' +
                ", adminPwd='" + adminPwd + '\'' +
                ", realName='" + realName + '\'' +
                ", telephone='" + telephone + '\'' +
                ", Email='" + Email + '\'' +
                ", birthday=" + birthday +
                ", sex='" + sex + '\'' +
                ", remark='" + remark + '\'' +
                ", commentList=" + commentList +
                '}';
    }
}
