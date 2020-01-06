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
    private int create_uid;
    private String name;
    private String picture;
    private Date create_time;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCreate_uid() {
        return create_uid;
    }

    public void setCreate_uid(int create_uid) {
        this.create_uid = create_uid;
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

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}
