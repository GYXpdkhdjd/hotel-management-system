package com.itmk.web.hotel_order.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date orderTime;
    private String bookTime;
    private String status;
    private String roomCount;
}
