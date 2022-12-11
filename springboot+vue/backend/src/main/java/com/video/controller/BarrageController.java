package com.video.controller;

import com.video.entity.TUser;
import com.video.socketserver.BarrageWebSocket;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Api(tags ="前台-发送弹幕功能")
@Controller
@RequestMapping("barrage")
public class BarrageController {

    @ApiOperation(value = "根据视频id队视频发送弹幕")
    @RequestMapping(value = "sendGroupMessage/{videoId}", method = RequestMethod.POST)
    public Map<String, Object> groupMessage(HttpSession session, @PathVariable Integer videoId, @RequestParam String message) {
        Map<String, Object> res = new HashMap<>();
        TUser sendUser = (TUser) session.getAttribute("user");
        if (sendUser != null && !message.equals("")) {
            // 接受消息message 进行组发
            BarrageWebSocket.sendGroupMessage(sendUser.getUserName(), videoId, message);
            res.put("code", 200);
            res.put("msg", "success");
        }
        res.put("code", 500);
        res.put("msg", "error");
        return res;
    }
}
