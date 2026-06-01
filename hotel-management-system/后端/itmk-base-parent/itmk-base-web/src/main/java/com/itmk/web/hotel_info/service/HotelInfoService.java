package com.itmk.web.hotel_info.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itmk.web.hotel_info.entity.AddParm;
import com.itmk.web.hotel_info.entity.HotelInfo;
import com.itmk.web.hotel_info.entity.HotelInfoParm;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface HotelInfoService extends IService<HotelInfo> {
    void addHotel(AddParm parm);
    void editHotel(AddParm parm);
    void deleteHotel(Long infoId);
    IPage<HotelInfo> getList(HotelInfoParm parm);
}
