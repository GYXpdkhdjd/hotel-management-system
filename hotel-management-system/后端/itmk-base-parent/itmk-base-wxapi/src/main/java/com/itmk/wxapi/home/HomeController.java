package com.itmk.wxapi.home;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.itmk.utils.ResultUtils;
import com.itmk.utils.ResultVo;
import com.itmk.wxapi.home.entity.HotelInfoVo;
import com.itmk.wxapi.hotel_banner.entity.HotelBanner;
import com.itmk.wxapi.hotel_banner.service.HotelBannerService;
import com.itmk.wxapi.hotel_info.entity.HotelInfo;
import com.itmk.wxapi.hotel_info.service.HotelInfoService;
import com.itmk.wxapi.hotel_order.entity.OrderParm;
import com.itmk.wxapi.hotel_order.entity.OrderVo;
import com.itmk.wxapi.hotel_order.service.HotelOrderService;
import com.itmk.wxapi.hotel_service.entity.HotelService;
import com.itmk.wxapi.hotel_service.service.HotelServiceService;
import com.itmk.wxapi.hotle_room.entity.HotelRoom;
import com.itmk.wxapi.hotle_room.service.HotleRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@RestController
@RequestMapping("/wxapi/home")
public class HomeController {
    @Autowired
    private HotelBannerService hotelBannerService;
    @Autowired
    private HotelInfoService hotelInfoService;
    @Autowired
    private HotelServiceService hotelServiceService;
    @Autowired
    private HotleRoomService hotleRoomService;
    @Autowired
    private HotelOrderService hotelOrderService;
    //首页轮播图
    @GetMapping("/swipperList")
    public ResultVo swipperList(){
        //构造查询条件
        QueryWrapper<HotelBanner> query = new QueryWrapper<>();
        query.lambda().eq(HotelBanner::isStatus,1);
        List<HotelBanner> list = hotelBannerService.list(query);
        return ResultUtils.success("查询成功",list);
    }

    //首页热推
    @GetMapping("/getHotList")
    public ResultVo getHotList(){
        //构造查询条件
        QueryWrapper<HotelInfo> query = new QueryWrapper<>();
        query.lambda().eq(HotelInfo::isToIndex,1);
        List<HotelInfo> list = hotelInfoService.list(query);
        return ResultUtils.success("查询成功",list);
    }

    //根据客房id查询客房详情
    @GetMapping("/getInfoById")
    public ResultVo getInfoById(Long infoId){
        HotelInfoVo vos = new HotelInfoVo();
        //根据id查询客房信息
        HotelInfo hotelInfo = hotelInfoService.getById(infoId);
        vos.setImgUrl(Arrays.asList(hotelInfo.getImgUrl().split(",")));
        vos.setInfoDetails(hotelInfo.getInfoDetails());
        vos.setInfoPrice(hotelInfo.getInfoPrice());
        vos.setInfoName(hotelInfo.getInfoName());
        //查询服务信息
        List<HotelService> serviceList = hotelServiceService.getList(infoId);
        vos.setService(serviceList);
        //查询客客房的房间
        QueryWrapper<HotelRoom> query = new QueryWrapper<>();
        query.lambda().eq(HotelRoom::getInfoId,infoId).eq(HotelRoom::getBookStatus,0);
        List<HotelRoom> roomList = hotleRoomService.list(query);
        vos.setRoomList(roomList);
        return ResultUtils.success("查询成功",vos);
    }

    //查询订单
    @GetMapping("/getOrderList")
    public ResultVo getOrderList(OrderParm parm){
        IPage<OrderVo> list = hotelOrderService.getOrderList(parm);
        return ResultUtils.success("查询成功",list);
    }

}
