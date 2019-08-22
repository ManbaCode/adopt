package com.ecjtu.util;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Mr Wu
 * @create: 2019-08-20 17:22
 */
public class MyInterceptor implements HandlerInterceptor {

    /**
     * 在前端控制器执行之前执行，会返回boolean值，当false使就不往下执行了
     * */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("preHandle方法执行");
        String requestURI = request.getRequestURI();
        if(requestURI.indexOf("/login")>0){
            return true;
        }
        System.out.println("login");
        String name =(String)request.getSession().getAttribute("adminName");
        if(name!=null){
            return true;
        }
        request.setAttribute("msg","你还没有登录，请先登录！");
        request.getRequestDispatcher("login.jsp").forward(request,response);
        return false;
    }

    /**
     * 在前端控制器执行之后执行,到视图解析器
     * */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("PostHandle 方法执行");
    }

    /**
     * 当请求完成以后执行，一般进行资源的销毁
     * */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("afterCompletion 方法执行");
    }
}
