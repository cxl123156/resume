package com.resume.service;

import com.resume.entity.ResumeContext;

/**
 * Created by chen9 on 2015/12/3.
 */
public interface ResumeService {
    public ResumeContext getResumeByUserId(int userId);
    public void saveResume(ResumeContext resumeContext);
    public void updateResumeWorkExp(String workExp, int id);
    public void updateResumeEduExp(String eduExp, int id);
    public void updateResumeReward(String reward, int id);
    public void updateResumeCertificate(int id, String certificate);
    public void updateResumeIntroduction(int id, String introduction);
    public void updateResumeProjExp(int id, String projExp);
    public void updateResumeInSchoolActive(int id, String inSchoolActive);
    public void updateResumeName(int id, String resumeName);
    public void updateResumePhoto(int id, String photo);
    public void updateResumeSourcePhoto(int id, String sourcePhoto);
    public void updateResumeSkill(int id, String skill);
    public void deleteResume(ResumeContext resumeContext);
    public void updateResumeForeignLanguage(int id, String foreignLanguage);
}
