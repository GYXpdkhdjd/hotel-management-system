package com.itmk.web.hotel_service.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.hotel_info_service.entity.HotelServiceSelect;
import com.itmk.web.hotel_info_service.service.HotelServiceSelectService;
import com.itmk.web.hotel_service.entity.HotelPage;
import com.itmk.web.hotel_service.entity.HotelService;
import com.itmk.web.hotel_service.service.HotelServiceService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/api/hotel")
public class HotelServiceController {
    @Autowired
    private HotelServiceService hotelServiceService;
    @Autowired
    private HotelServiceSelectService  hotelServiceSelectService;

    //新增
    @PostMapping
    public ResultVo add(@RequestBody HotelService hotelService){
        if(hotelServiceService.save(hotelService)){
            return ResultUtils.success("新增成功!");
        }
        return ResultUtils.error("新增失败!");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody HotelService hotelService){
        if(hotelServiceService.updateById(hotelService)){
            return ResultUtils.success("编辑成功!");
        }
        return ResultUtils.error("编辑失败!");
    }

    //删除
    @DeleteMapping("/{serviceId}")
    public ResultVo delete(@PathVariable("serviceId") Long serviceId){
        if(hotelServiceService.removeById(serviceId)){
            return ResultUtils.success("删除成功!");
        }
        return ResultUtils.error("删除失败!");
    }

    //列表
    @GetMapping("/list")
    public ResultVo list(HotelPage parm){
        //构造分页对象
        IPage<HotelService> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        //构造查询条件
        QueryWrapper<HotelService> query = new QueryWrapper<>();
        if(StringUtils.isNotEmpty(parm.getName())){
            query.lambda().like(HotelService::getName,parm.getName());
        }
        query.lambda().orderByAsc(HotelService::getOrderNum);
        IPage<HotelService> list = hotelServiceService.page(page, query);
        return ResultUtils.success("查询成功",list);
    }

    //客房服务列表
    @GetMapping("/getList")
    public ResultVo getList(){
        List<HotelService> list = hotelServiceService.list();
        return ResultUtils.success("查询成功",list);
    }

    //客房服务数据回显
     @GetMapping("/getCheckList")
    public ResultVo getCheckList(Long infoId){
        QueryWrapper<HotelServiceSelect> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(HotelServiceSelect::getInfoId,infoId);
        List<HotelServiceSelect> list = hotelServiceSelectService.list(queryWrapper);
        //组装返回的数据
         List<Long> collect = Optional.ofNullable(list).orElse(new ArrayList<>())
                 .stream()
                 .map(item -> item.getServiceId()).collect(Collectors.toList());
         return ResultUtils.success("查询成功",collect);
    }
}
