package com.resume.dao;

import com.resume.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by chen9 on 2015/12/3.
 */
public interface UserDao{
    public User getUserById(@Param("id") int id);
    public User findUserByName(String name);
    public void addUser(User user);
    public void deleteUser(int id);
}
