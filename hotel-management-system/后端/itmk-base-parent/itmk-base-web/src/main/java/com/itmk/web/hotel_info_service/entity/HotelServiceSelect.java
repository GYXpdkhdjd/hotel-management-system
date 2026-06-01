package com.itmk.web.hotel_info_service.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
@TableName("hotel_info_service")
public class HotelServiceSelect {
    @TableId(type = IdType.AUTO)
    private Long infoServiceId;
    private Long infoId;
    private Long serviceId;
}
