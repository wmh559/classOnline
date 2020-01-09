package com.model;

import java.util.Date;

/**
 * @author Atom
 * @date 2020/1/9
 * @time 9:09
 */
public class MessageRecordDo {

    private Integer id;
    private Integer userId;
    private String userName;
    private String MessageTitle;
    private String content;
    private Integer messageType;
    private Date createTime;

    public MessageRecordDo() {
    }

    public static MessageRecordDo messageRecordBuilder() {
        return new MessageRecordBuilder();
    }

    private static class MessageRecordBuilder extends MessageRecordDo {
        private Integer id;
        private Integer userId;
        private String userName;
        private String messageTitle;
        private String content;
        private Integer messageType;
        private Date createTime;

        public MessageRecordBuilder id(Integer id) {
            this.id = id;
            return this;
        }

        public MessageRecordBuilder userId(Integer userId) {
            this.userId = userId;
            return this;
        }

        public MessageRecordBuilder userName(String userName) {
            this.userName = userName;
            return this;
        }

        public MessageRecordBuilder messageTitle(String messageTitle) {
            this.messageTitle = messageTitle;
            return this;
        }

        public MessageRecordBuilder content(String content) {
            this.content = content;
            return this;
        }

        public MessageRecordBuilder messageType(Integer messageType) {
            this.messageType = messageType;
            return this;
        }

        public MessageRecordBuilder createTime(Date createTime) {
            this.createTime = createTime;
            return this;
        }

        public MessageRecordDo build() {
            return new MessageRecordDo(id, userId, userName, messageTitle, content, messageType, createTime);
        }
    }

    public MessageRecordDo(Integer id, Integer userId, String userName, String messageTitle, String content, Integer messageType, Date createTime) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        MessageTitle = messageTitle;
        this.content = content;
        this.messageType = messageType;
        this.createTime = createTime;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMessageTitle() {
        return MessageTitle;
    }

    public void setMessageTitle(String messageTitle) {
        MessageTitle = messageTitle;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
