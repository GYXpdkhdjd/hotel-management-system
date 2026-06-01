package com.itmk.wxapi.hotel_order.entity;

import lombok.Data;

import java.util.Date;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
public class OrderVo {
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
    private String infoName;
    private String infoId;
    private String imgUrl;
}
