package com.resume.vo;

import com.resume.entity.User;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

/**
 * Created by chen9 on 2015/12/11.
 */
public class UserVO {
    private User user;
    private Collection role;
    private String birthday;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Collection getRole() {
        return role;
    }

    public void setRole(Collection role) {
        this.role = role;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        this.birthday = sdf.format(birthday);
    }
}
