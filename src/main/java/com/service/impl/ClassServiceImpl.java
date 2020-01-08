package com.service.impl;

import com.dao.ClassDao;
import com.dao.UserDao;
import com.model.Classroom;
import com.model.User;
import com.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author Atom
 * @date 2020/1/8
 * @time 8:43
 */
@Service
public class ClassServiceImpl implements ClassService {
    @Autowired
    ClassDao classDao;
    @Autowired
    UserDao userDao;
    /**
     * insert into tbs_classroom(createUID,name,picture,createTime) values(?,?,?,?);
     * @param classroom
     * @return
     */
    @Override
    public int addClass(Classroom classroom) {
        classroom.setCreateTime(new Date());
        return classDao.insertSelective(classroom);
    }

    /**
     * select * from tbs_classroom;
     * @return
     */
    @Override
    public List<Classroom> selectAll() {
        List<Classroom> classroomList = classDao.selectAll();
        for (Classroom classroom : classroomList) {
            int createUid = classroom.getCreateUid();
            User user = userDao.selectByPrimaryKey(createUid);
            classroom.setUser(user);
        }
        return classroomList;
    }

    /**
     * select * from tbs_classroom where createUid = ?;
     *
     * @param createUid
     * @return
     */
    @Override
    public List<Classroom> selectAll(Integer createUid) {
        Example example = new Example(Classroom.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("createUid", createUid);
        List<Classroom> classroomList = classDao.selectByExample(example);
        return classroomList;
    }

    @Override
    public void changeClass(Classroom classroom) {
        classDao.updateByPrimaryKeySelective(classroom);
    }

    @Override
    public void deleteClassById(Integer id) {
        classDao.deleteByPrimaryKey(id);
    }

    @Override
    public Classroom isExistClass(String classid) {
        return classDao.selectByPrimaryKey(classid);
    }

    @Override
    public void joinClass(Integer cid, Integer uid) {
        classDao.joinClass(cid, uid);
    }
}
