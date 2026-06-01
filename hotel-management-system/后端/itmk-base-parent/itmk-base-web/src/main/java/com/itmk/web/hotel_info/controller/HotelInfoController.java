package com.itmk.web.hotel_info.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.hotel_info.entity.AddParm;
import com.itmk.web.hotel_info.entity.AddRoom;
import com.itmk.web.hotel_info.entity.HotelInfo;
import com.itmk.web.hotel_info.entity.HotelInfoParm;
import com.itmk.web.hotel_info.service.HotelInfoService;
import com.itmk.web.hotle_room.entity.HotelRoom;
import com.itmk.web.hotle_room.service.HotleRoomService;
import com.itmk.web.sys_role.entity.SelectType;
import com.itmk.web.sys_role.entity.SysRole;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/api/hotelInfo")
public class HotelInfoController {
    @Autowired
    private HotelInfoService hotelInfoService;
    @Autowired
    private HotleRoomService hotleRoomService;

    //新增
    @PostMapping
    public ResultVo add(@RequestBody AddParm parm){
        hotelInfoService.addHotel(parm);
        return ResultUtils.success("保存成功!");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody AddParm parm){
        hotelInfoService.editHotel(parm);
        return ResultUtils.success("编辑成功!");
    }
    //主表列表
    @GetMapping("/list")
    public ResultVo list(HotelInfoParm parm){
        IPage<HotelInfo> list = hotelInfoService.getList(parm);
        return ResultUtils.success("查询成功",list);
    }

    //子表列表
    @GetMapping("/childList")
    public ResultVo childList(Long infoId){
        QueryWrapper<HotelRoom> query = new QueryWrapper<>();
        query.lambda().eq(HotelRoom::getInfoId,infoId);
        List<HotelRoom> list = hotleRoomService.list(query);
        return ResultUtils.success("查询成功",list);
    }

    //删除客房
    @DeleteMapping("/{infoId}")
    public ResultVo delete(@PathVariable("infoId") Long infoId){
        //判断客房下是否有房间,如果有不能删除
        QueryWrapper<HotelRoom> query = new QueryWrapper<>();
        query.lambda().eq(HotelRoom::getInfoId,infoId);
        int count = hotleRoomService.count(query);
        if(count > 0){
            return ResultUtils.error("客房下有房间，不能删除！");
        }
        hotelInfoService.deleteHotel(infoId);
        return ResultUtils.success("删除成功!");
    }

    //获取下拉数据
    @GetMapping("/getListHotel")
    public ResultVo getListHotel(){
        List<HotelInfo> list = hotelInfoService.list();
        List<SelectType> selectList = new ArrayList<>();
        Optional.ofNullable(list).orElse(new ArrayList<>())
                .stream()
                .forEach(item ->{
                    SelectType type = new SelectType();
                    type.setLabel(item.getInfoName());
                    type.setValue(item.getInfoId());
                    selectList.add(type);
                });
        return ResultUtils.success("查询成功",selectList);
    }

}
