package com.itmk.web.hotel_type.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
@TableName("hotel_type")
public class HotelType {
    @TableId(type = IdType.AUTO)
    private Long typeId;
    private String name;
    private Integer orderNum;
}
