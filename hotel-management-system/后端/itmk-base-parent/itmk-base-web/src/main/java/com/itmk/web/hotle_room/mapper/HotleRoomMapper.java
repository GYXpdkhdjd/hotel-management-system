package com.itmk.web.hotle_room.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itmk.web.hotle_room.entity.DeskRoom;
import com.itmk.web.hotle_room.entity.HotelRoom;
import com.itmk.web.hotle_room.entity.RoomParm;
import com.itmk.web.hotle_room.entity.TotalVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface HotleRoomMapper extends BaseMapper<HotelRoom> {
    List<DeskRoom> getRoomList(@Param("parm") RoomParm parm);
     //统计数据
    TotalVo getTotal();
}
