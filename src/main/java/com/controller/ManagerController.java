package com.controller;

import com.annotation.LoginRequired;
import com.model.*;
import com.service.ClassService;
import com.service.QuestionService;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台管理控制器
 *
 * @author Atom
 * @date 2020/1/6
 * @time 15:21
 */
@Controller
@RequestMapping("manage")
public class ManagerController {

    /**
     *                            _oo0oo_
     *                          088888880
     *                          88" . "88
     *                          (| -_- |)
     *                          0\  =  /0
     *                        ___/'---'\___
     *                      .' \\|     |// '.
     *                     / \\|||  :  |||// \
     *                    / -||||| -:- |||||- \
     *                   |   | \\\  -  /// |   |
     *                   | \_|  ''\---/''  |_/ |
     *                   \  .-\__  '-'  __/-.  /
     *                 ___'. .'  /--.--\  '. .'___
     *              ."" '<  '.___\_<|>_/___.'  >' "".
     *             | | :  '- \'.;'\ _ /';.'/ -'  : | |
     *             \  \ '_.   \_ __\ /__ _/   ._' /  /
     *         ====='-.____'.___ \_____/ ___.'____.-'=====
     *                           '=---='
     * <p>
     *         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     * <p>
     *                  佛祖保佑        永无BUG
     * <p>
     *         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     */

    @Autowired
    UserService userService;
    @Autowired
    ClassService classService;
    @Autowired
    QuestionService questionService;


    @RequestMapping("/toIndex")
    @LoginRequired
    public String toIndex() {
        return "index";
    }

    @RequestMapping("/toChangePassword")
    @LoginRequired
    public String toChangePassword() {
        return "changePassword";
    }

    @RequestMapping("/toCreateQuestion")
    @LoginRequired
    public String toCreateQuestion() {
        return "createQuestion";
    }

    /**
     * 跳转到问题列表
     * 分类：
     *      管理员 --> 可以修改和删除所有问题
     *      教师   --> 可以修改和删除所有自己创建的问题
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("/toListQuestion")
    @LoginRequired
    public String toListQuestion(ModelMap map,HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        List<Question> questionList = null;
        if (user.getRoleType() == 3) { //管理员
            questionList = questionService.selectAll();
        } else if (user.getRoleType() == 2) {  //教师
            questionList = questionService.selectAll(user.getId());
        }

        map.put("questionList", questionList);

        return "listQuestion";
    }

    @RequestMapping("/toListRole")
    @LoginRequired
    public String toListRole(ModelMap map) {
        List<User> userList = userService.selectAll();
        if (userList != null) {
            map.put("userList",userList);
        }
        return "listRole";
    }

    @RequestMapping("/toListUser")
    @LoginRequired
    public String toListUser(ModelMap modelMap) {

        //从数据库查询信息
        List<User> userList = userService.selectAll();
        //把list列表添加到modelMap里
        modelMap.addAttribute("userList", userList);
        return "listUser";
    }


    @RequestMapping("toCreateClass")
    @LoginRequired
    public String toCreateClass() {
        return "createClass";
    }

    /**
     * 跳转到班级列表
     * 分类：
     *      管理员 --> 可以修改和删除所有班级
     *      教师   --> 可以修改和删除所有自己创建的班级
     *      学生   --> 可以加入所有班级
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("toListClass")
    @LoginRequired
    public String toListClass(HttpServletRequest request, ModelMap map) {
        User user = (User) request.getSession().getAttribute("user");
        List<Classroom> classroomList = null;
        if (user.getRoleType() == 1 || user.getRoleType() == 3) {
            //学生和管理员
            classroomList = classService.selectAll();
        } else if (user.getRoleType() == 2) {
            //教师
            classroomList = classService.selectAll(user.getId());
            for (Classroom classroom : classroomList) {
                classroom.setUser(user);
            }
        }

        if (classroomList != null) {
            map.put("classroomList", classroomList);
        }
        if (user.getRoleType() == 1) {
            return "showClass";
        }
        return "listClass";
    }

    /**
     * CLASS_NOT_EXIST  = 3; //不存在该班级
     * CLASS_FULL_ERROR = 4; //班级满人
     * CLASS_JOIN_ERROR = 5; //加入班级异常
     * @param classid
     * @param request
     * @return
     */
    @RequestMapping("/validateClass/{classid}")
    @ResponseBody
    @LoginRequired
    public ReplyClassMessage validateClass(@PathVariable("classid") String classid,HttpServletRequest request) {
        Classroom classroom = classService.isExistClass(classid);
        if (classroom == null) {
            return new ReplyClassMessage(false, ReplyClassMessage.CLASS_NOT_EXIST);
        }
        User user = (User) request.getSession().getAttribute("user");
        if (user == null || user.getId() == null) {
            return new ReplyClassMessage(false, ReplyClassMessage.CLASS_JOIN_ERROR);
        }
        classService.joinClass(Integer.valueOf(classid), user.getId());
        return new ReplyClassMessage(true);
    }



    //退出登陆
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) {
                cookie.setMaxAge(0);  //销毁cookie
                cookie.setPath("/");
                response.addCookie(cookie);
            }
        }
        return "redirect:/page/login.html";
    }

    //验证密码是否正确
    @RequestMapping("/reply/validatePassword")
    @LoginRequired
    @ResponseBody
    public Map<String, Boolean> validatePassword(String oldPassword, HttpServletRequest request) {
        Map<String, Boolean> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        map.put("status", user.getPassword().equals(oldPassword));
        return map;
    }

    //修改密码
    @RequestMapping("/changePassword")
    @ResponseBody
    @LoginRequired
    public ReplyChangeMessage changePassword(String newPassword, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        user.setPassword(newPassword);
        userService.changeUser(user);
        return new ReplyChangeMessage(true);
    }

    //更改个人信息
    @RequestMapping(value = "/changeInformation", method = RequestMethod.POST)
    @ResponseBody
    @LoginRequired
    public ReplyChangeMessage changeInformation(@RequestBody User user, HttpServletRequest request) {
        User u = (User) request.getSession().getAttribute("user");
        if (user.getPassword() != null) {
            u.setPassword(user.getPassword());
        }
        if (user.getNickname() != null) {
            u.setNickname(user.getNickname());
        }
        if (user.getProfilePhoto() != null) {
            u.setProfilePhoto(user.getProfilePhoto());
        }
        if (user.getSex() != null) {
            u.setSex(user.getSex());
        }

        int influenceCounts = userService.changeUser(u);
        if (influenceCounts == 0) {
            return new ReplyChangeMessage(false, ReplyChangeMessage.CHANGE_ERROR);
        }

        request.getSession().setAttribute("user", u);
        return new ReplyChangeMessage(true);
    }

    /**
     *
     *  班级管理
     *
     */

    @RequestMapping("/createClass")
    @ResponseBody
    @LoginRequired
    public ReplyClassMessage createClass(@RequestBody Classroom classroom) {
        int fluenceCounts = classService.addClass(classroom);
        if (fluenceCounts < 1) {
            return new ReplyClassMessage(false, ReplyClassMessage.CLASS_CREATED_ERROR);
        }
        return new ReplyClassMessage(true);
    }

    @RequestMapping("/changeClass")
    @LoginRequired
    public String changeClass(Classroom classroom) {
        classService.changeClass(classroom);
        return "redirect:/manage/toListClass.do";
    }

    @RequestMapping("/deleteClass")
    @LoginRequired
    public String deleteClass(Integer id) {
        classService.deleteClassById(id);
        return "redirect:/manage/toListClass.do";
    }


    /**
     *  问题管理
     */

    @RequestMapping("/createQuestion")
    @ResponseBody
    @LoginRequired
    public ReplyQuestionMessage createQuestion(@RequestBody Question question) {
        int fluenceCounts = questionService.addQuestion(question);
        if (fluenceCounts < 1) {
            return new ReplyQuestionMessage(false, ReplyQuestionMessage.QUESTION_CREATED_ERROR);
        }
        return new ReplyQuestionMessage(true);
    }

    @RequestMapping("/changeQuestion")
    @LoginRequired
    public String changeQuestion(Question question) {
        questionService.changeQuestion(question);
        return "redirect:/manage/toListQuestion.do";
    }

    @RequestMapping("/deleteQuestion")
    @LoginRequired
    public String deleteQuestion(Integer id) {
        questionService.deleteQuestionById(id);
        return "redirect:/manage/toListQuestion.do";
    }

    @RequestMapping("/changeRoleType")
    @LoginRequired
    public String changeRoleType(User user, HttpServletRequest request) {
        User adminUser = (User) request.getSession().getAttribute("user");
        if (adminUser.getRoleType() == 3) {
            userService.changeUser(user);
        }
        return "redirect:/manage/toListRole.do";
    }
    //重置密码
    @ResponseBody
    @RequestMapping("/resetPassword")
    public int ChangePassword(@RequestBody User user){
        return userService.changeUser(user);
    }

    //删除用户
    @RequestMapping("/deleteUser")
    public void deleteUser(int id,HttpServletResponse response) throws IOException {
        int i = userService.deleteUser(id);
        response.sendRedirect("/manage/toListUser.do");
    }

}
