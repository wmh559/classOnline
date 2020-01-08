package com.model;

import java.io.Serializable;

/**
 * 返回前端ajax更改个人信息实体
 *
 * @author Atom
 * @date 2020/1/8
 * @time 0:04
 */
public class ReplyClassMessage implements Serializable {
    public static final int CLASS_CREATED_ERROR = 1; //创建班级失败
    public static final int CLASS_DELETED_ERROR = 2; //删除班级失败

    private boolean successed;
    private int status;

    public ReplyClassMessage(boolean successed) {
        this.successed = successed;
    }

    public ReplyClassMessage(boolean successed, int status) {
        this.successed = successed;
        this.status = status;
    }

    public boolean isSuccessed() {
        return successed;
    }

    public int getStatus() {
        return status;
    }
}
