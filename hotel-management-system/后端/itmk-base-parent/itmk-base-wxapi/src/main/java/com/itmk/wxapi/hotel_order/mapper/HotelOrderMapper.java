package com.itmk.wxapi.hotel_order.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.itmk.wxapi.hotel_order.entity.HotelOrder;
import com.itmk.wxapi.hotel_order.entity.OrderParm;
import com.itmk.wxapi.hotel_order.entity.OrderVo;
import org.apache.ibatis.annotations.Param;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface HotelOrderMapper extends BaseMapper<HotelOrder> {
    IPage<OrderVo> getOrderList(IPage<OrderVo> page, @Param("parm") OrderParm parm);
}
