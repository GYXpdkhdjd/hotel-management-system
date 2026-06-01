package com.itmk.wxapi.hotle_room.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
@TableName("hotel_room")
public class HotelRoom {
    @TableId(type = IdType.AUTO)
    private Long roomId;
    private Long infoId;
    private String roomCode;
    private String intoStatus;
    private String bookStatus;
    private String useStatus;
}
