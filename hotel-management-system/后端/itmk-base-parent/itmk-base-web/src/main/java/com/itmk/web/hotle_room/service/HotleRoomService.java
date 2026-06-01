package com.itmk.web.hotle_room.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itmk.web.hotle_room.entity.DeskRoom;
import com.itmk.web.hotle_room.entity.HotelRoom;
import com.itmk.web.hotle_room.entity.RoomParm;
import com.itmk.web.hotle_room.entity.TotalVo;

import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface HotleRoomService extends IService<HotelRoom> {
     List<DeskRoom> getRoomList(RoomParm parm);
     //统计数据
    TotalVo getTotal();
}
