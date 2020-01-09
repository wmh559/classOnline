package com.utils;

import com.model.Menu;

import java.util.*;

/**
 * @author Atom
 * @date 2020/1/9
 * @time 22:11
 */
public class MenuBuilder {
    public static Map<Menu, List<Menu>> buildMenuList(List<Menu> menus) {
        Map<Menu, List<Menu>> menuListMap = null;
        //构建一级菜单
        for (Menu m0 : menus) {
            if (m0.getParentId() == 0) {
                if (menuListMap == null) {
                    menuListMap = new HashMap<>();
                }
                menuListMap.put(m0, null);
            }
        }
        //构建二级菜单
        for (Menu m0 : menuListMap.keySet()) {
            List<Menu> m1List = null;
            for (Menu m1 : menus) {
                if (m1.getParentId() == m0.getId()) {
                    if (m1List == null) {
                        m1List = new ArrayList<>();
                    }
                    m1List.add(m1);
                }
            }
            menuListMap.put(m0, m1List);
        }

        return menuListMap;
    }
}
