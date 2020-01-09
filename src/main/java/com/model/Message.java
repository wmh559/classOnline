package com.model;

import java.util.Date;

/**
 * 用户发送信息实体类
 *
 * @author Atom
 * @date 2020/1/9
 * @time 9:05
 */
public class Message {
    public static final int MESSAGE_TYPE_TEXT = 1; //文本信息
    public static final int MESSAGE_TYPE_QUESTION = 2; //问题信息
    public static final int MESSAGE_TYPE_SIGN = 3; //签到信息

    private Integer sendId; //发送者id
    private Integer sendClass; //发送班级编号
    private String nickname; //发送者
    private Date sendDate; //发送日期
    private String messageTitle; //内容标题
    private String content; //内容
    private Integer messageType; //消息内容

    @Override
    public String toString() {
        return "Message{" +
                "sendId=" + sendId +
                ", sendClass=" + sendClass +
                ", nickname='" + nickname + '\'' +
                ", sendDate=" + sendDate +
                ", messageTitle='" + messageTitle + '\'' +
                ", content='" + content + '\'' +
                ", messageType=" + messageType +
                '}';
    }

    public Integer getSendId() {
        return sendId;
    }

    public void setSendId(Integer sendId) {
        this.sendId = sendId;
    }

    public Integer getSendClass() {
        return sendClass;
    }

    public void setSendClass(Integer sendClass) {
        this.sendClass = sendClass;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }

    public String getMessageTitle() {
        return messageTitle;
    }

    public void setMessageTitle(String messageTitle) {
        this.messageTitle = messageTitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getMessageType() {
        return messageType;
    }

    public void setMessageType(Integer messageType) {
        this.messageType = messageType;
    }
}
