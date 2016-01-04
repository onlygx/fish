package com.elangzhi.fish.dao;

import com.elangzhi.fish.model.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomMapper {

    int deleteByPrimaryKey(Long id);

    int insert(Room record);

    int insertSelective(Room record);

    Room selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Room record);

    int updateByPrimaryKey(Room record);

    List<Room> list(@Param("gameId")Long gameId);

    List<Room> listByParentId(@Param("parentId")Long parentId);
}