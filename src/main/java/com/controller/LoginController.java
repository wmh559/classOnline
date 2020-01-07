package com.controller;

import com.alibaba.fastjson.JSON;
import com.model.ReplyLoginMessage;
import com.model.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
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
     * @param user
     * @return
     */
    @RequestMapping(value = "/reply/login",method = RequestMethod.POST)
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
            Cookie cookie = new Cookie("user", JSON.toJSONString(res));
            cookie.setMaxAge(60*60); //保存1小时
            response.addCookie(cookie);
        }
        return new ReplyLoginMessage(true);
    }
}
