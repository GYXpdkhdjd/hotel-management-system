package com.itmk.web.hotel_order.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.itmk.web.hotel_order.entity.HotelOrder;
import com.itmk.web.hotel_order.mapper.HotelOrderMapper;
import com.itmk.web.hotel_order.service.HotelOrderService;
import com.itmk.web.hotle_room.entity.HotelRoom;
import com.itmk.web.hotle_room.service.HotleRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Service
public class HotelOrderServiceImpl extends ServiceImpl<HotelOrderMapper, HotelOrder> implements HotelOrderService {
    @Autowired
    private HotleRoomService hotleRoomService;
    @Override
    @Transactional
    public void cancel(HotelOrder order) {
        int i = this.baseMapper.updateById(order);
        if(i > 0){
            HotelOrder hotelOrder = this.baseMapper.selectById(order.getOrderId());
            String[] strings = hotelOrder.getRoomId().split(",");
            List<HotelRoom> roomList =new ArrayList<>();
            for(int j=0;j<strings.length;j++){
                HotelRoom room = new HotelRoom();
                room.setRoomId(Long.parseLong(strings[j]));
                room.setBookStatus("0");
                roomList.add(room);
            }
            //更新房间状态
            hotleRoomService.updateBatchById(roomList);
        }
    }
}
