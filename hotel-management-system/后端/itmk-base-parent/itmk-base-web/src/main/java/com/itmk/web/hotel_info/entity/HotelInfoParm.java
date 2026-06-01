package com.itmk.web.hotel_info.entity;

import lombok.Data;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
public class HotelInfoParm {
    private Long currentPage;
    private Long pageSize;
    private String infoName;
}
