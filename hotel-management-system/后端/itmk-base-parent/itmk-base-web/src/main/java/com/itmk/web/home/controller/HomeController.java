package com.itmk.web.home.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.hotel_info.entity.HotelInfo;
import com.itmk.web.hotel_info.service.HotelInfoService;
import com.itmk.web.hotle_room.entity.DeskRoom;
import com.itmk.web.hotle_room.entity.HotelRoom;
import com.itmk.web.hotle_room.entity.RoomParm;
import com.itmk.web.hotle_room.entity.TotalVo;
import com.itmk.web.hotle_room.service.HotleRoomService;
import com.itmk.web.order.entity.Order;
import com.itmk.web.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/api/home")
public class HomeController {
    @Autowired
    private HotleRoomService hotleRoomService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private HotelInfoService hotelInfoService;
    //查询房间列表
    @GetMapping("/getHomeList")
    public ResultVo getHomeList(RoomParm parm){
        List<DeskRoom> roomList = hotleRoomService.getRoomList(parm);
        return ResultUtils.success("查询成功",roomList);
    }

    //空房入住
    @PostMapping("/addOrder")
    public ResultVo addOrder(@RequestBody Order order){
        orderService.addSave(order);
        return ResultUtils.success("操作成功");
    }

    //预订房入住
    @PostMapping("/bookOrder")
    public ResultVo bookOrder(@RequestBody Order order){
        orderService.bookOrder(order);
        return ResultUtils.success("操作成功");
    }

    //根据客房id查询信息
    @GetMapping("/getInfoById")
    public ResultVo getInfoById(Long roomId){
       // 查询入住订单
       Order order = orderService.getOne(new LambdaQueryWrapper<Order>()
        .eq(Order::getRoomId,roomId)
        .eq(Order::getStatus,"1")
       );
       // 查询房间类型价格作为默认应付金额
       Map<String, Object> result = new HashMap<>();
       result.put("order", order);
       if (order != null) {
           HotelRoom room = hotleRoomService.getById(roomId);
           if (room != null) {
               HotelInfo hotelInfo = hotelInfoService.getById(room.getInfoId());
               if (hotelInfo != null) {
                   result.put("infoPrice", hotelInfo.getInfoPrice());
               }
           }
       }
       return ResultUtils.success("查询成功", result);
    }

    //退房
    @PostMapping("/checkOrder")
    public ResultVo checkOrder(@RequestBody Order order){
        orderService.checkOrder(order);
        return ResultUtils.success("操作成功");
    }

    //启用房间
    @PostMapping("/upRoom")
    public ResultVo upRoom(@RequestBody HotelRoom room){
        room.setBookStatus("0");
        if(hotleRoomService.updateById(room)){
            return ResultUtils.success("操作成功!");
        }
        return ResultUtils.error("操作失败!");
    }

     //统计总数
    @GetMapping("/getTotal")
    public ResultVo getTotal(){
        TotalVo total = hotleRoomService.getTotal();
        return ResultUtils.success("查询成功",total);
    }

}
