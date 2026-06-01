package com.itmk.web.hotle_room.entity;

import lombok.Data;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
public class TotalVo {
    private Integer noBookCount;
    private Integer hasBookCount;
    private Integer hasIntoCount;
    private Integer hasRepirCount;
    private Integer hasStopCount;
    private Integer totalCount;
}
