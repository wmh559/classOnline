package com.dao;

import com.model.Menu;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

/**
 * @author Atom
 * @date 2020/1/9
 * @time 22:25
 */
public interface MenuDao extends Mapper<Menu> {
    List<Menu> selectMenuByRoleType(Integer roleType);
}
