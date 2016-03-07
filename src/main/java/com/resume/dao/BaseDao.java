package com.resume.dao;

import java.util.List;

/**
 * Created by chen9 on 2015/12/3.
 */
public interface BaseDao {
    public boolean insert(String mapper, Object obj);
    public Object findOne(String mapper, Object obj);
    public List<Object> findToList(String mapper, Object obj);
    public boolean delete(String mapper, Object obj);
    public boolean update(String mapper, Object obj);
}
