package com.itmk.web.hotle_room.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itmk.web.hotle_room.entity.DeskRoom;
import com.itmk.web.hotle_room.entity.HotelRoom;
import com.itmk.web.hotle_room.entity.RoomParm;
import com.itmk.web.hotle_room.entity.TotalVo;
import com.itmk.web.hotle_room.mapper.HotleRoomMapper;
import com.itmk.web.hotle_room.service.HotleRoomService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Service
public class HotleRoomServiceImpl extends ServiceImpl<HotleRoomMapper, HotelRoom> implements HotleRoomService {
    @Override
    public List<DeskRoom> getRoomList(RoomParm parm) {
        return this.baseMapper.getRoomList(parm);
    }

    @Override
    public TotalVo getTotal() {
        return this.baseMapper.getTotal();
    }
}
