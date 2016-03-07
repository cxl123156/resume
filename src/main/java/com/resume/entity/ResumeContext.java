package com.resume.entity;

/**
 * Created by chen9 on 2015/11/17.
 * @variable workExp
 * @variable eduExp
 * @variable reward
 * @variable certificate
 * @variable introduction
 * @variable projExp
 * @variable inSchoolActive
 */
public class ResumeContext {
    private int id;
    private int userId;
    private String workExp;
    private String eduExp;
    private String reward;
    private String certificates;
    private String introduction;
    private String projExp;
    private String inSchoolActive;
    private String sourcePhoto;
    private String photo;
    private String resumeName;
    private String skills;
    private String foreignLanguage;

    public String getForeignLanguage() {
        return foreignLanguage;
    }

    public void setForeignLanguage(String foreignLanguage) {
        this.foreignLanguage = foreignLanguage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getWorkExp() {
        return workExp;
    }

    public void setWorkExp(String workExp) {
        this.workExp = workExp;
    }

    public String getEduExp() {
        return eduExp;
    }

    public void setEduExp(String eduExp) {
        this.eduExp = eduExp;
    }

    public String getReward() {
        return reward;
    }

    public void setReward(String reward) {
        this.reward = reward;
    }

    public String getCertificates() {
        return certificates;
    }

    public void setCertificates(String certificates) {
        this.certificates = certificates;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getProjExp() {
        return projExp;
    }

    public void setProjExp(String projExp) {
        this.projExp = projExp;
    }

    public String getInSchoolActive() {
        return inSchoolActive;
    }

    public void setInSchoolActive(String inSchoolActive) {
        this.inSchoolActive = inSchoolActive;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getResumeName() {
        return resumeName;
    }

    public void setResumeName(String resumeName) {
        this.resumeName = resumeName;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getSourcePhoto() {
        return sourcePhoto;
    }

    public void setSourcePhoto(String sourcePhoto) {
        this.sourcePhoto = sourcePhoto;
    }
}
