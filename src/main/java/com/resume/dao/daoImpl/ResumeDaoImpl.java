package com.resume.dao.daoImpl;

import com.resume.dao.ResumeDao;
import com.resume.entity.ResumeContext;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by chen9 on 2015/12/3.
 */
@Repository("resumeDao")
public class ResumeDaoImpl extends BaseDaoImpl implements ResumeDao{
    public ResumeContext getResumeByUserId(int id) {
        String mapper = "com.resume.mapping.resumeMapping.getResumeByUserId";
        return (ResumeContext) findOne(mapper, id);
    }

    public void saveResume(ResumeContext resumeContext) {
        String mapper = "com.resume.mapping.resumeMapping.insert";
        insert(mapper, resumeContext);
    }

    public void updateResumeWorkExp(@Param("workExp") String workExp, @Param("id") int id) {
        String mapper = "com.resume.mapping.resumeMapping.updateResumeWorkExp";
        Object object;

    }

    public void updateResumeEduExp(@Param("eduExp") String eduExp, @Param("id") int id) {

    }

    public void updateResumeReward(@Param("reward") String reward, @Param("id") int id) {

    }

    public void updateResumeCertificate(@Param("certificate") String certificate, @Param("id") int id) {

    }

    public void updateResumeIntroduction(@Param("introduction") String introduction, @Param("id") int id) {

    }

    public void updateResumeProjExp(@Param("projExp") String projExp, @Param("id") int id) {

    }

    public void updateResumeInSchoolActive(@Param("inSchoolActive") String inSchoolActive, @Param("id") int id) {

    }

    public void deleteResume(ResumeContext resumeContext) {
        String mapper="com.resume.mapping.resumeMapping.delete";
        delete(mapper,resumeContext);
    }
}
