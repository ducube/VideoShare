package com.video.controller;

import com.video.entity.TUser;
import com.video.service.IFocusService;
import com.video.service.IUserService;
import com.video.util.MsgResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Api(tags ="前台-视频关注功能")
@RestController
@RequestMapping("focus")
public class FocusController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IFocusService focusService;

    @ApiOperation(value = "被关注用户验证获取")
    @RequestMapping(value = "focusVerify", method = RequestMethod.POST)
    public MsgResponse focusVerify(HttpSession session, String focusedId) {
        TUser user = (TUser) session.getAttribute("user");
        if(user != null && focusedId != null && !focusedId.equals("")) {
            Long userId = user.getUserId();
            Long focusedIdLong = Long.parseLong(focusedId);
            return MsgResponse.success(focusService.focusVerify(userId, focusedIdLong), null);
        }
        return MsgResponse.fail("参数错误");
    }

    @ApiOperation(value = "添加关注")
    @RequestMapping(value ="focusOn", method = RequestMethod.POST)
    public MsgResponse focusOn(HttpSession session, String focusedId) {
        TUser user = (TUser) session.getAttribute("user");
        if(user != null && focusedId != null && !focusedId.equals("")) {
            Long userId = user.getUserId();
            Long focusedIdLong = Long.parseLong(focusedId);
            return MsgResponse.success(focusService.addFocused(userId, focusedIdLong),null);
        }
        return MsgResponse.fail("参数错误");
    }

    @ApiOperation(value = "关注数据列表")
    @RequestMapping(value = "focusedList", method = RequestMethod.GET)
    public MsgResponse focusedList(HttpSession session) {
        TUser user = (TUser) session.getAttribute("user");
        if(user!=null) {
            Long userId = user.getUserId();
            List<Long> userFocusList = focusService.getUserFocusList(userId);
            List<TUser> focusList= new ArrayList<TUser>();
            for(Long focusId : userFocusList) {
                focusList.add(userService.getUserByUserId(focusId));
            }

            return MsgResponse.success("success", focusList);
        }else {
            return MsgResponse.fail("参数错误");
        }
    }
}
