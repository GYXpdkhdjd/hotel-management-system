package com.itmk.web.hotel_banner.entity;

import lombok.Data;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
public class BannerListParm {
    private String title;
    private Long currentPage;
    private Long pageSize;
}
