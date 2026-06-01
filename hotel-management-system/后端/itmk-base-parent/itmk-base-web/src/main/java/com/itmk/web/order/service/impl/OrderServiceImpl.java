package com.itmk.web.order.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itmk.web.hotel_order.entity.HotelOrder;
import com.itmk.web.hotel_order.service.HotelOrderService;
import com.itmk.web.hotle_room.entity.HotelRoom;
import com.itmk.web.hotle_room.service.HotleRoomService;
import com.itmk.web.order.entity.Order;
import com.itmk.web.order.mapper.OrderMapper;
import com.itmk.web.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Service
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    @Autowired
    private HotleRoomService hotleRoomService;
    @Autowired
    private HotelOrderService  hotelOrderService;
    @Override
    @Transactional
    public void addSave(Order order) {
        //插入订单信息
        order.setIntoTime(new Date());
        order.setCreateTime(new Date());
        order.setStatus("1");
        int insert = this.baseMapper.insert(order);
        //修改房间为已入住
        if(insert > 0){
            hotleRoomService.update(new LambdaUpdateWrapper<HotelRoom>()
            .set(HotelRoom::getBookStatus,"2")
            .eq(HotelRoom::getBookStatus,"0")
            .eq(HotelRoom::getRoomId,order.getRoomId())
            );
        }
    }

    @Override
    @Transactional
    public void bookOrder(Order order) {
        //插入订单信息
        order.setIntoTime(new Date());
        order.setCreateTime(new Date());
        order.setStatus("1");
        int insert = this.baseMapper.insert(order);
        //修改房间为已入住
        if(insert > 0){
            hotleRoomService.update(new LambdaUpdateWrapper<HotelRoom>()
            .set(HotelRoom::getBookStatus,"2")
            .eq(HotelRoom::getBookStatus,"1")
            .eq(HotelRoom::getRoomId,order.getRoomId())
            );
        }
        //更新小程序预订订单表状态
         hotelOrderService.update(
            new LambdaUpdateWrapper<HotelOrder>()
                    .set(HotelOrder::getStatus,"2")
//                    .eq(HotelOrder::getRoomId,order.getRoomId())
                    .eq(HotelOrder::getStatus,"1")
                    .apply(order.getRoomId() != null,
                            "FIND_IN_SET ('" + order.getRoomId() + "',room_id)"));
    }

    @Override
    @Transactional
    public void checkOrder(Order order) {
        //更新订单金额和状态
        order.setLeaveTime(new Date());
        order.setStatus("2");
        QueryWrapper<Order> query = new QueryWrapper<>();
        query.lambda()
                .eq(Order::getOrderId,order.getOrderId())
                .eq(Order::getStatus,"1");
        int update = this.baseMapper.update(order, query);
        //更新客房状态
        HotelRoom room = new HotelRoom();
        room.setRoomId(order.getRoomId());
        room.setBookStatus("0");
        hotleRoomService.updateById(room);
        //如果是预订订单，更新预订订单的状态
        if(update > 0){
            //查看是否有预订订单
            HotelOrder one = hotelOrderService.getOne(new LambdaQueryWrapper<HotelOrder>()
                    .eq(HotelOrder::getStatus,"2")
                    .apply(order.getRoomId() != null,
                            "FIND_IN_SET ('" + order.getRoomId() + "',room_id)"));
            if(one != null){
                HotelOrder hotelOrder = new HotelOrder();
                hotelOrder.setOrderId(one.getOrderId());
                hotelOrder.setStatus("3");
                hotelOrderService.updateById(hotelOrder);
            }
        }
    }
}
