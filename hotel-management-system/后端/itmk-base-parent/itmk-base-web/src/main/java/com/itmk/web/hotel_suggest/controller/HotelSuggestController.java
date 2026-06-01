package com.itmk.web.hotel_suggest.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.hotel_suggest.entity.HotelSuggest;
import com.itmk.web.hotel_suggest.entity.SuggestParm;
import com.itmk.web.hotel_suggest.service.HotelSuggestService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/api/suggest")
public class HotelSuggestController {
    @Autowired
    private HotelSuggestService hotelSuggestService;

    //列表
    @GetMapping("/getList")
    public ResultVo getList(SuggestParm parm){
        //构造分页对象
        IPage<HotelSuggest> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        //构造查询条件
        QueryWrapper<HotelSuggest> query = new QueryWrapper<>();
        query.lambda().like(StringUtils.isNotEmpty(parm.getTitle()),HotelSuggest::getTitle,parm.getTitle())
                .or()
                .like(StringUtils.isNotEmpty(parm.getTitle()),HotelSuggest::getContext,parm.getTitle())
                .orderByDesc(HotelSuggest::getCreateTime);
        IPage<HotelSuggest> list = hotelSuggestService.page(page, query);
        return ResultUtils.success("查询成功",list);
    }

}
