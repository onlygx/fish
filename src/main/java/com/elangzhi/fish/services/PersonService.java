package com.elangzhi.fish.services;

import com.elangzhi.fish.model.Person;

import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/
public interface PersonService extends BaseService<Person> {
    List<Person> list(Integer type,Long gameId);
}
