package com.itmk.web.order.entity;

import lombok.Data;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
public class OrderParm {
    private Long currentPage;
    private Long pageSize;
    private String name;
    private String phone;
    private String idCard;
}