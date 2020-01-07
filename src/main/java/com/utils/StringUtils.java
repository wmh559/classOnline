package com.utils;

/**
 * 字符工具类
 * @author Atom
 * @date 2020/1/7
 * @time 15:59
 */
public class StringUtils {
    public static boolean isBlank(String str) {
        if (str == null || str.equals("")) {
            return true;
        } else {
            return false;
        }


    }
}
