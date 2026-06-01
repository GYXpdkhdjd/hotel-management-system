package com.itmk.web.sys_menu.entity;

/**
 * @Author java实战基地
 * @Version 2383404558
 */

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
@TableName("sys_menu")
public class SysMenu {
    @TableId(type = IdType.AUTO)
    private Long menuId;
    private Long parentId;
    private String title;
    private String code;
    private String name;
    private String path;
    private String url;
    private String type;
    private String icon;
    @TableField(exist = false)
    private Boolean open;
    private String parentName;
    private Integer orderNum;
    private Date createTime;
    private Date updateTime;
    //表明children不属于sys_menu表，需要排除
    @TableField(exist = false)
    private List<SysMenu> children = new ArrayList<>();
}