package com.itmk.wxapi.hotel_order.controller;

import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.wxapi.hotel_order.entity.HotelOrder;
import com.itmk.wxapi.hotel_order.service.HotelOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/wxapi/order")
public class HotelOrderController {
    @Autowired
    private HotelOrderService hotelOrderService;

    //预订
    @PostMapping("/bookOrder")
    public ResultVo bookOrder(@RequestBody HotelOrder order){
        hotelOrderService.bookOrder(order);
        return ResultUtils.success("预订成功!");
    }

}
