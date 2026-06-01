package com.itmk.wxapi.hotel_service.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.itmk.wxapi.hotel_service.entity.HotelService;

import java.util.List;


/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface HotelServiceService extends IService<HotelService> {
    List<HotelService> getList(Long infoId);
}
