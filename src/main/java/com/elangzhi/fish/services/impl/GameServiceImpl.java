package com.elangzhi.fish.services.impl;

import com.elangzhi.fish.dao.GameMapper;
import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.services.GameService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/
@Service("gameService")
public class GameServiceImpl implements GameService {

    @Resource
    GameMapper gameMapper;

    @Override
    public Integer save(Game game) {
        return gameMapper.insertSelective(game);
    }

    @Override
    public Integer deleteById(Long id) {
        return gameMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Game findById(Long id) {
        return gameMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer updateById(Game game) {
        return null;
    }

    @Override
    public List<Game> list() {

        return gameMapper.list();
    }
}
