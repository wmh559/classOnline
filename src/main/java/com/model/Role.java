package com.model;

import java.io.Serializable;

/**
 * 实体类：角色
 *
 * @author Atom
 * @date 2020/1/6
 * @time 15:09
 */
public class Role implements Serializable {
    private int id;
    private String roleName;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
