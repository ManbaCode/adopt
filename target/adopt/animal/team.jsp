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
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css" type="text/css" media="all">

</head>
<body>

<jsp:include page="navigation.jsp"></jsp:include>
<!-- team -->
<div class="team" id="team">
    <div class="container">
        <h3 class="agile-title">我们的团队</h3>
        <div class="team-agileinfo">

        </div>

    </div>
    <!-- 显示分页信息 -->
    <div class="row">
        <div class="col-md-5"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>


<!-- contact -->
<div class="contact" id="contact">
    <div class="container">
        <div class="col-md-9 col-sm-9 contact-right">
            <form action="#" method="post">
                <input type="text" name="name" placeholder="Your name" required="">
                <input type="email" name="email" placeholder="Your email" required="">
                <input type="text" name="subject" placeholder="Your subject" required="">
                <input type="text" name="phone number" placeholder="Phone number" required="">
                <textarea name="message" placeholder="Your message" required=""></textarea>
                <input type="submit" value="Send">
            </form>
        </div>
        <div class="col-md-3 col-sm-3 contact-left">
            <div class="address">
                <h4>
                    <i class="fa fa-map-marker" aria-hidden="true"></i>Location</h4>
                <p>345 Setwant natrer,</p>
                <p>Metropolitan, Italy.</p>
            </div>
            <div class="phone">
                <h4>
                    <i class="fa fa-phone" aria-hidden="true"></i>PHONE</h4>
                <p>+1(401) 1234 567.</p>
                <p>+1(804) 4261 150.</p>
            </div>
            <div class="email">
                <h4>
                    <i class="fa fa-envelope-o" aria-hidden="true"></i>E-MAIL</h4>
                <p>
                    <a href="mailto:info@example.com">Example1@gmail.com</a>
                </p>
                <p>
                    <a href="mailto:info@example.com">Example2@gmail.com</a>
                </p>
            </div>
        </div>
    </div>
</div>
<!-- //team -->
<!-- js -->
<script src="${pageContext.request.contextPath}/JQuery/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- Necessary-JavaScript-File-For-Bootstrap -->
<!-- //js -->
<script type="text/javascript">
    //总的数据 当前的页面

    var totalRecord,currentPage;

    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/admin/admins.action",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //1、解析并显示员工数据
                build_admins_table(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    function build_admins_table(result){
        //清空table表格
        $(".team-agileinfo").empty();
        //index：下标 user：单个对象
        var admins=result.extend.pageInfo.list;
        $.each(admins,function(index,admin){
            var pic=null
            var adminNameTd=null;
            var remarkTd=null;
            if( index%2 != 0){
                pic=$("<div></div>").addClass("team-grid-right aliquam").append($("<img/>").
                addClass("img-responsive").attr("src","/images/"+admin.pic));
                adminNameTd=$("<div></div>").addClass("team-grid-left non").append($("<h4></h4>")).append(admin.adminName);
                remarkTd=$("<p></p>").append(admin.remark);
                adminNameTd.append(remarkTd);
            }else{
                pic=$("<div></div>").addClass("team-grid-right").append($("<img/>").
                addClass("img-responsive").attr("src","/images/"+admin.pic));
                adminNameTd=$("<div></div>").addClass("team-grid-left").append($("<h4></h4>")).append(admin.adminName);
                remarkTd=$("<p></p>").append(admin.remark);
                adminNameTd.append(remarkTd);
            }
            $("<div></div>").addClass("col-md-6 team-grid w3-agileits")
                .append(pic)
                .append(adminNameTd)
                .appendTo(".team-agileinfo");
        });
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
