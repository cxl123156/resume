package com.resume.service.serviceImpl;

import com.resume.entity.ResumeContext;
import com.resume.mapper.ResumeMapper;
import com.resume.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by chen9 on 2015/12/3.
 */
@Service("resumeService")
public class ResumeServiceImlp implements ResumeService{

    ResumeMapper resumeMapper;

    @Autowired
    public void setResumeMapper(ResumeMapper resumeMapper) {
        this.resumeMapper = resumeMapper;
    }

    public ResumeContext getResumeByUserId(int userId) {
        return resumeMapper.getResumeByUserId(userId);
    }

    public void saveResume(ResumeContext resumeContext) {
        resumeMapper.saveResume(resumeContext);
    }

    public void updateResumeWorkExp(String workExp, int id) {
        resumeMapper.updateResumeWorkExp(id,workExp);
    }

    public void updateResumeEduExp(String eduExp, int id) {
        resumeMapper.updateResumeEduExp(id,eduExp);
    }

    public void updateResumeReward(String reward, int id) {
        resumeMapper.updateResumeReward(id,reward);
    }

    public void updateResumeCertificate(int id, String certificate) {
        resumeMapper.updateResumeCertificate(id,certificate);
    }

    public void updateResumeIntroduction(int id, String introduction) {
        resumeMapper.updateResumeIntroduction(id,introduction);
    }

    public void updateResumeProjExp(int id, String projExp) {
        resumeMapper.updateResumeProjExp(id,projExp);
    }

    public void updateResumeInSchoolActive(int id, String inSchoolActive) {
        resumeMapper.updateResumeInSchoolActive(id,inSchoolActive);
    }

    public void updateResumeName(int id, String resumeName) {
        resumeMapper.updateResumeName(id,resumeName);
    }

    public void deleteResume(ResumeContext resumeContext) {
        resumeMapper.deleteResume(resumeContext.getId());
    }

    public void updateResumePhoto(int id, String photo) {
        resumeMapper.updateResumePhoto(id,photo);
    }

    public void updateResumeSkill(int id, String skill) {
        resumeMapper.updateResumeSkills(id, skill);
    }

    public void updateResumeForeignLanguage(int id, String foreignLanguage) {
        resumeMapper.updateResumeForeignLanguage(id,foreignLanguage);
    }

    public void updateResumeSourcePhoto(int id, String sourcePhoto) {
        resumeMapper.updateResumeSourcePhoto(id,sourcePhoto);
    }
}
