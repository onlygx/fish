package com.elangzhi.fish.services;

import com.elangzhi.fish.model.Game;

import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/
public interface GameService extends BaseService<Game> {

    List<Game> list();
}
