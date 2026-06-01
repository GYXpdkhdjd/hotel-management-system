package com.itmk.web.sys_user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itmk.web.sys_user.entity.SysUser;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface SysUserService extends IService<SysUser> {
    //新增
    void addUser(SysUser sysUser);
    //编辑
    void editUser(SysUser sysUser);
    //删除
    void deleteUser(Long userId);
}
