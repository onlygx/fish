package com.elangzhi.fish.controller.person;

import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.model.Person;
import com.elangzhi.fish.services.GameService;
import com.elangzhi.fish.services.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
        return new ModelAndView("game-list",model);
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
        return new ModelAndView("game-show",model);
    }

    //-------- Service ---------

    @Resource
    GameService gameService;

    @Resource
    PersonService personService;
}
