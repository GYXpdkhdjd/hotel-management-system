package com.itmk.wxapi.hotel_order.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itmk.wxapi.hotel_order.entity.HotelOrder;
import com.itmk.wxapi.hotel_order.entity.OrderParm;
import com.itmk.wxapi.hotel_order.entity.OrderVo;
import com.itmk.wxapi.hotel_order.mapper.HotelOrderMapper;
import com.itmk.wxapi.hotel_order.service.HotelOrderService;
import com.itmk.wxapi.hotle_room.entity.HotelRoom;
import com.itmk.wxapi.hotle_room.service.HotleRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Service
public class HotelOrderServiceImpl extends ServiceImpl<HotelOrderMapper,HotelOrder> implements HotelOrderService {
    @Autowired
    private HotleRoomService hotleRoomService;

    @Override
    @Transactional
    public void bookOrder(HotelOrder order) {
        //保存预订单
        order.setOrderTime(new Date());
        order.setStatus("1");
        int insert = this.baseMapper.insert(order);
        if(insert > 0){
            //更新客房的状态为 已预订
            List<String> list = Arrays.asList(order.getRoomId().split(","));
            List<HotelRoom> roomList = new ArrayList<>();
            for(int i=0;i<list.size();i++){
                HotelRoom room = new HotelRoom();
                room.setRoomId(Long.parseLong(list.get(i)));
                room.setBookStatus("1");
                roomList.add(room);
            }
            hotleRoomService.updateBatchById(roomList);
        }
    }

    @Override
    public IPage<OrderVo> getOrderList(OrderParm parm) {
        //构造分页对象
        IPage<OrderVo> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getOrderList(page,parm);
    }
}
