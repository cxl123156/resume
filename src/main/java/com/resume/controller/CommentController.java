package com.resume.controller;

import com.resume.entity.Comment;
import com.resume.entity.Mail;
import com.resume.service.CommentService;
import com.resume.tool.SendMail;
import com.resume.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by chen on 2016/2/19.
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    public CommentService commentService;

    @RequestMapping(value = "/sendEmail.do")
    @ResponseBody
    private String sendEmail(@RequestParam(value = "massageUserName")String massageUserName,
                             @RequestParam(value = "message",required = false) String message,
                             @RequestParam(value = "contactMethod", required = false) String contactMethod,
                             HttpServletRequest request, HttpServletResponse response, HttpSession session){
        Mail mail = new Mail();
        mail.setHost("smtp.126.com"); // 设置邮件服务器,如果不用163的,自己找找看相关的
        mail.setSender("cxl123156@126.com");
        mail.setReceiver("chen9294@hotmail.com"); // 接收人
        mail.setUsername("cxl123156@126.com"); // 登录账号,一般都是和邮箱名一样吧
        mail.setPassword("52wow123156"); // 发件人邮箱的登录密码
        mail.setSubject("简历新留言");
        String messageText ="简历有新留言，内容如下："+message+"留言人："+massageUserName+"联系方式："+contactMethod;
        mail.setMessage(messageText);
        Comment comment = new Comment();
        Date date = new Date();
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        comment.setComment(message);
        comment.setCommentUserName(massageUserName);
        comment.setContactMethod(contactMethod);
        comment.setCreateTime(date);
        comment.setUserId(userVO.getUser().getId());
        commentService.saveComment(comment);
        try{
            new SendMail().send(mail);
            return "提交成功！";
        }
        catch (Exception e){
            return "提交失败，请重试！";
        }
    }
}
