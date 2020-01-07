package com.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 实体类: 班级
 *
 * @author Atom
 * @date 2020/1/6
 * @time 15:07
 */
public class Classroom implements Serializable {
    private int id;
    private int createUid;
    private String name;
    private String picture;
    private Date createTime;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCreateUid() {
        return createUid;
    }

    public void setCreateUid(int createUid) {
        this.createUid = createUid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
