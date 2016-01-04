package com.elangzhi.fish.services.impl;

import com.elangzhi.fish.dao.RoomMapper;
import com.elangzhi.fish.model.Room;
import com.elangzhi.fish.services.RoomService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/

@Service("roomService")
public class RoomServiceImpl implements RoomService {

    @Resource
    RoomMapper roomMapper;

    @Override
    public Integer save(Room room) {
        return roomMapper.insertSelective(room);
    }

    @Override
    public Integer deleteById(Long id) {
        return roomMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Room findById(Long id) {
        return roomMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer updateById(Room room) {
        return roomMapper.updateByPrimaryKey(room);
    }

    @Override
    public List<Room> list(Long gameId) {
        return roomMapper.list(gameId);
    }

    @Override
    public List<Room> listAll(Long gameId) {
        List<Room> list = roomMapper.list(gameId);
        for(Room r1 : list){
            r1.setChild(roomMapper.listByParentId(r1.getId()));
            for(Room r2 : r1.getChild()){
                r2.setChild(roomMapper.listByParentId(r2.getId()));
            }
        }
        return list;
    }
}
