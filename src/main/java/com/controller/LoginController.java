package com.controller;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.core.io.JsonStringEncoder;
import com.model.ReplyLoginMessage;
import com.model.User;
import com.service.UserService;
import com.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * 登录与注册
 *
 * @author Atom
 * @date 2020/1/6
 * @time 15:21
 */
@Controller
public class LoginController {
    @Autowired
    UserService userService;

    /**
     * 返回前端ajax登陆消息
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/reply/login", method = RequestMethod.POST)
    @ResponseBody
    public ReplyLoginMessage replyLoginMessage(@RequestBody User user, HttpServletRequest request, HttpServletResponse response) {
        if (StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())) {
            return new ReplyLoginMessage(false, ReplyLoginMessage.USER_NAME_OR_PASSWORD_NULL);
        }
        boolean isExist = userService.isExistUser(user);
        if (!isExist) {
            return new ReplyLoginMessage(false, ReplyLoginMessage.USER_NAME_NOT_EXIST);
        }
        User res = userService.validateUser(user.getUsername(), user.getPassword());
        if (res == null) {
            return new ReplyLoginMessage(false, ReplyLoginMessage.USER_PASSWORD_WRONG);
        }


        request.getSession().setAttribute("user", res);
        if (user.isRememberMe()) {
            String jsonString = null;
            try {
                jsonString = URLEncoder.encode(JSON.toJSONString(res), "utf-8");
                Cookie cookie = new Cookie("user", jsonString);
                cookie.setMaxAge(60 * 60); //保存1小时
                cookie.setPath("/");
                response.addCookie(cookie);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

        }

        return new ReplyLoginMessage(true);
    }

//    注册
    @RequestMapping(value = "/registerUser", method = RequestMethod.POST)
    @ResponseBody
    public int RegisterUser(User user){
        int i = userService.selectUserByName(user.getUsername());
        if (i != 0) { //有重复的
            return 0;
        }
        user.setRoleType(1);
        return userService.insertUser(user);
    }
//    判断用户名是否重用
    @RequestMapping("/isRepeat")
    @ResponseBody
    public int isRepeat(HttpServletRequest request){
        String name=request.getParameter("name");
       return userService.selectUserByName(name);
    }
}
