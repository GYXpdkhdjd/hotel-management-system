package com.itmk.web.order.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.order.entity.Order;
import com.itmk.web.order.entity.OrderParm;
import com.itmk.web.order.service.OrderService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/api/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    //列表
    @GetMapping("/getList")
    public ResultVo getList(OrderParm parm){
        //构造分页对象
        IPage<Order> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        //构造查询条件
        LambdaQueryWrapper<Order> query = new LambdaQueryWrapper();
        query.like(StringUtils.isNotEmpty(parm.getIdCard()),Order::getCardNum,parm.getIdCard())
             .like(StringUtils.isNotEmpty(parm.getName()),Order::getName,parm.getName())
             .like(StringUtils.isNotEmpty(parm.getPhone()),Order::getPhone,parm.getPhone())
             .orderByDesc(Order::getCreateTime);
        IPage<Order> list = orderService.page(page, query);
        return ResultUtils.success("查询成功",list);
    }

}
