package com.controller;

import com.annotation.LoginRequired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Atom
 * @date 2020/1/8
 * @time 22:45
 */
@Controller
@RequestMapping("chat")
public class ChatController {
    @RequestMapping("/{classid}")
    @LoginRequired
    public String toClass(@PathVariable("classid") String classid) {
        return "chat";
    }
}
