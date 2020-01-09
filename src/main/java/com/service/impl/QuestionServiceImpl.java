package com.service.impl;

import com.dao.QuestionDao;
import com.dao.UserDao;
import com.model.Question;
import com.model.User;
import com.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author Atom
 * @date 2020/1/8
 * @time 10:49
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    QuestionDao questionDao;
    @Autowired
    UserDao userDao;

    /**
     * insert into tbs_question(uid,title,description) values(?,?,?);
     * @param question
     * @return
     */
    @Override
    public int addQuestion(Question question) {
        return questionDao.insertSelective(question);
    }

    /**
     * update tbs_question set title = ? , description = ? where id = ?;
     * @param question
     */
    @Override
    public void changeQuestion(Question question) {
        questionDao.updateByPrimaryKeySelective(question);
    }

    /**
     * delete from tbs_question where id = ?;
     * @param id
     */
    @Override
    public void deleteQuestionById(Integer id) {
        questionDao.deleteByPrimaryKey(id);
    }

    /**
     * select * from tbs_question;
     * @return
     */
    @Override
    public List<Question> selectAll() {
        List<Question> questionList = questionDao.selectAll();
        for (Question question : questionList) {
            User user = userDao.selectByPrimaryKey(question.getUid());
            question.setUser(user);
        }
        return questionList;
    }

    /**
     * select * from tbs_question where uid = ?;
     * @param id
     * @return
     */
    @Override
    public List<Question> selectAll(Integer id) {
        Example example = new Example(Question.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andCondition("uid=", id);
        List<Question> questionList = questionDao.selectByExample(example);
        for (Question question : questionList) {
            User user = userDao.selectByPrimaryKey(question.getUid());
            question.setUser(user);
        }
        return questionList;
    }
}
