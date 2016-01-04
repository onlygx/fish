package com.elangzhi.fish.controller.person;

import com.elangzhi.fish.controller.json.Tip;
import com.elangzhi.fish.model.Game;
import com.elangzhi.fish.model.Room;
import com.elangzhi.fish.services.RoomService;
import com.elangzhi.fish.tools.UUIDFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author GaoXiang
 * @time 2016/1/3 0003
 **/
@Controller
@RequestMapping("/room")
public class RoomController {

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Tip save(
            @RequestParam(value="name", required=false) String name,
            @RequestParam(value="gameId", required=false) Long gameId,
            @RequestParam(value="parentId", required=false) Long parentId
    ){
        Room room = new Room();
        try {
            room.setId(UUIDFactory.getLongId());
            room.setName(name);
            room.setGameId(gameId);
            room.setParentId(parentId);
            roomService.save(room);
        }catch (Exception e){
            return new Tip(1);
        }
        return new Tip();
    }



    @Resource
    RoomService roomService;
}
