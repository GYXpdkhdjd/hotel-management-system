package com.itmk.web.hotel_order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itmk.web.hotel_order.entity.HotelOrder;


/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface HotelOrderService extends IService<HotelOrder> {
    void cancel(HotelOrder order);
}
