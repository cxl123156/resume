package com.resume.dao.daoImpl;

import com.resume.dao.BaseDao;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by chen9 on 2015/11/18.
 */
public class BaseDaoImpl implements BaseDao{
    private SqlSessionFactory sqlSessionFactory;
    private SqlSession sqlSession;
    public SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }
    @Autowired
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
    private SqlSession getSqlSession(){
        //  sqlSession=sqlSession==null?
        //    sqlSessionFactory.openSession(ExecutorType.BATCH, isAuto):sqlSession;  ִ�к����Ҫcommit
        sqlSession=sqlSession==null? sqlSessionFactory.openSession(true):sqlSession;
        return sqlSession;
    }

    public boolean insert(String mapper,Object obj){
        try{
            getSqlSession().insert(mapper, obj);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    public Object findOne(String mapper,Object obj){
        Object o = getSqlSession().selectOne(mapper,obj);
        return o ;
    }

    public List<Object> findToList(String mapper,Object obj){
        List<Object> list = getSqlSession().selectList(mapper, obj);
        return list;
    }

    public boolean delete(String mapper , Object obj){
        try{
            getSqlSession().delete(mapper,obj);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    public boolean update(String mapper,Object obj){
        try {
            getSqlSession().update(mapper,obj);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
