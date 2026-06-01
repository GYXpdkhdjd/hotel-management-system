package com.itmk.web.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itmk.web.order.entity.Order;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface OrderService extends IService<Order> {
    //空房
    void addSave(Order order);
    //已预订
    void bookOrder(Order order);
    //退房
    void checkOrder(Order order);
}
