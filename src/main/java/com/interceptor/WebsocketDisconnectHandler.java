package com.interceptor;

import com.model.ParticipantRepository;
import com.model.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import java.util.Map;

/**
 * websock断开连接处理
 *   --> 监听sessionDisconnectEvent事件，当有用户断开连接时发送信息通知其他用户
 * @author Atom
 * @date 2020/1/9
 * @time 9:33
 */
@Component
public class WebsocketDisconnectHandler implements ApplicationListener<SessionDisconnectEvent> {
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
    @Autowired
    private ParticipantRepository participantRepository;
    @Autowired
    private UserService userService;

    private final static String SUBSCRIBE_LOGOUT_URI = "/topic/logout";


    /**
     * 当在线用户map中的用户离开时，通知其他用户
     * @param sessionDisconnectEvent
     */
    @Override
    public void onApplicationEvent(SessionDisconnectEvent sessionDisconnectEvent) {
        Map<Integer, Map<Integer, User>> activeClassSessions = participantRepository.getActiveClassSessions();
        StompHeaderAccessor stompHeaderAccessor = StompHeaderAccessor.wrap(sessionDisconnectEvent.getMessage());
        Map<String, Object> sessionAttributes = stompHeaderAccessor.getSessionAttributes();
        User disconnectUser = (User) sessionAttributes.get("user");
        if (participantRepository.containUser(disconnectUser.getClassId(),disconnectUser.getId())) {
            User removeUser = participantRepository.remove(disconnectUser.getClassId(), disconnectUser.getId());
            disconnectUser.setClassId(null);
            sessionAttributes.put("user", disconnectUser);
            stompHeaderAccessor.setSessionAttributes(sessionAttributes);
            //记录日志


            //广播信息
            simpMessagingTemplate.convertAndSend(SUBSCRIBE_LOGOUT_URI,removeUser);
        }


    }
}
