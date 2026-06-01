package com.itmk.wxapi.category;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.wxapi.home.entity.CategoryVo;
import com.itmk.wxapi.home.entity.InfoVo;
import com.itmk.wxapi.hotel_info.entity.HotelInfo;
import com.itmk.wxapi.hotel_info.service.HotelInfoService;
import com.itmk.wxapi.hotel_type.entity.HotelType;
import com.itmk.wxapi.hotel_type.service.HotelTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/wxapi/category")
public class CategoryController {
    @Autowired
    private HotelInfoService hotelInfoService;
    @Autowired
    private HotelTypeService hotelTypeService;

    //分类数据
    @GetMapping("/getCategoryList")
    public ResultVo getCategoryList() {
        List<CategoryVo> voList = new ArrayList<>();
        //查询分类列表
        List<HotelType> list = hotelTypeService.list();
        if (list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                CategoryVo vo = new CategoryVo();
                vo.setName(list.get(i).getName());
                //查询分类下面的客房
                QueryWrapper<HotelInfo> query = new QueryWrapper<>();
                query.lambda().eq(HotelInfo::getTypeId, list.get(i).getTypeId());
                List<HotelInfo> infoList = hotelInfoService.list(query);
                //组装数据
                List<InfoVo> infoVos = new ArrayList<>();
                if(infoList.size() >0){
                    for (int j=0;j<infoList.size();j++){
                        InfoVo infoVo = new InfoVo();
                        infoVo.setCat(infoList.get(j).getInfoId());
                        infoVo.setIcon(infoList.get(j).getImgUrl().split(",")[0]);
                        infoVo.setKey(infoList.get(j).getInfoId());
                        infoVo.setName(infoList.get(j).getInfoName());
                        infoVos.add(infoVo);
                    }
                }
                vo.setFoods(infoVos);
                voList.add(vo);
            }
        }
        return ResultUtils.success("查询成功",voList);
    }

}
