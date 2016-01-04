package com.elangzhi.fish.services;

import com.elangzhi.fish.model.Room;

import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/
public interface RoomService extends BaseService<Room> {

    /**
     * 根据父级Id获取
     * @param gameId
     * @return
     */
    List<Room> list(Long gameId);

    /**
     * 根据比赛id获取分级列表
     * @param gameId
     * @return
     */
    List<Room> listAll(Long gameId);
}
