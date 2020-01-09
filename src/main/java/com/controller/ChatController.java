package com.controller;

import com.alibaba.fastjson.JSON;
import com.annotation.LoginRequired;
import com.model.Message;
import com.model.ParticipantRepository;
import com.model.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

/**
 * @author Atom
 * @date 2020/1/8
 * @time 22:45
 */
@Controller
public class ChatController {
    private static final String SUBSCRIBE_MESSAGE_URI = "/topic/chat/message"; //订阅接收消息地址
    private static final String SUBSCRIBE_LOGIN_URI = "/topic/login"; //订阅登陆地址
    @Autowired
    private SimpMessagingTemplate messagingTemplate; //消息模板
    @Autowired
    private ParticipantRepository participantRepository; //在线用户列表

    @Autowired
    private UserService userService;


    /**
     * 进入课堂
     * @param classid
     * @return
     */
    @RequestMapping("/chat/{classid}")
    @LoginRequired
    public String toClass(@PathVariable("classid") String classid, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        user.setClassId(Integer.parseInt(classid)); //将当前的课堂id保存到会话的user实体类中
        request.setAttribute("user", user);  //覆盖当前用户
        //保存信息


        messagingTemplate.convertAndSend(SUBSCRIBE_LOGIN_URI,user); //发送登陆信息
        participantRepository.add(user); //将用户添加到在线列表
        return "chat";
    }

    /**
     * JSON
     * 根据班级id返回当前班级的在线列表
     */
    @SubscribeMapping("/chat/participants")
    public String getActiveUserList(Integer classid) {
        Map<Integer, User> userMap = participantRepository.getActiveClassSessions().get(classid);
        String jsonString = JSON.toJSONString(userMap);
        return jsonString;
    }


    /**
     * 接受并转发信息
     */
    @MessageMapping("/chat/message")
    @ResponseBody
    @LoginRequired
    public void receiveMessage(Message message) {
        if (message.getSendDate() == null) {
            message.setSendDate(new Date());
        }
        message.setMessageType(Message.MESSAGE_TYPE_TEXT);  // 文本信息 = 1
        System.out.println(message.toString());
        //保存聊天记录

        messagingTemplate.convertAndSend(SUBSCRIBE_MESSAGE_URI, message);
    }


}
