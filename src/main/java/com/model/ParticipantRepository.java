package com.model;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 存储在线用户仓库
 *
 * @author Atom
 * @date 2020/1/9
 * @time 9:39
 */
@Component
public class ParticipantRepository {
    private Map<Integer, Map<Integer, User>> activeClassSessions = new ConcurrentHashMap<>(); //key:班级id , value:班级在线成员

    /**
     * 新用户加入班级
     * @param user
     */
    public void add(User user) {
        if (user.getClassId()==null || user.getClassId().equals("")) {
            return; //非法用户进入课堂
        }
        Map<Integer, User> userMap = activeClassSessions.get(user.getClassId());
        if (userMap == null) {  //说明该用户是第一个进入该课堂
            userMap = new HashMap<>();
        }
        userMap.put(user.getId(), user);
        System.out.println("--> " + user.getNickname() + "进入了课堂.");
        activeClassSessions.put(user.getClassId(), userMap);
    }

    /**
     * 用户从班级离开
     * @param classId
     * @param userId
     * @return
     */
    public User remove(Integer classId,Integer userId) {
        return activeClassSessions.get(classId).remove(userId);
    }

    /**
     * 查询列表中是否存在用户
     * @param classId
     * @param userId
     * @return
     */
    public boolean containUser(Integer classId,Integer userId) {
        boolean containClass = this.activeClassSessions.containsKey(classId);
        if (!containClass) {
            return false;
        }
        return this.activeClassSessions.get(classId).containsKey(userId);
    }


    public void setActiveClassSessions(Map<Integer, Map<Integer, User>> activeClassSessions) {
        this.activeClassSessions = activeClassSessions;
    }

    public Map<Integer, Map<Integer, User>> getActiveClassSessions() {
        return activeClassSessions;
    }
}
