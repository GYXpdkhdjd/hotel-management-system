package com.itmk.web.sys_menu.entity;

import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
public class MakeMenuTree {
    //生成树的数据
    public static List<SysMenu> makeTree(List<SysMenu> menuList,Long pid){
        List<SysMenu> list = new ArrayList<>();
        Optional.ofNullable(menuList).orElse(new ArrayList<>())
                .stream()
                .filter(item ->item != null && item.getParentId().equals(pid))
                .forEach(item ->{
                    SysMenu menu = new SysMenu();
                    BeanUtils.copyProperties(item,menu);
                    //查询下级:递归算法
                    List<SysMenu> children = makeTree(menuList, item.getMenuId());
                    menu.setChildren(children);
                    list.add(menu);
                });
        return list;
    }
    //生成路由的数据格式
    public static List<RouterVO> makeRouter(List<SysMenu> menuList,Long pid){
        //定义一个接收生成的路由数据
        List<RouterVO> list = new ArrayList<>();
        Optional.ofNullable(menuList).orElse(new ArrayList<>())
                .stream()
                .filter(item -> item != null && item.getParentId().equals(pid))
                .forEach(item ->{
                    RouterVO router = new RouterVO();
                    router.setName(item.getName());
                    router.setPath(item.getPath());
                    //设置children: 当前菜单的下级
                    List<RouterVO> children = makeRouter(menuList,item.getMenuId());
                    router.setChildren(children);
                    router.setMeta(router.new Meta(
                            item.getTitle(),
                            item.getIcon(),
                            item.getCode().split(",")
                    ));
                    //设置组件的路径 component
                    // 0：不可以点击跳转   可以点击跳转（首页）
                    if(item.getParentId() == 0L){
                        router.setComponent("Layout");
                        if(item.getType().equals("1")){
                            router.setRedirect(item.getPath());
                            //设置下级
                            List<RouterVO> listChild = new ArrayList<>();
                            RouterVO child  = new RouterVO();
                            child.setName(item.getName());
                            child.setPath(item.getPath());
                            child.setComponent(item.getUrl());
                            child.setMeta(child.new Meta(
                                    item.getTitle(),
                                    item.getIcon(),
                                    item.getCode().split(",")
                            ));
                            listChild.add(child);
                            router.setChildren(listChild);
                            router.setPath(item.getPath() +"parent");
                            router.setName(item.getName()+"parent");
                        }
                    }else{
                        router.setComponent(item.getUrl());
                    }
                     list.add(router);
                });
        return list;
    }
}
