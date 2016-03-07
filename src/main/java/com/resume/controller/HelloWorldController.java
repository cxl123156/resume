package com.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by chen9 on 2015/11/16.
 */
@Controller

public class HelloWorldController {
    @RequestMapping("/hello.do")
    public ModelAndView handleRequest(HttpServletRequest request , HttpServletResponse response) throws Exception{

    ModelAndView mv  = new ModelAndView();
    mv.addObject("message", "hello world!!!");
    mv.setViewName("hello.jsp");
    return mv;
}

}
