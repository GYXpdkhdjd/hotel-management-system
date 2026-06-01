package com.itmk.web.hotel_info.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itmk.utils.BusinessException;
import com.itmk.web.hotel_info.entity.AddParm;
import com.itmk.web.hotel_info.entity.HotelInfo;
import com.itmk.web.hotel_info.entity.HotelInfoParm;
import com.itmk.web.hotel_info.mapper.HotelInfoMapper;
import com.itmk.web.hotel_info.service.HotelInfoService;
import com.itmk.web.hotel_info_service.entity.HotelServiceSelect;
import com.itmk.web.hotel_info_service.service.HotelServiceSelectService;
import com.itmk.web.hotle_room.entity.HotelRoom;
import com.itmk.web.hotle_room.service.HotleRoomService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Author java实战基地
 * @Version 2383404558
 */
@Service
public class HotelInfoServiceImpl extends ServiceImpl<HotelInfoMapper, HotelInfo> implements HotelInfoService {
    @Resource
    private HotelServiceSelectService hotelServiceSelectService;
    @Autowired
    private HotleRoomService hotleRoomService;

    @Override
    @Transactional
    public void addHotel(AddParm parm) {
        //保存客房信息
        HotelInfo hotel = new HotelInfo();
        BeanUtils.copyProperties(parm,hotel);
        int insert = this.baseMapper.insert(hotel);
        if(insert > 0){
            //保存服务信息
            List<Long> checkService = parm.getCheckService();
            List<HotelServiceSelect> selectList = new ArrayList<>();
            for (int i = 0; i < checkService.size(); i++) {
                HotelServiceSelect select = new HotelServiceSelect();
                select.setInfoId(hotel.getInfoId());
                select.setServiceId(checkService.get(i));
                selectList.add(select);
            }
            hotelServiceSelectService.saveBatch(selectList);
            //保存房间信息
            int start = parm.getStart();
            List<HotelRoom> list = new ArrayList<>();
            List<String> codeList = new ArrayList<>();
            if(parm.getEnd() == null){ //说明只有一间房间
                HotelRoom room = new HotelRoom();
                room.setInfoId(hotel.getInfoId());
                room.setRoomCode(Integer.toString(start));
                codeList.add(Integer.toString(start));
                list.add(room);
            }else{
                while (start <= parm.getEnd()){
                    HotelRoom room = new HotelRoom();
                    room.setInfoId(hotel.getInfoId());
                    room.setRoomCode(Integer.toString(start));
                    codeList.add(Integer.toString(start));
                    list.add(room);
                    //不能少了
                    start = start + 1;
                }
            }
            //判断编号是否重复
            QueryWrapper<HotelRoom> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().in(HotelRoom::getRoomCode, codeList);
            List<HotelRoom> rooms = hotleRoomService.list(queryWrapper);
            if(rooms.size() >0){
                List<String> collect = rooms.stream().map(item -> item.getRoomCode()).collect(Collectors.toList());
                //返回错误信息
                throw  new BusinessException(500,"编号"+collect+"重复，请重新设置编号!");
            }
            hotleRoomService.saveBatch(list);
        }
    }

    @Override
    public void editHotel(AddParm parm) {
        //更新客房信息
        HotelInfo hotel = new HotelInfo();
        BeanUtils.copyProperties(parm,hotel);
        int insert = this.baseMapper.updateById(hotel);
        if(insert > 0){
            //先删除原来的
            QueryWrapper<HotelServiceSelect> query = new QueryWrapper<>();
            query.lambda().eq(HotelServiceSelect::getInfoId,hotel.getInfoId());
            hotelServiceSelectService.remove(query);
            //保存服务信息
            List<Long> checkService = parm.getCheckService();
            List<HotelServiceSelect> selectList = new ArrayList<>();
            for (int i = 0; i < checkService.size(); i++) {
                HotelServiceSelect select = new HotelServiceSelect();
                select.setInfoId(hotel.getInfoId());
                select.setServiceId(checkService.get(i));
                selectList.add(select);
            }
            hotelServiceSelectService.saveBatch(selectList);
        }
    }

    @Override
    @Transactional
    public void deleteHotel(Long infoId) {
        //先删除主表
        int i = this.baseMapper.deleteById(infoId);
        //删除服务
        if(i>0){
            QueryWrapper<HotelServiceSelect> query = new QueryWrapper<>();
            query.lambda().eq(HotelServiceSelect::getInfoId,infoId);
            hotelServiceSelectService.remove(query);
        }
    }

    @Override
    public IPage<HotelInfo> getList(HotelInfoParm parm) {
        //构造分页对象
        IPage<HotelInfo> page = new Page<>(parm.getCurrentPage(),parm.getPageSize());
        return this.baseMapper.getList(page,parm);
    }
}
