package com.itmk.web.hotel_order.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.hotel_order.entity.HotelOrder;
import com.itmk.web.hotel_order.entity.HotelOrderParm;
import com.itmk.web.hotel_order.service.HotelOrderService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/api/hotelOrder")
public class HotelOrderController {
    @Autowired
    private HotelOrderService hotelOrderService;

    //列表
    @GetMapping("/getList")
    public ResultVo getList(HotelOrderParm parm){
        //构造分页对象
        IPage<HotelOrder> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        //构造查询条件
        QueryWrapper<HotelOrder> query = new QueryWrapper<>();
        query.lambda().like(StringUtils.isNotEmpty(parm.getName()),HotelOrder::getName,parm.getName())
                .like(StringUtils.isNotEmpty(parm.getPhone()),HotelOrder::getPhone,parm.getPhone())
                .orderByDesc(HotelOrder::getOrderTime);
        IPage<HotelOrder> list = hotelOrderService.page(page, query);
        return ResultUtils.success("查询成功",list);
    }

    //取消预约
    @PostMapping("/cancelRoom")
    public ResultVo cancelRoom(@RequestBody HotelOrder hotelOrder){
        hotelOrderService.cancel(hotelOrder);
        return ResultUtils.success("取消成功!");
    }
}
