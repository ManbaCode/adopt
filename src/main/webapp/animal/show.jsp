<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/show.css">
    <script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slideBox.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.comment.js"></script>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div>
    <div>
        <h2>待领养的动物</h2>
        <center>
            <div id="demo1" class="slideBox">
                <ul class="items">
                    <c:forEach items="${pics}" var="pic">
                    <li><a href="" ><img class="my-img" src="${pageContext.request.contextPath}/images/${pic}"></a></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="name">
                <img src="${pageContext.request.contextPath}/images/p9.jpg">
                <span>${pet.petName}</span>
            </div>
        </center>
        <div class="animal">
            <div class="group">
                <div class="animalX1">
                    <img src="${pageContext.request.contextPath}/images/P7.jpg"><span>编号</span><br>
                    <p>${pet.id}</p>
                </div>
                <div class="animalX2">
                    <img src="${pageContext.request.contextPath}/images/P6.jpg"><span>生日</span><br>
                    <p>${pet.birthday}</p>
                </div>
            </div>
            <div class="group">
                <div class="animalX3">
                    <img src="${pageContext.request.contextPath}/images/catsm1.jpg"><span>品种</span><br>
                    <p>${pet.petType}</p>
                </div>
                <div class="animalX4">
                    <img src="${pageContext.request.contextPath}/images/p4.jpg"><span>性别</span><br>
                    <p>${pet.sex}</p>
                </div>
            </div>
            <div class="group">
                <div class="animalX5">
                    <img src="${pageContext.request.contextPath}/images/p8.jpg"><span>备注</span><br>
                    <p>${pet.reamrk}</p>
                </div>
            </div>
        </div>
        <div class="animal_me">
            <div class="animal_me1"><img src="${pageContext.request.contextPath}/images/p11.jpg"></div>
            <div class="animal_me2"><p>大家好，我是${pet.name}。我的特徵是${pet.remark}。我非常有活力，最愛和人玩耍逛街做運動。我很喜歡認識朋友，我有自信能和大部份狗狗友好相處。
                我已經準備好當你的好朋友，你能帶我回家給我永遠的溫暖嗎?</p></div>
            <div class="animal_me3"><img src="${pageContext.request.contextPath}/images/p10.jpg"></div>
        </div>
        <div class="my_btn">
            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">想要领养</button>
        </div>
    </div>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                    <form class="form-horizontal" id="new_department_form">
                        <div class="form-group">
                            <label for="new_Name" class="col-sm-2 control-label">
                                姓名： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_Name"
                                       placeholder="name" name="name" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_Sex" class="col-sm-2 control-label">
                                性别： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_Sex"
                                       placeholder="sex" name="sex">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_tel" class="col-sm-2 control-label">
                                联系方式： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_tel"
                                       placeholder="telephone" name="telephone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_Email" class="col-sm-2 control-label">
                                邮件： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_Email"
                                       placeholder="Email" name="new_Email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_Adress" class="col-sm-2 control-label">
                                地址： </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="new_Adress"
                                       placeholder="adress" name="address">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="new_remark" class="col-sm-2 control-label">
                                备注： </label>
                            <div class="col-sm-10">
                            <textarea type="text" class="form-control" id="new_remark"
                                      placeholder="remark" name="remark"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary">提交申请</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="comment-list">

    </div>
    <div class="container">
        <div class="commentbox">
            <textarea cols="80" rows="50" placeholder="来说几句吧${pageContext.request.contextPath}${pageContext.request.contextPath}${pageContext.request.contextPath}" class="mytextarea" id="content"></textarea>
            <div class="btn btn-info pull-right" id="comment">评论</div>
        </div>

    </div>
</div>
<script>
    jQuery(function($){
        $('#demo1').slideBox();

    });

    var arr = [
        {id:1,img:"./images/img.jpg",replyName:"帅大叔",beReplyName:"匿名",content:"同学聚会，看到当年追我的屌丝开着宝马车带着他老婆来了，他老婆是我隔壁宿舍的同班同学，心里后悔极了。",time:"2017-10-17 11:42:53",address:"深圳",osname:"",browse:"谷歌",replyBody:[]},
        {id:2,img:"./images/img.jpg",replyName:"匿名",beReplyName:"",content:"到菜市场买菜，看到一个孩子在看摊，我问：“一只鸡多少钱？” 那孩子回答：“23。” 我又问：“两只鸡多少钱？” 孩子愣了一下，一时间没算过来，急中生智大吼一声：“一次只能买一只！”",time:"2017-10-17 11:42:53",address:"深圳",osname:"",browse:"谷歌",replyBody:[{id:3,img:"",replyName:"帅大叔",beReplyName:"匿名",content:"来啊，我们一起吃鸡",time:"2017-10-17 11:42:53",address:"",osname:"",browse:"谷歌"}]},
        {id:3,img:"./images/img.jpg",replyName:"帅大叔",beReplyName:"匿名",content:"同学聚会，看到当年追我的屌丝开着宝马车带着他老婆来了，他老婆是我隔壁宿舍的同班同学，心里后悔极了。",time:"2017-10-17 11:42:53",address:"深圳",osname:"win10",browse:"谷歌",replyBody:[]}
    ];
    $(function(){
        $(".comment-list").addCommentList({data:arr,add:""});
        $("#comment").click(function(){
            var obj = new Object();
            obj.img="./images/img.jpg";
            obj.replyName="匿名";
            obj.content=$("#content").val();
            obj.browse="深圳";
            obj.osname="win10";
            obj.replyBody="";
            $(".comment-list").addCommentList({data:[],add:obj});
        });
    })
</script>
<script type="text/javascript">

    //点击编辑按钮弹出模态框。
    $(document).on("click",".edit_btn",function(){
        //1、发送ajax,根据id获取用户信息
        //清除表单数据（表单完整重置（表单的数据，表单的样式））
        var id = $(this).attr("edit-id");
        $.ajax({
            url:"${pageContext.request.contextPath}/user/findById.action?id="+id,
            type:"GET",
            success:function(result){
                //填充用户信息
                console.log(result);
                $("#edit_id").val(result.extend.users.id);
                $("#edit_userName").val(result.extend.users.userName);
                $("#edit_password").val(result.extend.users.password);
                $("#edit_sex").val(result.extend.users.sex);
                $("#edit_telephone").val(result.extend.users.telephone);
                $("#edit_Email").val(result.extend.users.email);
                $("#edit_address").val(result.extend.users.address);
                $("#edit_state").val(result.extend.users.state);
            }});
        //2、弹出模态框
        $("#editUsers").modal({
            backdrop:"static"
        });

    });

    //点击更新按钮弹出模态框。
    $("#user_update_btn").click(function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/user/update.action",
            type:"POST",
            data:$("#edit_user_form").serialize(),
            success:function (result) {
                alert("用户信息更新成功！");
                to_page(1);
            },
            error:function(result){
                alert("用户信息更新失败！");
            }
        });

    });
</script>
</body>
</html>


