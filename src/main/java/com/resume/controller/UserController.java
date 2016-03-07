package com.resume.controller;

import com.resume.entity.ResumeContext;
import com.resume.entity.User;
import com.resume.service.ResumeService;
import com.resume.service.UserService;
import com.resume.vo.ResumeContextVO;
import com.resume.vo.UserVO;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by chen9 on 2015/11/20.
 */
@Controller
@RequestMapping("/user")
public class UserController  {
    @Autowired
    public UserService userService;
    @Autowired
    public ResumeService resumeService;

    @RequestMapping(value = "/getById.do")
    public ModelAndView getUserById(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mv = new ModelAndView();
        User user = userService.findUserById(Integer.parseInt(request.getParameter("id")));
        mv.addObject("user", user);
        mv.setViewName("/userInfo.jsp");
        return mv;
    }

    @RequestMapping(value = "/regUser.do")
    @ResponseBody
    public String regUser(HttpServletRequest request, HttpServletResponse response) {
        User user = new User();
        String age = request.getParameter("age");
        ResumeContext resumeContext = new ResumeContext();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("password"));
        user.setEmail(request.getParameter("email"));
        user.setAge(Integer.parseInt(age));
        try
        {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = df.parse(request.getParameter("birthday"));
            user.setBirthday(date);
        }
        catch (ParseException e)
        {
            System.out.println(e.getMessage());
        }
        user.setNativePlace(request.getParameter("nativePlace"));
        user.setPhone(request.getParameter("phone"));
        user.setWebSite(request.getParameter("webSite"));
        resumeContext.setUserId(userService.addUser(user));
        resumeContext.setResumeName("默认简历");
        resumeService.saveResume(resumeContext);
        return "注册成功,即将跳转到登录页面";
    }

    @RequestMapping(value = "/login.do")
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response, HttpSession httpSession) {
        ModelAndView mv = new ModelAndView();
        UserVO userVO = new UserVO();
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = new User();
        if(((UserDetails) principal).getUsername().equals("guest")){
            user = userService.findUserByName("chen");
        }else{
            user = userService.findUserByName(((UserDetails) principal).getUsername());
        }
        userVO.setUser(user);
        userVO.setRole(((UserDetails) principal).getAuthorities());
        userVO.setBirthday(user.getBirthday());
        ResumeContext resumeContext = resumeService.getResumeByUserId(userVO.getUser().getId());
        ResumeContextVO resumeContextVO = new ResumeContextVO(resumeContext);
        httpSession.setAttribute("userVO", userVO);
        httpSession.setAttribute("resumeContextVO",resumeContextVO);
        mv.setViewName("/index.jsp");
        return mv;
    }

    @RequestMapping(value = "/error.do")
    @ResponseBody
    public String error(HttpServletRequest request) {
        JSONObject result = new JSONObject();
        result.put("title","error");
        result.put("text",getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
        return result.toString();
    }

    @RequestMapping(value = "/validateUsername.do")
    @ResponseBody
    public boolean validateUsername(HttpServletRequest request) {
        String username = request.getParameter("username");
        try {
            User user = userService.findUserByName(username);
            user.getUsername();
            return false;
        } catch (Exception e) {
            return true;
        }
    }

    @RequestMapping(value = "/userInfo.do")
    public String userInfo(@RequestParam(value = "modify",required = false) String modify,
                           @RequestParam(value = "saveModify",required = false) String savemModify,
                           HttpServletRequest request,HttpSession session){
        String result ="";
        if(modify!=null && modify.equals("1")){
            result = "/userPage/editUserInfo.jsp";
        } else if (savemModify!=null && savemModify.equals("1")){
            UserVO userVO =(UserVO)session.getAttribute("userVO");
            User user = userVO.getUser();
            user.setRealName(request.getParameter("realName"));
            user.setAge (Integer.parseInt(request.getParameter("age")));
            try
            {
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date date = df.parse(request.getParameter("birthday"));
                user.setBirthday(date);
            }
            catch (ParseException e)
            {
                System.out.println(e.getMessage());
            }
            user.setCollege(request.getParameter("college"));
            user.setMajor(request.getParameter("major"));
            user.setDegree(request.getParameter("degree"));
            user.setPhone(request.getParameter("phone"));
            user.setEmail(request.getParameter("email"));
            user.setWebSite(request.getParameter("webSite"));
            userService.updateUserInfo(user);
            userVO.setUser(user);
            userVO.setBirthday(user.getBirthday());
            session.removeAttribute("userVo");
            session.setAttribute("userVo",userVO);
            result = "/userPage/userInfo.jsp";
        } else{
            result = "/userPage/userInfo.jsp";
        }
        return result;
    }

    @RequestMapping(value = "/editPWD.do")
    @ResponseBody
    public boolean editPWD(@RequestParam(value = "currentPWD")String currentPWD,
                          @RequestParam(value = "password",required = false) String password,
                           @RequestParam(value = "update", required = false) String update,
                          HttpServletRequest request, HttpServletResponse response, HttpSession session){
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        if(update!=null && update.equals("1")){
            userService.updateUserPWD(userVO.getUser().getId(), password);
            try {
                response.sendRedirect("/Resume/user/userInfo.do");
            }catch (IOException e){
                System.out.print(e);
            }
            return true;
        }else if(userVO.getUser().getPassword().equals(currentPWD)){
            return true;
        }else {
            return false;
        }
    }

    private String getErrorMessage(HttpServletRequest request, String key) {
        Exception exception = (Exception) request.getSession().getAttribute(key);
        String error = "";
        if (exception instanceof BadCredentialsException) {
            error = "Invalid username and password or you have no permission!";
            } else if (exception instanceof LockedException) {
            error = "account locked!";
            } else if (exception instanceof UsernameNotFoundException) {
            error = "username not exist!";
            }else if (exception instanceof DisabledException) {
            error = "account disabled!";
            } else {
            error = "Invalid username and password!";
            }
         return error;
    }

}
