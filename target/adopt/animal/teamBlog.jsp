<%--
  Created by IntelliJ IDEA.
  User: 24255
  Date: 2019/8/22
  Time: 23:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Title</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords" content=""/>
    <!--// Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" type="text/css" media="all">
    <!-- Owl-Carousel-CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" media="all" />


</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<!-- blog -->
<div class="blog" id="blog">
    <div class="container">
        <h3 class="agile-title">Our Blog</h3>
        <div class="col-md-5 col-xs-6 blog-grids">
            <div class="blog-full-wthree">
                <div class="blog-left-agileits">
                    <p>Jan</p>
                    <span>18</span>
                </div>
                <div class="blog-right-agileits-w3layouts">
                    <h4>
                        <a href="#" data-toggle="modal" data-target="#myModal2">eoquie int temporant 2018</a>
                    </h4>
                    <p>
                        <a href="#" data-toggle="modal" data-target="#myModal2">Cat Life</a>
                    </p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="blog-full-wthree">
                <div class="blog-left-agileits">
                    <p>Feb</p>
                    <span>22</span>
                </div>
                <div class="blog-right-agileits-w3layouts">
                    <h4>
                        <a href="#" data-toggle="modal" data-target="#myModal2">eoquie int temporant 2018</a>
                    </h4>
                    <p>
                        <a href="#" data-toggle="modal" data-target="#myModal2">Cat Life</a>
                    </p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="blog-full-wthree">
                <div class="blog-left-agileits">
                    <p>Feb</p>
                    <span>15</span>
                </div>
                <div class="blog-right-agileits-w3layouts">
                    <h4>
                        <a href="#" data-toggle="modal" data-target="#myModal2">eoquie int temporant 2018</a>
                    </h4>
                    <p>
                        <a href="#" data-toggle="modal" data-target="#myModal2">Cat Life</a>
                    </p>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="col-md-5 col-xs-6 blog-grids">
            <div class="blog-full-wthree">
                <div class="blog-left-agileits">
                    <p>Jan</p>
                    <span>26</span>
                </div>
                <div class="blog-right-agileits-w3layouts">
                    <h4>
                        <a href="#" data-toggle="modal" data-target="#myModal2">eoquie int temporant 2018</a>
                    </h4>
                    <p>
                        <a href="#" data-toggle="modal" data-target="#myModal2">Cat Life</a>
                    </p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="blog-full-wthree">
                <div class="blog-left-agileits">
                    <p>Feb</p>
                    <span>06</span>
                </div>
                <div class="blog-right-agileits-w3layouts">
                    <h4>
                        <a href="#" data-toggle="modal" data-target="#myModal2">eoquie int temporant 2018</a>
                    </h4>
                    <p>
                        <a href="#" data-toggle="modal" data-target="#myModal2">Cat Life</a>
                    </p>
                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="blog-full-wthree">
                <div class="blog-left-agileits">
                    <p>Feb</p>
                    <span>12</span>
                </div>
                <div class="blog-right-agileits-w3layouts">
                    <h4>
                        <a href="#" data-toggle="modal" data-target="#myModal2">eoquie int temporant 2018</a>
                    </h4>
                    <p>
                        <a href="#" data-toggle="modal" data-target="#myModal2">Cat Life</a>
                    </p>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
    <div class="blog-grids mid-blog-agile">
        <img src="${pageContext.request.contextPath}/images/cat2.png" class="img-responsive" alt="">
    </div>
</div>
<!-- Modal5 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-info">
                    <h4>Cat Life</h4>
                    <img src="${pageContext.request.contextPath}/images/g2.jpg" alt=" " class="img-responsive" />
                    <h5>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h5>
                    <p class="para-agileits-w3layouts">Duis sit amet nisi quis leo fermentum vestibulum vitae eget augue. Nulla quam nunc, vulputate id urna at, tempor tincidunt
                        metus. Sed feugiat quam nec mauris mattis malesuada.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //Modal5 -->
<!-- //blog -->
<!-- js -->
<script src="${pageContext.request.contextPath}/JQuery/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- Necessary-JavaScript-File-For-Bootstrap -->
<!-- //js -->
<script type="text/javascript">
    var totalRecord,currentPage;

    // $(function(){
    //     to_page(1);
    // });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/admins.action",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //1、解析并显示员工数据
                build_admins_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }


    function build_admins_table(result){
        //清空table表格
        $("#admin_table tbody").empty();
        //index：下标 user：单个对象
        var admins=result.extend.pageInfo.list;
        $.each(admins,function(index,admin){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var adminIdTd = $("<td></td>").append(admin.id);
            var adminNameTd = $("<td></td>").append(admin.adminName);
            var realNameTd = $("<td></td>").append(admin.realName);
            var telephoneTd=$("<td></td>").append(admin.telephone);
            var emailTd=$("<td></td>").append(admin.email);
            var birthdayTd=$("<td></td>").append(admin.birthday);
            var sexTd=$("<td></td>").append(admin.sex);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",admin.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",admin.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(adminIdTd)
                .append(adminNameTd)
                .append(realNameTd)
                .append(telephoneTd)
                .append(emailTd)
                .append(birthdayTd)
                .append(sexTd)
                .append(btnTd)
                .appendTo("#admin_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
            result.extend.pageInfo.pages+"页,总"+
            result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.total;//最后的数据
        currentPage = result.extend.pageInfo.pageNum;//当前页
    }
    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
</script>
</body>
</html>
