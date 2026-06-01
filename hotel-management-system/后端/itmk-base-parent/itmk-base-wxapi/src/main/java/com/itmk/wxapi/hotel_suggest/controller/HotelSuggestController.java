package com.itmk.wxapi.hotel_suggest.controller;

import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.wxapi.hotel_suggest.entity.HotelSuggest;
import com.itmk.wxapi.hotel_suggest.service.HotelSuggestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/wxapi/suggest")
public class HotelSuggestController {
    @Autowired
    private HotelSuggestService hotelSuggestService;

    //新增
    @PostMapping
    public ResultVo add(@RequestBody HotelSuggest suggest){
        suggest.setCreateTime(new Date());
        if(hotelSuggestService.save(suggest)){
            return ResultUtils.success("反馈成功!");
        }
        return ResultUtils.error("反馈失败!");
    }

}
