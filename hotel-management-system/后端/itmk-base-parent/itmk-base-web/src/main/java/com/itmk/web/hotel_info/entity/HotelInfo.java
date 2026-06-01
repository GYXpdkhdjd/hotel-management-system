package com.itmk.web.hotel_info.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.itmk.web.hotle_room.entity.HotelRoom;
import lombok.Data;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
@TableName("hotel_info")
public class HotelInfo {
    @TableId(type = IdType.AUTO)
    private Long infoId;
    private Long typeId;
    private String infoName;
    private String imgUrl;
    private String infoDetails;
    private BigDecimal infoPrice;
    private Integer infoBed;
    private Integer infoCount;
    private Integer orderNum;
    private boolean infoStatus;
    private boolean toIndex;
    @TableField(exist = false)
    private String typeName;
    @TableField(exist = false)
    private List<HotelRoom> roomList = new ArrayList<>();
}
