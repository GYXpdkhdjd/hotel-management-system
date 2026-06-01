package com.itmk.wxapi.hotel_order.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
@TableName("hotel_order")
public class HotelOrder {
    @TableId(type = IdType.AUTO)
    private Long orderId;
    private String openid;
    private String name;
    private String phone;
    private String idCard;
    private String roomId;
    private String roomCode;
    private Date orderTime;
    private String bookTime;
    private String status;
    private String roomCount;
}
