package com.resume.vo;

import com.resume.entity.ResumeContext;
import com.resume.tool.TextHandle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by chen9 on 2015/12/17.
 */
public class ResumeContextVO {
    private ResumeContext resumeContext;
    private List workExpList;
    private List eduExpList;
    private List projExpList;
    private List rewardList;
    private List foreignLanguageList;
    private List certificateList;
    private List inSchoolActiveList;
    private List skillList;
    TextHandle textHandle = new TextHandle();

    public ResumeContextVO(ResumeContext resumeContext) {
        this.resumeContext = resumeContext;
        this.setWorkExpList(resumeContext.getWorkExp());
        this.setEduExpList(resumeContext.getEduExp());
        this.setCertificateList(resumeContext.getCertificates());
        this.setForeignLanguageList(resumeContext.getForeignLanguage());
        this.setProjExpList(resumeContext.getProjExp());
        this.setInSchoolActiveList(resumeContext.getInSchoolActive());
        this.setRewardList(resumeContext.getReward());
        this.setSkillList(resumeContext.getSkills());
    }

    public ResumeContextVO(String eduExp) {
        setEduExpList(eduExp);
        this.eduExpList = getEduExpList();
    }

    public ResumeContext getResumeContext() {
        return resumeContext;
    }

    public void setResumeContext(ResumeContext resumeContext) {
        this.resumeContext = resumeContext;
    }

    public List getWorkExpList() {
        return workExpList;
    }

    public void setWorkExpList(String workExp) {
        List<Map> workExpList = new ArrayList<Map>();
        if(null != workExp  && !workExp.equals("")) {
            String[] param = workExp.split(";");
            for(String str:param){
                if (null!=str&&!"".equals(str)) {
                    workExpList.add(textHandle.getRepramas(str));
                }
            }
        }else {
            this.workExpList = null;
        }
        this.workExpList = workExpList;
    }

    public List getEduExpList() {
        return eduExpList;
    }

    public void setEduExpList(String eduExp) {
        List<Map> eduExpList = new ArrayList<Map>();
        if(eduExp!=null && !eduExp.equals("")) {
            String[] param = eduExp.split(";");
            for(String str:param){
                if (null!=str&&!"".equals(str)) {
                    eduExpList.add(textHandle.getRepramas(str));
                }
            }
        }else {
            this.eduExpList = null;
        }
        this.eduExpList = eduExpList;
    }

    public List getProjExpList() {
        return projExpList;
    }

    public void setProjExpList(String projExp) {
        List<Map> projExpList = new ArrayList<Map>();
        if(projExp!=null && !projExp.equals("")) {
            String[] param = projExp.split(";");
            for(String str:param){
                if (null!=str&&!"".equals(str)) {
                    projExpList.add(textHandle.getRepramas(str));
                }
            }
        }else {
            this.projExpList = null;
        }
        this.projExpList = projExpList;
    }

    public List getRewardList() {
        return rewardList;
    }

    public void setRewardList(String reward) {
        List<Map> rewardList = new ArrayList<Map>();
        if(reward!=null && !reward.equals("")) {
            String[] param = reward.split(";");
            for(String str:param){
                if (null!=str&&!"".equals(str)) {
                    rewardList.add(textHandle.getRepramas(str));
                }
            }
        }else {
            this.rewardList = null;
        }
        this.rewardList = rewardList;
    }

    public List getCertificateList() {
        return certificateList;
    }

    public void setCertificateList(String certificates) {
        List<Map> certificateList = new ArrayList<Map>();
        if(certificates!=null && !certificates.equals("")) {
            String[] param = certificates.split(";");
            for(String str:param){
                if (null!=str&&!"".equals(str)) {
                    certificateList.add(textHandle.getRepramas(str));
                }
            }
        }else {
            this.certificateList = null;
        }
        this.certificateList = certificateList;
    }

    public List getInSchoolActiveList() {
        return inSchoolActiveList;
    }

    public void setInSchoolActiveList(String inSchoolActive) {
        List<Map> inSchoolActiveList = new ArrayList<Map>();
        if(inSchoolActive!=null && !inSchoolActive.equals("")) {
            String[] param = inSchoolActive.split(";");
            for(String str:param){
                if (null!=str&&!"".equals(str)) {
                    inSchoolActiveList.add(textHandle.getRepramas(str));
                }
            }
        }else {
            this.inSchoolActiveList = null;
        }
        this.inSchoolActiveList = inSchoolActiveList;
    }

    public List getSkillList() {
        return skillList;
    }

    public void setSkillList(String skills) {
        List<Map> skillList = new ArrayList<Map>();
        if(skills!=null && !skills.equals("")) {
            String[] param = skills.split(";");
            for(String str:param){
                if (null!=str&&!"".equals(str)) {
                    skillList.add(textHandle.getRepramas(str));
                }
            }
        }else {
            this.skillList = null;
        }
        this.skillList = skillList;
    }

    public List getForeignLanguageList() {
        return foreignLanguageList;
    }

    public void setForeignLanguageList(String foreignLanguage) {
        List<Map> foreignLanguageList = new ArrayList<Map>();
        if(foreignLanguage!=null && !foreignLanguage.equals("")) {
            String[] param = foreignLanguage.split(";");
            for(String str:param){
                if (null!=str&&!"".equals(str)) {
                    foreignLanguageList.add(textHandle.getRepramas(str));
                }
            }
        }else {
            this.foreignLanguageList = null;
        }
        this.foreignLanguageList = foreignLanguageList;
    }
}
