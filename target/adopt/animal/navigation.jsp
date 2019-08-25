<%--
  Created by IntelliJ IDEA.
  User: 24255
  Date: 2019/8/24
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><sitemesh:write property='title' /></title>
    <sitemesh:write property='head' />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-theme.min.css">
    <script src="${pageContext.request.contextPath}/JQuery/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>




    <sitemesh:write property='title' />
    <br />
    <sitemesh:write property='body' />

<!-- sticky navigation -->
<div class="nav-links">
    <nav class='navbar navbar-default'>
        <div class='container'>
            <div class='collapse navbar-collapse'>
                <ul>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/index.jsp">主页</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/about.jsp">宠物知识</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/service.jsp">领养中心</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/teamBlog.jsp">团队博客</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/animal/team.jsp">团队展示</a>
                    </li>

                    <li>
                        <button class="btn-primary btn-lg" data-toggle="modal" data-target="#login">注册/登录</button>
                    </li>
                    <li>
                        <button class="btn-primary btn-lg" data-toggle="modal" data-target="#editUsers">修改</button>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<!-- 注册登录模块框 -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    <div role="tabpanel">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#home" aria-controls="login" role="tab" data-toggle="tab">登录</a>
                            </li>
                            <li role="presentation">
                                <a href="#tab" aria-controls="register" role="tab" data-toggle="tab">注册</a>
                            </li>
                        </ul>
                    </div>
                </h4>
            </div>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <div class="modal-body">
                        <form class="form-horizontal" id="user_form" method="post">
                            <div class="form-group">
                                <label for="new_loginName" class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="new_loginName" placeholder="账号"
                                           name="loginName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_loginPwd" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="new_loginPwd" placeholder="密码"
                                           name="loginPwd">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="login_code" class="col-sm-2 control-label">验证码</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="login_code" placeholder="验证码"
                                           name="code">
                                    <div class="code" style="float: right">
                                        <img src="${pageContext.request.contextPath}/code" onclick="changeCode()"
                                             id="checkCodeImg"/>
                                        <a href="javascript:changeCode()">看不清换一张</a><br>
                                    </div>
                                </div>
                            </div>
                            <input type="submit" value="" id="dologin" style="display: none">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class=" btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn-primary" id="user_login_btn">登录</button>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="tab">
                    <div class="modal-body">
                        <form class="form-horizontal" id="register_user_form" method="post" action="register.user">
                            <div class="form-group">
                                <label for="register_userName" class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="register_userName" placeholder="账号"
                                           name="userName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="register_password" class="col-sm-2 control-label">密码</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="register_password" placeholder="密码"
                                           name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="register_sex" class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-8">
                                    <select class="form-control" id="register_sex" name="sex">
                                        <option value="男">男</option>
                                        <option value="女">女</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="register_telephone" class="col-sm-2 control-label">电话</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="register_telephone" placeholder="电话"
                                           name="telephone">
                                </div>
                            </div>
                            <input type="submit" value="" id="doRegister" style="display: none">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class=" btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class=" btn-primary" id="user_registe_btn">注册</button>
                    </div>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 注册登录模块框 -->


<!--个人信息修改的模态框-->

<!-- 修改班级模态框 -->
<div class="modal fade" id="editUsers" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_admin_form">
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_userName" class="col-sm-2 control-label">
                            用户名称
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_userName" placeholder="用户名称" name="userName">
                        </div>
                        <label for="edit_password" class="col-sm-2 control-label">
                            用户名称
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_password" placeholder="用户名称" name="userName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_sex" name="sex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <label for="edit_telephone" class="col-sm-2 control-label">
                            电话号码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_telephone" placeholder="电话" name="telephone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_Email" class="col-sm-2 control-label">
                            Email
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_Email" placeholder="Email"  name="Email">
                        </div>
                        <label for="edit_address" class="col-sm-2 control-label">
                            地址
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_address" placeholder="地址" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_state" class="col-sm-2 control-label">
                            经历
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_state" name="state">
                                <option value="0">有领养经历</option>
                                <option value="1">无领养经历</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class=" btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class=" btn-primary" id="user_update_btn">保存修改</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
