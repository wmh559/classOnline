package com.model;

import java.io.Serializable;

/**
 * 反馈前端ajax注册实体类
 * @author Atom
 * @date 2020/1/6
 * @time 15:18
 */
public class ReplyRegistMessage implements Serializable {
    public static final int USER_NAME_EXIST = 1; //用户名已存在
    private boolean successed; //注册是否成功
    private int status; //当前注册状态

    public ReplyRegistMessage(boolean successed) {
        this.successed = successed;
    }

    public ReplyRegistMessage(boolean successed, int status) {
        this.successed = successed;
        this.status = status;
    }

    public boolean isSuccessed() {
        return successed;
    }

    public void setSuccessed(boolean successed) {
        this.successed = successed;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
