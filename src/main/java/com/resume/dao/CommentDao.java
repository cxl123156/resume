package com.resume.dao;

import com.resume.entity.Comment;

/**
 * Created by chen on 2016/2/19.
 */
public interface CommentDao extends BaseDao {
    public void saveComment(Comment comment);
}
