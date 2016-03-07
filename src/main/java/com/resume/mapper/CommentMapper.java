package com.resume.mapper;

import com.resume.entity.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * Created by chen on 2016/2/19.
 */
@Component("commentMapper")
public interface CommentMapper {
    public void saveComment(@Param("comm") Comment comm);
}
