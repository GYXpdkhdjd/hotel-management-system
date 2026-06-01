package com.itmk.wxapi.hotel_service.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itmk.wxapi.hotel_service.entity.HotelService;
import com.itmk.wxapi.hotel_service.mapper.HotelServiceMapper;
import com.itmk.wxapi.hotel_service.service.HotelServiceService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Service
public class HotelServiceServiceImpl extends ServiceImpl<HotelServiceMapper, HotelService> implements HotelServiceService {
    @Override
    public List<HotelService> getList(Long infoId) {
        return this.baseMapper.getList(infoId);
    }
}
