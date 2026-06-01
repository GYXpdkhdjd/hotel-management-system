package com.itmk.web.sys_user.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itmk.web.sys_user.entity.SysUser;
import com.itmk.web.sys_user.mapper.SysUserMapper;
import com.itmk.web.sys_user.service.SysUserService;
import com.itmk.web.sys_user_role.entity.SysUserRole;
import com.itmk.web.sys_user_role.service.SysUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Service
public class SysUserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements SysUserService {
    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Override
    @Transactional
    public void addUser(SysUser sysUser) {
        //添加用户信息
        sysUser.setCreateTime(new Date());
        int insert = this.baseMapper.insert(sysUser);
        //设置用户的角色
        if(insert >0){
            SysUserRole role = new SysUserRole();
            role.setRoleId(sysUser.getRoleId());
            role.setUserId(sysUser.getUserId());
            sysUserRoleService.save(role);
        }
    }

    @Override
    @Transactional
    public void editUser(SysUser sysUser) {
        sysUser.setUpdateTime(new Date());
        int i = this.baseMapper.updateById(sysUser);
         //设置用户的角色
        if(i >0){
            //先删除，再保存
            QueryWrapper<SysUserRole> query = new QueryWrapper<>();
            query.lambda().eq(SysUserRole::getUserId,sysUser.getUserId());
            sysUserRoleService.remove(query);
            //重新保存
            SysUserRole role = new SysUserRole();
            role.setRoleId(sysUser.getRoleId());
            role.setUserId(sysUser.getUserId());
            sysUserRoleService.save(role);
        }
    }

    @Override
    public void deleteUser(Long userId) {
        //删除用户
        int i = this.baseMapper.deleteById(userId);
        //删除用户对应的角色
        if(i>0){
            QueryWrapper<SysUserRole> query = new QueryWrapper<>();
            query.lambda().eq(SysUserRole::getUserId,userId);
            sysUserRoleService.remove(query);
        }
    }
}
