package com.itmk.wxapi.home.entity;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Data
public class CategoryVo {
    private String name;
    private List<InfoVo> foods = new ArrayList<>();
}
