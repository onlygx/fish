package com.elangzhi.fish.services.impl;

import com.elangzhi.fish.dao.PersonMapper;
import com.elangzhi.fish.model.Person;
import com.elangzhi.fish.services.PersonService;
import jdk.nashorn.internal.ir.annotations.Reference;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/
@Service("personService")
public class PersonServiceImpl implements PersonService {

    @Resource
    PersonMapper personMapper;


    @Override
    public Integer save(Person person) {
        return personMapper.insertSelective(person);
    }

    @Override
    public Integer deleteById(Long id) {
        return personMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Person findById(Long id) {
        return personMapper.selectByPrimaryKey(id);
    }

    @Override
    public Integer updateById(Person person) {
        return personMapper.updateByPrimaryKey(person);
    }

    @Override
    public List<Person> list(Integer type, Long gameId) {
        return personMapper.list(type,gameId);
    }
}
