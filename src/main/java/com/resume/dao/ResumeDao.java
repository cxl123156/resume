package com.resume.dao;

import com.resume.entity.ResumeContext;
import org.apache.ibatis.annotations.Param;

/**
 * Created by chen9 on 2015/12/3.
 */
public interface ResumeDao extends BaseDao {
    public ResumeContext getResumeByUserId(int id);
    public void saveResume(ResumeContext resumeContext);
    public void updateResumeWorkExp(@Param("workExp") String workExp, @Param("id") int id);
    public void updateResumeEduExp(@Param("eduExp") String eduExp, @Param("id") int id);
    public void updateResumeReward(@Param("reward") String reward, @Param("id") int id);
    public void updateResumeCertificate(@Param("certificate") String certificate, @Param("id") int id);
    public void updateResumeIntroduction(@Param("introduction") String introduction, @Param("id") int id);
    public void updateResumeProjExp(@Param("projExp") String projExp, @Param("id") int id);
    public void updateResumeInSchoolActive(@Param("inSchoolActive") String inSchoolActive, @Param("id") int id);
    public void deleteResume(ResumeContext resumeContext);
}
