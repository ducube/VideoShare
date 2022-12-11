package com.video.controller;

import com.video.entity.TUser;
import com.video.entity.TVideo;
import com.video.service.IRecordService;
import com.video.util.MsgResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@Api(tags ="前台-播放记录管理")
@RequestMapping("record")
@RestController
public class RecordController {

    @Autowired
    private IRecordService recordService;

    @ApiOperation(value = "删除一条观看记录")
    @RequestMapping(value = "removeRecord",method = RequestMethod.POST)
    public MsgResponse removeRecord(Long videoId, HttpSession session) {
        TUser user = (TUser) session.getAttribute("user");
        if (user != null) {
            return MsgResponse.success(recordService.deleteRecordById(user.getUserId(),videoId), null);
        }
        return MsgResponse.fail("删除失败");
    }

    @ApiOperation(value = "获取播放记录列表")
    @RequestMapping(value = "getAllRecord",method = RequestMethod.GET)
    public MsgResponse getAllRecord(HttpSession session) {
        TUser user = (TUser) session.getAttribute("user");
        if(user != null) {
            List<TVideo> records = recordService.getAllRecord(user.getUserId());
            if(records != null) {
                return MsgResponse.success("获取记录列表成功", records);
            }
            else {
                return MsgResponse.fail("获取记录列表失败");
            }
        }else {
            return MsgResponse.fail("当前用户不存在，请登录！");
        }
    }
}
