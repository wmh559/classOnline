package com.service;

import com.model.Classroom;

import java.util.List;

/**
 * @author Atom
 * @date 2020/1/8
 * @time 8:41
 */
public interface ClassService {
    int addClass(Classroom classroom);


    /**
     * 学生和管理员
     * @return
     */
    List<Classroom> selectAll();
    /**
     * 教师
     * @param id
     * @return
     */
    List<Classroom> selectAll(Integer id);

    void changeClass(Classroom classroom);

    void deleteClassById(Integer id);

    Classroom isExistClass(String classid);

    void joinClass(Integer cid, Integer uid);
}
