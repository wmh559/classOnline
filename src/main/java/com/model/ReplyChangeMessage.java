package com.model;

/**
 * 返回前端ajax更改个人信息实体
 *
 * @author Atom
 * @date 2020/1/8
 * @time 0:04
 */
public class ReplyChangeMessage {
    public static final int CHANGE_ERROR = 1; //输入密码无效

    private boolean successed;
    private int status;

    public ReplyChangeMessage(boolean successed) {
        this.successed = successed;
    }

    public ReplyChangeMessage(boolean successed, int status) {
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
