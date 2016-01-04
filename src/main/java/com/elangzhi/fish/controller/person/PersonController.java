package com.elangzhi.fish.controller.person;

import com.elangzhi.fish.controller.json.Tip;
import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.model.Person;
import com.elangzhi.fish.model.Room;
import com.elangzhi.fish.services.PersonService;
import com.elangzhi.fish.tools.UUIDFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/

@Controller
@RequestMapping("/person")
public class PersonController {

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Tip save(
            @RequestParam(value="name", required=false) String name,
            @RequestParam(value="type", required=false) Integer type,
            @RequestParam(value="gameId", required=false) Long gameId
    ){
        Person person = new Person();
        try {
            person.setId(UUIDFactory.getLongId());
            person.setName(name);
            person.setGameId(gameId);
            person.setType(type);
            personService.save(person);
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }

    @RequestMapping(value = "/updateRoom", method = RequestMethod.POST)
    @ResponseBody
    public Tip updateRoom(
            @RequestParam(value="rooms", required=false) String rooms,
            @RequestParam(value="persons", required=false) String persons
    ){

        try {
            String[] roomArray = rooms.split(",");
            String[] personArray = persons.split(",");
            if(roomArray.length == personArray.length){
                for(int i = 0 ; i < roomArray.length ; i ++){
                    try{
                        Person person = personService.findById(Long.parseLong(personArray[i]));
                        person.setRoomId(Long.parseLong(roomArray[i]));
                        personService.updateById(person);
                    }catch (Exception e){
                        return new Tip(3);
                    }

                }
            }else{
                return new Tip(2);
            }
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Tip delete(@RequestParam(value="id", required=false) Long id){

        try {
            personService.deleteById(id);
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }

    @RequestMapping("/{id}")
    public ModelAndView show(@PathVariable Long id, HttpServletRequest request, ModelMap model){

        Person person = personService.findById(id);
        model.put("obj",person);
        return new ModelAndView("person/person-show",model);
    }


    @Resource
    PersonService personService;
}
