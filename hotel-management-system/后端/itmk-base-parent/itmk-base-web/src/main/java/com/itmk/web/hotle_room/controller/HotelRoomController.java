package com.itmk.web.hotle_room.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.hotel_info.entity.AddRoom;
import com.itmk.web.hotle_room.entity.HotelRoom;
import com.itmk.web.hotle_room.service.HotleRoomService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/api/hotelRoom")
public class HotelRoomController {
    @Autowired
    private HotleRoomService hotleRoomService;

    //新增房间
    @PostMapping("/addRoom")
    public ResultVo addRoom(@RequestBody AddRoom addRoom){
        //查询房间编号是否被占用
        QueryWrapper<HotelRoom> query = new QueryWrapper<>();
        query.lambda().eq(HotelRoom::getRoomCode,addRoom.getRoomCode());
        int count = hotleRoomService.count(query);
        if(count > 0){
            return ResultUtils.error("房间编号被占用!");
        }
        //存入数据库
        HotelRoom room = new HotelRoom();
        BeanUtils.copyProperties(addRoom,room);
        if(hotleRoomService.save(room)){
            return ResultUtils.success("保存成功!");
        }
        return ResultUtils.error("保存失败!");
    }

    //编辑
    @PutMapping("/editRoom")
    public ResultVo editRoom(@RequestBody HotelRoom parm){
        if(hotleRoomService.updateById(parm)){
            return ResultUtils.success("编辑成功!");
        }
        return ResultUtils.error("编辑失败!");
    }

     //删除客房
    @DeleteMapping("/{roomId}")
    public ResultVo deleteRoom(@PathVariable("roomId") Long roomId){
        if(hotleRoomService.removeById(roomId)){
            return ResultUtils.success("删除成功!");
        }
        return ResultUtils.error("删除失败!");
    }
}
