package com.resume.service;

import com.resume.entity.User;

/**
 * Created by chen9 on 2015/11/17.
 */

public interface UserService {
    public User findUserById(int id);
    public User findUserByName(String name);
    public int addUser(User user);
    public void deleteUser(int id);
    public void updateUserInfo(User user);
    public void updateUserPWD(int id, String password);
}
