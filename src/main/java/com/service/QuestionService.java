package com.service;

import com.model.Question;

import java.util.List;

/**
 * @author Atom
 * @date 2020/1/8
 * @time 10:49
 */
public interface QuestionService {
    int addQuestion(Question question);

    void changeQuestion(Question question);

    void deleteQuestionById(Integer id);

    List<Question> selectAll();

    List<Question> selectAll(Integer id);
}
