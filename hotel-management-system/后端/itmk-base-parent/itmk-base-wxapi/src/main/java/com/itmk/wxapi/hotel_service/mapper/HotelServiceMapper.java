package com.itmk.wxapi.hotel_service.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.itmk.wxapi.hotel_service.entity.HotelService;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface HotelServiceMapper extends BaseMapper<HotelService> {
    List<HotelService> getList(@Param("infoId") Long infoId);
}
