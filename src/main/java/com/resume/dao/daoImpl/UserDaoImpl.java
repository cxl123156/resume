package com.resume.dao.daoImpl;

import com.resume.entity.User;
import org.springframework.stereotype.Repository;


/**
 * Created by chen9 on 2015/11/17.
 */
@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl {

    public User findUserById(int id){
        String mapper = "com.resume.mapping.userMapping.getUserById";
        return (User)findOne(mapper, id);
    }

    public User findUserByName(String name){
        String mapper = "com.resume.mapping.userMapping.getUserByName";
        return  (User)findOne(mapper, name);
    }

    public void addUser(User user){
        String mapper = "com.resume.mapping.userMapping.insert";
        insert(mapper, user);
    }

    public void deleteUser(int id) {
        String mapper = "com.resume.mapping.userMapping.delete";
        delete(mapper, id);
    }

}
