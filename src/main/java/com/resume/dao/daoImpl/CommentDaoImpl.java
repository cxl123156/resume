package com.resume.dao.daoImpl;

import com.resume.dao.CommentDao;
import com.resume.entity.Comment;

/**
 * Created by chen on 2016/2/19.
 */
public class CommentDaoImpl extends BaseDaoImpl implements CommentDao{
    public void saveComment(Comment comment) {
        String mapper = "com.resume.mapping.commentMapping.insert";
        insert(mapper, comment);
    }
}
