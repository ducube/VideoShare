package com.video.controller;

import com.video.entity.TUser;
import com.video.entity.TVideo;
import com.video.service.ICollectionService;
import com.video.util.MsgResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@Api(tags ="前台-视频收藏功能")
@RestController
@RequestMapping("collection")
public class CollectionController {

    @Autowired
    private ICollectionService collectionService;

    @ApiOperation(value = "添加收藏")
    @RequestMapping(value ="addCollection", method = RequestMethod.POST)
    public MsgResponse addCollection(HttpSession session, String videoId) {
        TUser user = (TUser) session.getAttribute("user");
        if(user != null && videoId.matches("[0-9]*")) {
            return MsgResponse.success(collectionService.addCollection(user.getUserId(), Long.parseLong(videoId)), null);
        }
        return MsgResponse.fail("用户未登录或者不可对自己视频进行收藏");
    }

    @ApiOperation(value = "验证用户登录才可进行收藏")
    @RequestMapping(value = "vertifyIfCollection", method = RequestMethod.POST)
    public MsgResponse vertifyIfCollection(HttpSession session, String videoId) {
        TUser user = (TUser) session.getAttribute("user");
        if(user != null && videoId.matches("[0-9]*")) {
            return MsgResponse.success(collectionService.vertifyIfCollection(user.getUserId(), Long.parseLong(videoId)), null);
        }
        return MsgResponse.fail("用户未登录");
    }

    @ApiOperation(value = "获取收藏列表数据")
    @RequestMapping(value ="getAllCollection", method = RequestMethod.GET)
    @ResponseBody
    public MsgResponse getAllCollection(HttpSession session) {
        TUser user = (TUser) session.getAttribute("user");
        if(user != null){
            List<TVideo> collection = collectionService.getAllCollection(user.getUserId());
            if(collection != null) {
                return MsgResponse.success("获取收藏列表成功", collection);
            }
            else {
                return MsgResponse.fail("获取收藏列表失败");
            }
        }else {
            return MsgResponse.fail("当前用户不存在，请登录！");
        }
    }

    @ApiOperation(value = "取消收藏")
    @RequestMapping(value = "deleteCollection", method = RequestMethod.POST)
    @ResponseBody
    public MsgResponse deleteCollection(HttpSession session, Long videoId) {
        TUser user = (TUser) session.getAttribute("user");
        if(user != null) {
            return MsgResponse.success(collectionService.deleteCollection(user.getUserId(), videoId),null);
        }else {
            return MsgResponse.fail("用户未登录或视频ID错误");
        }
    }
}
