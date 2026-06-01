package com.itmk.web.hotel_info.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.itmk.web.hotel_info.entity.HotelInfo;
import com.itmk.web.hotel_info.entity.HotelInfoParm;
import org.apache.ibatis.annotations.Param;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
public interface HotelInfoMapper extends BaseMapper<HotelInfo> {
    IPage<HotelInfo> getList(IPage<HotelInfo> page,@Param("parm") HotelInfoParm parm);
}
