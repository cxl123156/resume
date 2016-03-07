package com.resume.controller;

import com.resume.entity.ResumeContext;
import com.resume.service.ResumeService;
import com.resume.service.UserService;
import com.resume.tool.FileTool;
import com.resume.vo.ResumeContextVO;
import com.resume.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;

/**
 * Created by chen9 on 2015/12/4.
 */
@Controller
@RequestMapping("/resumeContext")
public class ResumeController {
    ResumeService resumeService;
    UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Autowired
    public void setResumeService(ResumeService resumeService) {
        this.resumeService = resumeService;
    }
    @RequestMapping("/newResume")
    public ModelAndView newResume(HttpServletRequest request , HttpServletResponse response){
        String reusmeName = request.getParameter("resumeName");
        ResumeContext resumeContext = new ResumeContext();
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        resumeContext.setUserId(userService.findUserByName(((UserDetails) principal).getUsername()).getId());
        resumeContext.setResumeName(reusmeName);
        resumeService.saveResume(resumeContext);
        ModelAndView mv =new ModelAndView();
        mv.addObject("username",((UserDetails) principal).getUsername());
        mv.addObject("role", ((UserDetails) principal).getAuthorities());
        mv.setViewName("/index.jsp");
        return mv;
    }
    @RequestMapping("/updateResumeWorkExp.do")
    public void updateResumeWorkExp(HttpServletRequest request , HttpServletResponse response){
        String workExp = request.getParameter("workExp");
        ResumeContext resumeContext;
    }
//    public void updateResumeEduExp(String eduExp,int id);
//    public void updateResumeReward(String reward,int id);
//    public void updateResumeCertificate(int id, String certificate);
//    public void updateResumeIntroduction(int id,String introduction);
//    public void updateResumeProjExp(int id,String projExp);
//    public void updateResumeInSchoolActive(int id,String inSchoolActive);
//    public void deleteResume(ResumeContext resumeContext);
    @RequestMapping("/updateResume.do")
    public String updateResume(@RequestParam(value = "action",required = false) String action,
                             HttpServletRequest request,HttpSession session){
        String result;
        if(action!=null && action.equals("Introduction")){
            result = "/resume/editPersonalInfo.jsp";
        }else if(action!=null && action.equals("EduExp")){
            result = "/resume/editEduExp.jsp";
        }
        else if(action!=null && action.equals("WorkExp")){
            result = "/resume/editWorkExp.jsp";
        }
        else if(action!=null && action.equals("ProjExp")){
            result = "/resume/editProjExp.jsp";
        }
        else if(action!=null && action.equals("Reward")){
            result = "/resume/editReward.jsp";
        }
        else if(action!=null && action.equals("Certification")){
            result = "/resume/editCertification.jsp";
        }
        else if(action!=null && action.equals("ForeignLanguage")){
            result = "/resume/editForeignLanguage.jsp";
        }
        else if(action!=null && action.equals("Skills")){
            result = "/resume/editSkills.jsp";
        }
        else if(action!=null && action.equals("InSchoolActive")){
            result = "/resume/editInSchoolActive.jsp";
        }
        else{
            result = "/resume/editResume.jsp";
        }
        return result;
    }

    @RequestMapping("/saveResume.do")
    public String saveResume(@RequestParam(value = "action",required = false) String action,HttpServletRequest request,HttpSession session){
        ResumeContextVO resumeContextVO = (ResumeContextVO) session.getAttribute("resumeContextVO");
        String result = "";
        if(action!=null && action.equals("saveEduExp")){
            String data = request.getParameter("param");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            System.out.println(data);
            resumeService.updateResumeEduExp(data, resumeContextVO.getResumeContext().getId());
            resumeContextVO.setEduExpList(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result="/resume/result/editEduExpResult.jsp";
        }else if(action!=null && action.equals("saveWorkExp")){
            String data = request.getParameter("param");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            System.out.println(data);
            resumeService.updateResumeWorkExp(data, resumeContextVO.getResumeContext().getId());
            resumeContextVO.setWorkExpList(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result="/resume/result/editWorkExpResult.jsp";
        }else if (action!=null && action.equals("saveProjExp")){
            String data = request.getParameter("param");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            resumeService.updateResumeProjExp(resumeContextVO.getResumeContext().getId(), data);
            resumeContextVO.setProjExpList(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result="/resume/result/editProjExpResult.jsp";
        }else if(action!=null && action.equals("saveReward")){
            String data = request.getParameter("param");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            resumeService.updateResumeReward(data, resumeContextVO.getResumeContext().getId());
            resumeContextVO.setRewardList(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result="/resume/result/editRewardResult.jsp";
        }else if(action!=null && action.equals("saveCertificate")) {
            String data = request.getParameter("param");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            resumeService.updateResumeCertificate(resumeContextVO.getResumeContext().getId(), data);
            resumeContextVO.setCertificateList(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result="/resume/result/editCertificationResult.jsp";
        }else if(action!=null && action.equals("saveForeignLanguage")) {
            String data = request.getParameter("param");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            resumeService.updateResumeForeignLanguage(resumeContextVO.getResumeContext().getId(), data);
            resumeContextVO.setForeignLanguageList(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result="/resume/result/editForeignLanguageResult.jsp";
        }else if(action!=null && action.equals("saveSkills")){
            String data = request.getParameter("param");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            resumeService.updateResumeSkill(resumeContextVO.getResumeContext().getId(), data);
            resumeContextVO.setSkillList(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result="/resume/result/editSkillsResult.jsp";
        }else if(action!=null && action.equals("saveInSchoolActive")){
            String data = request.getParameter("param");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            resumeService.updateResumeInSchoolActive(resumeContextVO.getResumeContext().getId(), data);
            resumeContextVO.setInSchoolActiveList(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result="/resume/result/editInSchoolActiveResult.jsp";
        }else if(action!=null && action.equals("introduction")){
            String data = request.getParameter("introduction");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            resumeService.updateResumeIntroduction(resumeContextVO.getResumeContext().getId(), data);
            resumeContextVO.getResumeContext().setIntroduction(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result = "/resume/result/editPersonalInfoResult.jsp";
        } else if (action != null && action.equals("resumeName")) {
            String data = request.getParameter("resumeName");
            try {
                data = URLDecoder.decode(data,"UTF-8");
            }catch (Exception e){
                System.out.println(e);
            }
            resumeService.updateResumeName(resumeContextVO.getResumeContext().getId(), data);
            resumeContextVO.getResumeContext().setResumeName(data);
            session.setAttribute("resumeContextVO", resumeContextVO);
            result = "/resume/result/editResumeNameResult.jsp";
        }
        return result;
    }

    @RequestMapping("/uploadPic.do")
    public String uploadPic(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,HttpSession session, ModelMap model){
        String originFile = file.getOriginalFilename();
        String fileType = originFile.substring(originFile.indexOf("."),originFile.length());
        if(fileType.equals(".jpg")){
            FileTool fileTool = new FileTool();
            UserVO userVO = (UserVO) session.getAttribute("userVO");
            ResumeContextVO resumeContextVO = (ResumeContextVO) session.getAttribute("resumeContextVO");
            String folder = "/upload/"+userVO.getUser().getUsername()+"/";
            String fileName = fileTool.upload(file, request, userVO.getUser());
            String filePath = folder+fileName;
            resumeService.updateResumeSourcePhoto(resumeContextVO.getResumeContext().getId(), filePath);
            model.addAttribute("fileUrl",filePath);
        }else {
            String error ="false";
            model.addAttribute("fileUrl",error);
        }

        return "/resume/cropPic.jsp";
    }

    @RequestMapping("/cutPic.do")
    public String cutPic(HttpServletRequest request,HttpSession session){
        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String width = request.getParameter("width");
        String height = request.getParameter("height");
        String sourceFile = request.getParameter("sourceFile");
        String realPath = request.getServletContext().getRealPath("/");
        String cropPhoto = "";
        UserVO userVO = (UserVO) session.getAttribute("userVO");
        ResumeContextVO resumeContextVO = (ResumeContextVO) session.getAttribute("resumeContextVO");
        FileTool fileTool = new FileTool();
        try {
            cropPhoto = fileTool.cutPic(sourceFile,realPath,Integer.parseInt(x),Integer.parseInt(y),Integer.parseInt(width),Integer.parseInt(height),userVO.getUser());
        }catch (Exception e){
            System.out.println(e);
        }
        String folder = "/upload/"+userVO.getUser().getUsername()+"/";
        String filePath = folder+cropPhoto;
        resumeService.updateResumePhoto(resumeContextVO.getResumeContext().getId(), filePath);
        resumeContextVO.getResumeContext().setPhoto(filePath);
        session.setAttribute("resumeContextVO", resumeContextVO);
        return "/resume/result/uploadPhotoResult.jsp";
    }

//    @RequestMapping("/saveResume.do")
//    public String saveResume(HttpServletRequest request , HttpSession session){
//        UserVO userVO = (UserVO) session.getAttribute("userVO");
//        ResumeContext resumeContext = new ResumeContext();
//        resumeContext.setUserId(userVO.getUser().getId());
//        resumeContext.setResumeName(request.getParameter("resumeName"));
//        resumeService.saveResume(resumeContext);
//        return "saveResume";
//    }
}
