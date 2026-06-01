package com.itmk.web.hotel_banner.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.hotel_banner.entity.BannerListParm;
import com.itmk.web.hotel_banner.entity.HotelBanner;
import com.itmk.web.hotel_banner.service.HotelBannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/api/banner")
public class HotelBannerController {
    @Autowired
    private HotelBannerService hotelBannerService;

    //新增
    @PostMapping
    public ResultVo add(@RequestBody HotelBanner hotelBanner){
        if(hotelBannerService.save(hotelBanner)){
            return ResultUtils.success("新增成功!");
        }
        return ResultUtils.error("新增失败!");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody HotelBanner hotelBanner){
        if(hotelBannerService.updateById(hotelBanner)){
            return ResultUtils.success("编辑成功!");
        }
        return ResultUtils.error("编辑失败!");
    }

    //删除
    @DeleteMapping("/{banId}")
    public ResultVo delete(@PathVariable("banId") Long banId){
        if(hotelBannerService.removeById(banId)){
            return ResultUtils.success("删除成功!");
        }
        return ResultUtils.error("删除失败!");
    }

    //列表
    @GetMapping("/list")
    public ResultVo list(BannerListParm parm){
        //构造查询条件
        QueryWrapper<HotelBanner> query = new QueryWrapper<>();
        query.lambda().like(HotelBanner::getTitle,parm.getTitle());
        //构造分页对象
        IPage<HotelBanner> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        IPage<HotelBanner> list = hotelBannerService.page(page, query);
        return ResultUtils.success("查询成功",list);
    }

}
