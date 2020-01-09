package com.service.impl;

import com.alibaba.fastjson.JSON;
import com.dao.MenuDao;
import com.dao.UserDao;
import com.model.Menu;
import com.model.User;
import com.service.UserService;
import com.utils.MenuBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * @author Atom
 * @date 2020/1/7
 * @time 16:05
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Autowired
    MenuDao menuDao;

    /**
     * select * from user where id = ?
     * @param user
     * @return
     */
    @Override
    public boolean isExistUser(User user) {
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("username", user.getUsername());
        User res = userDao.selectOneByExample(example);
        if (res == null) {
            return false;
        }
        return true;
    }

    /**
     * select * from user where username = ? and password = ?;
     *
     * select * from
     * @param username
     * @param password
     * @return
     */
    @Override
    public User validateUser(String username, String password) {
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("username", username);
        criteria.andEqualTo("password", password);
        User user = userDao.selectOneByExample(example);

        if (user != null) {
            Integer roleType = user.getRoleType();
            if (roleType == null) {
                roleType = 1;  //学生权限
            }
            List<Menu> menuList = menuDao.selectMenuByRoleType(user.getRoleType());
            user.setMenuList(menuList);
        }

        return user;
    }

    @Override
    public void changePassword(User user) {
        userDao.updateByPrimaryKeySelective(user);

    }

    /**
     * select * from user where roleType < 3;
     * @return
     */
    @Override
    public List<User> selectAll() {
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andLessThan("roleType", 3);
        return userDao.selectByExample(example);
    }

    /**
     * update user set password = ?,nickname = ?,profilePhoto = ?,sex= ? where id = ?;
     * @param user
     * @return
     */
    @Override
    public int changeUser(User user) {
        int influenceCount = userDao.updateByPrimaryKeySelective(user);
        return influenceCount;
    }

    @Override
    public int deleteUser(int id){
        int i=userDao.deleteByPrimaryKey(id);
        return i;
    }
}
