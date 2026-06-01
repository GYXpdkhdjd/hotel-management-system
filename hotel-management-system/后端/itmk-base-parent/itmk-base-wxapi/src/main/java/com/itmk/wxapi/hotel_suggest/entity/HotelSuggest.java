package com.itmk.wxapi.hotel_suggest.entity;

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
@TableName("hotel_suggest")
public class HotelSuggest {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String title;
    private String context;
    private String openid;
    private Date createTime;
}
