package com.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 菜单实体类
 *
 * @author Atom
 * @date 2020/1/9
 * @time 21:52
 */
@Table(name = "tbs_menu")
public class Menu implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id; //菜单id
    private Integer parentId; //菜单父id
    private String title; //菜单标题
    private String url;  //菜单链接
    private String iconUrl;  //icon图标链接

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }
}
