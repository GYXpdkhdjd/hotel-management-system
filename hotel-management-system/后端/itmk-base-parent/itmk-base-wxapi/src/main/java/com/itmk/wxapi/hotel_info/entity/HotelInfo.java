package com.itmk.wxapi.hotel_info.entity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;


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
}
