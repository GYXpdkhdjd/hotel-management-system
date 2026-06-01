package com.itmk.web.hotel_banner.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
@TableName("hotel_banner")
public class HotelBanner {
    @TableId(type = IdType.AUTO)
    private Long banId;
    private Long infoId;
    private String title;
    private String images;
    private boolean status;
}
