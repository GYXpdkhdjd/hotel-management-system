package com.itmk.web.hotel_suggest.entity;

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
@TableName("hotel_suggest")
public class HotelSuggest {
    @TableId(type = IdType.AUTO)
    private Long id;
    private String title;
    private String context;
    private String openid;
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime;
}
