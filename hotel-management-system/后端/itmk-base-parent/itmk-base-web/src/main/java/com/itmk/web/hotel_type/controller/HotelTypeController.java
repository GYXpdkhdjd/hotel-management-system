package com.itmk.web.hotel_type.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.web.hotel_service.entity.HotelPage;
import com.itmk.web.hotel_type.entity.HotelType;
import com.itmk.web.hotel_type.service.HotelTypeService;
import com.itmk.web.sys_role.entity.SelectType;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/api/type")
public class HotelTypeController {
    @Autowired
    private HotelTypeService hotelTypeService;

    //新增
    @PostMapping
    public ResultVo add(@RequestBody HotelType type) {
        if (hotelTypeService.save(type)) {
            return ResultUtils.success("新增成功!");
        }
        return ResultUtils.error("新增失败!");
    }

    //编辑
    @PutMapping
    public ResultVo edit(@RequestBody HotelType type) {
        if (hotelTypeService.updateById(type)) {
            return ResultUtils.success("编辑成功!");
        }
        return ResultUtils.error("编辑失败!");
    }

    //删除
    @DeleteMapping("/{typeId}")
    public ResultVo delete(@PathVariable("typeId") Long typeId) {
        if (hotelTypeService.removeById(typeId)) {
            return ResultUtils.success("删除成功!");
        }
        return ResultUtils.error("删除失败!");
    }

    //列表
    @GetMapping("/list")
    public ResultVo list(HotelPage parm){
        //构造分页对象
        IPage<HotelType> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        //构造查询条件
        QueryWrapper<HotelType> query = new QueryWrapper<>();
        if(StringUtils.isNotEmpty(parm.getName())){
            query.lambda().like(HotelType::getName,parm.getName());
        }
        IPage<HotelType> list = hotelTypeService.page(page, query);
         return ResultUtils.success("查询成功!",list);
    }
    //类型下拉列表
    @GetMapping("/getSelectList")
    public ResultVo getSelectList(){
        List<HotelType> list = hotelTypeService.list();
        //组装下拉数据需要的格式
        List<SelectType> selectList = new ArrayList<>();
        Optional.ofNullable(list).orElse(new ArrayList<>())
                .stream()
                .forEach(item ->{
                    SelectType type = new SelectType();
                    type.setLabel(item.getName());
                    type.setValue(item.getTypeId());
                    selectList.add(type);
                });
        return ResultUtils.success("查询成功",selectList);
    }
}
