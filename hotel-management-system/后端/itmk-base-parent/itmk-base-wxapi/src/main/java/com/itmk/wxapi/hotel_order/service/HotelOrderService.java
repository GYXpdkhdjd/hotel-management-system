package com.itmk.wxapi.hotel_order.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itmk.wxapi.hotel_order.entity.HotelOrder;
import com.itmk.wxapi.hotel_order.entity.OrderParm;
import com.itmk.wxapi.hotel_order.entity.OrderVo;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface HotelOrderService extends IService<HotelOrder> {
    void bookOrder(HotelOrder order);
     IPage<OrderVo> getOrderList(OrderParm parm);
}
