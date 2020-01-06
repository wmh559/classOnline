package com.model;

import java.io.Serializable;

/**
 * 返回前端ajax登陆信息实体
 *
 * @author Atom
 * @date 2020/1/6
 * @time 15:10
 */
public class ReplyLoginMessage implements Serializable {
    public static final Integer USER_NAME_NOT_EXIST = 1;  //当前登录用户名未注册
    public static final Integer USER_PASSWORD_WRONG = 2;  //当前登录用户密码错误
    public static final Integer USER_NAME_OR_PASSWORD_NULL = 3;  //当前登录用户名或密码为空

    private boolean successed; //当前登录是否成功
    private int status; //当前登录状态

    public ReplyLoginMessage(boolean successed) {
        this.successed = successed;
    }

    public ReplyLoginMessage(boolean successed, int status) {
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
