package com.dao;

import com.model.Classroom;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

/**
 * @author Atom
 * @date 2020/1/8
 * @time 8:43
 */
public interface ClassDao extends Mapper<Classroom> {
    void joinClass(@Param("cid") Integer cid,@Param("uid") Integer uid);
}
