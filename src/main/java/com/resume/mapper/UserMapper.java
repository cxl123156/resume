package com.resume.mapper;

import com.resume.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by chen9 on 2015/12/3.
 */
@Component("userMapper")
public interface UserMapper {
    public User getUserById(@Param("id") int id);
    public User getUserByName(@Param("username") String username);
    public int  insertAndGetId(@Param("user") User user);
    public void deleteUserById(@Param("id") int id);
    public void updateUserInfo(@Param("id") int id, @Param("email") String email, @Param("age") int age, @Param("birthday") Date birthday,
                               @Param("nativePlace") String nativePlace, @Param("phone") String phone, @Param("webSite") String webSite, @Param("realName") String realName,
                               @Param("college") String college, @Param("major") String major, @Param("degree") String degree);
    public void updateUserPWD(@Param("password") String password, @Param("id") int id);
}
