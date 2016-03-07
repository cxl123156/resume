package com.resume.mapper;

import com.resume.entity.ResumeContext;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * Created by chen9 on 2015/12/3.
 */
@Component("resumeMapper")
public interface ResumeMapper {
    public ResumeContext getResumeByUserId(@Param("id") int id);
    public void saveResume(@Param("resumeContext") ResumeContext resumeContext);
    public void deleteResume(@Param("id") int id);
    public void updateResumeWorkExp(@Param("id") int id, @Param("workExp") String workExp);
    public void updateResumeEduExp(@Param("id") int id, @Param("eduExp") String eduExp);
    public void updateResumeReward(@Param("id") int id, @Param("reward") String reward);
    public void updateResumeCertificate(@Param("id") int id, @Param("certificate") String certificate);
    public void updateResumeIntroduction(@Param("id") int id, @Param("introduction") String introduction);
    public void updateResumeProjExp(@Param("id") int id, @Param("projExp") String projExp);
    public void updateResumeInSchoolActive(@Param("id") int id, @Param("inSchoolActive") String inSchoolActive);
    public void updateResumeName(@Param("id") int id, @Param("resumeName") String resumeName);
    public void updateResumePhoto(@Param("id") int id, @Param("photo") String photo);
    public void updateResumeSourcePhoto(@Param("id") int id, @Param("sourcePhoto") String sourcePhoto);
    public void updateResumeSkills(@Param("id") int id, @Param("skills") String skills);
    public void updateResumeForeignLanguage(@Param("id") int id, @Param("foreignLanguage") String foreignLanguage);
}
