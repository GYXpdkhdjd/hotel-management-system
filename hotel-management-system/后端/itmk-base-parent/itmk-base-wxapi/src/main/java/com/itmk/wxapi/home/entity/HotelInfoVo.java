package com.itmk.wxapi.home.entity;


import com.itmk.wxapi.hotel_service.entity.HotelService;
import com.itmk.wxapi.hotle_room.entity.HotelRoom;
import lombok.Data;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
public class HotelInfoVo {
    private Long infoId;
    private String infoName;
    private List<String> imgUrl;
    private String infoDetails;
    private BigDecimal infoPrice;
    private List<HotelService> service = new ArrayList<>();
    private List<HotelRoom> roomList = new ArrayList<>();
}