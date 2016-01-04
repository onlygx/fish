package com.elangzhi.fish.controller.person;

import com.elangzhi.fish.controller.json.Tip;
import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.model.Person;
import com.elangzhi.fish.model.Room;
import com.elangzhi.fish.services.GameService;
import com.elangzhi.fish.services.PersonService;
import com.elangzhi.fish.services.RoomService;
import com.elangzhi.fish.tools.UUIDFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/
@Controller
@RequestMapping("/game")
public class GameController {

    @RequestMapping("/list")
    public ModelAndView showCall(HttpServletRequest request, ModelMap model){

        List<Game> list = gameService.list();
        model.put("list",list);
        return new ModelAndView("game/game-list",model);
    }

    @RequestMapping("/{id}")
    public ModelAndView show(@PathVariable Long id,HttpServletRequest request, ModelMap model){

        Game game = gameService.findById(id);
        //
        List<Person> persons1 = personService.list(1,id);
        List<Person> persons2 = personService.list(2,id);
        List<Person> persons3 = personService.list(3,id);

        model.put("obj",game);
        model.put("personList1",persons1);
        model.put("personList2",persons2);
        model.put("personList3",persons3);
        return new ModelAndView("game/game-show",model);
    }

    @RequestMapping("/setting/{id}")
    public ModelAndView setting(@PathVariable Long id,HttpServletRequest request, ModelMap model){
        //比赛信息
        Game game = gameService.findById(id);
        //裁判和参赛人员信息
        List<Person> persons1 = personService.list(1,id);
        List<Person> persons2 = personService.list(2,id);
        List<Person> persons3 = personService.list(3,id);
        //湖、钓区、钓位
        List<Room> rooms = roomService.listAll(game.getId());

        model.put("obj",game);
        model.put("personList1",persons1);
        model.put("personList2",persons2);
        model.put("personList3",persons3);
        model.put("rooms",rooms);
        return new ModelAndView("game/game-setting",model);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Tip save(
            @RequestParam(value="name", required=false) String name,
            @RequestParam(value="intro", required=false) String intro
    ){
        Game game = new Game();
        try {
            game.setId(UUIDFactory.getLongId());
            game.setIntro(intro);
            game.setName(name);
            game.setSetTime(new Date());
            gameService.save(game);

        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Tip delete(@RequestParam(value="id", required=false) Long id){

        try {
            gameService.deleteById(id);
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }



    //-------- Service ---------

    @Resource
    GameService gameService;

    @Resource
    PersonService personService;

    @Resource
    RoomService roomService;
}
