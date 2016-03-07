package com.resume.service.serviceImpl;

import com.resume.entity.User;
import com.resume.mapper.UserMapper;
import com.resume.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by chen9 on 2015/11/17.
 */
@Service("userService")
public class UserServiceImpl implements UserService{
    UserMapper userMapper;
    @Autowired
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User findUserById(int id){
        return userMapper.getUserById(id);
    }

    public User findUserByName(String name){
        return  userMapper.getUserByName(name);
    }

    public int addUser(User user){
        return userMapper.insertAndGetId(user);
    }

    public void deleteUser(int id) {
        userMapper.deleteUserById(id);
    }

    public void updateUserInfo(User user) {
        userMapper.updateUserInfo(user.getId(),user.getEmail(),user.getAge(),user.getBirthday(),
                user.getNativePlace(),user.getPhone(),user.getWebSite(),user.getRealName(),user.getCollege(),user.getMajor(),user.getDegree());
    }

    public void updateUserPWD(int id, String password) {
        userMapper.updateUserPWD(password,id);
    }
}
