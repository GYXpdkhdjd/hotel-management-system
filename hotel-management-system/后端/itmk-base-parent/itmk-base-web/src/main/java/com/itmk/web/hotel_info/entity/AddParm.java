package com.itmk.web.hotel_info.entity;

import lombok.Data;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
public class AddParm {
    private Long infoId;
    private Long typeId;
    private String infoName;
    private String imgUrl;
    private String infoDetails;
    private BigDecimal infoPrice;
    private Integer infoBed;
    private Integer infoCount;
    private boolean infoStatus;
    private boolean toIndex;
    private Integer start;
    private Integer orderNum;
    private Integer end;
    private List<Long> checkService = new ArrayList<>();
}
