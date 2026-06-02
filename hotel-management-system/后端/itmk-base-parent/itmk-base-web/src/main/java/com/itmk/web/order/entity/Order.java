package com.itmk.web.order.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;


@Data
@TableName("into_order")
public class Order {
    @TableId(type = IdType.AUTO)
    private Long orderId;
    private String name;
    private String phone;
    private String cardType;
    private String cardNum;
    private String sex;
    private Long roomId;
    private String roomCode;
    private String status;
    private String user;
     @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date intoTime;
     @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date leaveTime;
    private BigDecimal price;
}
