<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 24255
  Date: 2019/8/22
  Time: 23:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>动物的具体信息</title>
    <style type="text/css">
        .myDiv{
            margin-top: 40px;
        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slideBox.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.comment.js"></script>
</head>
<body>
<div class="myDiv" >

    <div >
        <h2>待领养的动物</h2>
        <center>
            <div id="demo1" class="slideBox">
                <ul class="items">
                    <c:forEach items="${pics}" var="pic">
                        <li>
                            <a href="" ><img class="my-img" src="/images/${pic}"></a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="name">
                <img src="/images/p9.jpg">
                <span>${pet.petName}</span>
            </div>
        </center>
        <div class="animal">
            <div class="group">
                <div class="animalX1">
                    <img src="/images/P7.jpg"><span>编号</span><br>
                    <p>${pet.id}</p>
                </div>
                <div class="animalX2">
                    <img src="/images/p6.jpg"><span>生日</span><br>
                    <p>
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${pet.birthday}"/>
                    </p>
                </div>
            </div>
            <div class="group">
                <div class="animalX3">
                    <img src="/images/catsm1.jpg"><span>品种</span><br>
                    <p>${pet.petType}</p>
                </div>
                <div class="animalX4">
                    <img src="/images/p4.jpg"><span>性别</span><br>
                    <p>${pet.sex}</p>
                </div>
            </div>
        </div>
        <div class="animal_me">
            <div class="animal_me1"><img src="/images/p11.jpg"></div>
            <div class="animal_me2"><p>大家好，我是${pet.petName}。${pet.remark}。你能带我回家吗？</p></div>
            <div class="animal_me3"><img src="/images/p10.jpg"></div>
        </div>
        <div class="my_btn">
            <button class="btn btn-primary btn-lg" id="pet_adopt_modal_btn">想要领养</button>
            <button class="btn btn-primary btn-lg" id="tianchuan_btn" style="float: right;position: relative;left: 150px;bottom: 45px">返回主页</button>
        </div>
    </div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myAdopt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        请填写个人信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="new_adopt_form">
                        <input type="hidden" value="${user.id}" name="id">
                        <div class="form-group">
                            <label for="new_Name" class="col-sm-2 control-label">
                                姓名： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_Name"
                                       placeholder="userName" name="userName" value="${user.userName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_petName" class="col-sm-2 control-label">
                                姓名： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_petName"
                                       placeholder="petName" name="petName" value="${pet.petName}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_Sex" class="col-sm-2 control-label">
                                性别： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_Sex"
                                       placeholder="sex" name="sex" value="${user.sex}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_tel" class="col-sm-2 control-label">
                                联系方式： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_tel"
                                       placeholder="telephone" name="telephone" value="${user.telephone}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_Email" class="col-sm-2 control-label">
                                邮件： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_Email"
                                       placeholder="Email" name="new_Email" value="${user.email}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_Adress" class="col-sm-2 control-label">
                                地址： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_Adress"
                                       placeholder="地址" name="address" value="${user.address}">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="submit_btn">提交申请</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <%--存放评论的地方--%>
    <div class="comment-list">

    </div>

    <div class="container">
        <div class="commentbox">
            <textarea cols="80" rows="50" placeholder="来说几句吧" class="mytextarea" id="content"></textarea>
            <div class="btn btn-info pull-right" id="comment">评论</div>
        </div>

    </div>
</div>

<script>
    var user="${sessionScope.user}";

    jQuery(function($){
        $('#demo1').slideBox();
    });

    var id="${sessionScope.pet}";

    $(function () {
        to_page();
    });

    function to_page(){
        //session里面的数据
        console.log("${pet.id}");
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/petComments.action?pet_id="+"${pet.id}",
            type:"GET",
            success:function(result){
                console.log(result.extend.comment);
                submit(result);
            },
            error:function (result) {
                alert("评论导出失败");
            }
        });
    }
    //字符串拼接
    function submit(result) {
        //清空数据
        $(".comment-list").empty();
        //对结果进行遍历
        var comments=result.extend.comment;
        console.log(comments);
        $.each(comments,function(index,comment){
            var headTd=$("<header></header>").append($("<img>").attr("src","/images/"+(comment.user.pic)));
            var head=$("<div></div>").addClass("comment-right");
            var userNameTd=$("<h3></h3>").append(comment.user.userName);
            var bodyTd=$("<div></div>").addClass("comment-content-header");
            var timeTd=$("<span></span>").append($("<i></i>").addClass("glyphicon glyphicon-time")).append(comment.commentTime);
            bodyTd.append(timeTd);
            var commentTd=$("<p></p>").addClass("content").append(comment.content);
            head.append(userNameTd).append(bodyTd).append(commentTd);
            $("<div></div>").addClass("comment-info")
                .append(headTd)
                .append(head)
                .appendTo(".comment-list");
        });
    };


    $("#comment").click(function () {
        alert(111);
        var comment=$("#content").val();
        console.log(comment);
        if(comment==null){
            alert("请填入评论后才能发表")
        };
        $.ajax({
            url:"${pageContext.request.contextPath}/comment/create.action?content="+comment,
            type:"GET",
            success:function (result) {
                alert("评论插入成功");
                to_page();
            },
            error:function (result) {
                alert("评论插入失败")
            }
        })
    })


    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //点击新增按钮弹出模态框。
    $("#pet_adopt_modal_btn").click(function(){
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        reset_form("#new_adopt_form");
        $("#new_id").val("${user.id}");
        $("#new_userName").val("${user.userName}");
        $("#new_sex").val("${user.sex}");
        $("#new_telephone").val("${user.telephone}");
        $("#new_Email").val("${user.email}");
        $("#new_address").val("${user.address}");
        //弹出模态框
        $("#myAdopt").modal({
            backdrop:"static"
        });
    });
    //点击保存，保存到申请表
    $("#submit_btn").click(function(){
        var ted=document.getElementById("new_adopt_form");
        var adopt=new FormData(ted);
        console.log(adopt);
        $.ajax({
            url:"${pageContext.request.contextPath}/adopt/create.action",
            type:"POST",
            processData: false,  // 告诉jQuery不要去处理发送的数据
            contentType: false, // 告诉jQuery不要去设置Content-Type请求头
            date:adopt,
            success:function (result) {
                alert("提交申请成功");
            },
            error:function (result) {
                console.log(result);
                alert("提交申请失败");
            }
        });
    });


    $("#tianchuan_btn").click(function () {
        window.location.href="${pageContext.request.contextPath}/animal/index.jsp";
    })
</script>
</body>
</html>


