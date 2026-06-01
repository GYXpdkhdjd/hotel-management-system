package com.itmk.web.login.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.itmk.jwt.JwtUtils;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.login.entity.LoginParm;
import com.itmk.web.login.entity.LoginResult;
import com.itmk.web.login.entity.UserInfo;
import com.itmk.web.sys_menu.entity.MakeMenuTree;
import com.itmk.web.sys_menu.entity.RouterVO;
import com.itmk.web.sys_menu.entity.SysMenu;
import com.itmk.web.sys_menu.service.SysMenuService;
import com.itmk.web.sys_user.entity.SysUser;
import com.itmk.web.sys_user.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import sun.misc.BASE64Encoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/api/login")
public class LoginController {
    @Autowired
    private DefaultKaptcha defaultKaptcha;
    @Autowired
    private SysUserService sysUserService;
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    private SysMenuService sysMenuService;

    //生成验证码
    @PostMapping("/image")
    public ResultVo imageCode(HttpServletRequest request) {
        //生成验证码的文文字
        String text = defaultKaptcha.createText();
        //获取session
        HttpSession session = request.getSession();
        //把生成的验证码放到session里面
        session.setAttribute("code", text);
        //生成图片的格式，返回给前端
        BufferedImage bufferedImage = defaultKaptcha.createImage(text);
        ByteArrayOutputStream outputStream = null;
        try {
            outputStream = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage, "jpg", outputStream);
            BASE64Encoder encoder = new BASE64Encoder();
            String base64 = encoder.encode(outputStream.toByteArray());
            String captchaBase64 = "data:image/jpeg;base64," + base64.replaceAll("\r\n", "");
            ResultVo result = new ResultVo("生成成功", 200, captchaBase64);
            return result;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (outputStream != null) {
                    outputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @PostMapping("/login")
    public ResultVo login(HttpServletRequest request, @RequestBody LoginParm loginParm) {
        //从前端传递的验证码
        String code = loginParm.getCode();
        //从sessoin里面获取code验证码
        HttpSession session = request.getSession();
        String scode = (String) session.getAttribute("code");
        if (StringUtils.isEmpty(scode)) {
            return ResultUtils.error("验证码过期!");
        }
        if (!scode.equals(code)) {
            return ResultUtils.error("验证码输入错误!");
        }
        //查询账户是否正确
        QueryWrapper<SysUser> query = new QueryWrapper<>();
        query.lambda().eq(SysUser::getUsername, loginParm.getUsername())
                .eq(SysUser::getPassword, loginParm.getPassword());
        SysUser user = sysUserService.getOne(query);
        if (user == null) {
            return ResultUtils.error("用户名或密码错误!");
        }
        //生成token
        //生成token
        Map<String, String> map = new HashMap<>();
        map.put("userId", user.getUserId().toString());
        String token = jwtUtils.generateToken(map);
        LoginResult result = new LoginResult();
        result.setToken(token);
        result.setUserId(user.getUserId());
        return ResultUtils.success("登录成功", result);
    }

    //查询用户信息
    @GetMapping("/getInfo")
    public ResultVo getInfo(Long userId) {
        //根据用户id查询用户信息
        SysUser user = sysUserService.getById(userId);
        //查询权限信息
        List<SysMenu> menuList = null;
        if (StringUtils.isNotEmpty(user.getIsAdmin()) && user.getIsAdmin().equals("1")) {
            menuList = sysMenuService.list();
        } else {
            menuList = sysMenuService.getMenuByUserId(userId);
        }
        //过滤出code字段
        List<String> collect = Optional.ofNullable(menuList).orElse(new ArrayList<>())
                .stream().map(item -> item.getCode())
                .filter(item -> item != null)
                .collect(Collectors.toList());
        //转为数组
        String[] strings = collect.toArray(new String[collect.size()]);
        UserInfo userInfo = new UserInfo();
        userInfo.setPermissons(strings);
        userInfo.setUserId(userId);
        userInfo.setName(user.getNickName());
        return ResultUtils.success("查询成功", userInfo);
    }

    //获取菜单权限
    @GetMapping("/getMenuList")
    public ResultVo getMenuList(Long userId) {
        //查询用户信息
        SysUser user = sysUserService.getById(userId);
        //查询菜单权限
        List<SysMenu> menuList = null;
        if (StringUtils.isNotEmpty(user.getIsAdmin()) && user.getIsAdmin().equals("1")) {
            menuList = sysMenuService.list();
        } else {
            menuList = sysMenuService.getMenuByUserId(userId);
        }
        //菜单数据，查询类型为 0和1的数据
        List<SysMenu> treeList = Optional.ofNullable(menuList).orElse(new ArrayList<>())
                .stream()
                .filter(item -> item != null && !item.getType().equals("2")).collect(Collectors.toList());
        //组装菜单数据类型
        List<RouterVO> rourer = MakeMenuTree.makeRouter(treeList, 0L);
        return ResultUtils.success("查询成功", rourer);
    }

}
