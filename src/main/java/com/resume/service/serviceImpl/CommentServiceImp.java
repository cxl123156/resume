package com.resume.service.serviceImpl;

import com.resume.entity.Comment;
import com.resume.mapper.CommentMapper;
import com.resume.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImp implements CommentService {
    CommentMapper commentMapper;

    @Autowired
    public void setCommentMapper(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }

    public void saveComment(Comment comment) {
        commentMapper.saveComment(comment);
    }
}