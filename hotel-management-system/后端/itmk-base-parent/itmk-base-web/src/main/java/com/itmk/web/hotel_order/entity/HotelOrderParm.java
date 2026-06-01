package com.itmk.web.hotel_order.entity;

import lombok.Data;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
public class HotelOrderParm {
    private Long currentPage;
    private Long pageSize;
    private String name;
    private String phone;
}
