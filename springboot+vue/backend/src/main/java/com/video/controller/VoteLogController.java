package com.video.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.video.entity.TUser;
import com.video.entity.TVote;
import com.video.entity.TVoteLog;
import com.video.service.VoteLogService;
import com.video.service.VoteService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Api(tags ="后台-视频投票管理")
@RestController
@RequestMapping("voteLog")
public class VoteLogController {

    @Autowired
    private VoteLogService voteLogService;

    @Autowired
    private VoteService voteService;

    @ApiOperation(value = "给投票选项选票")
    @RequestMapping(value = "/addLog", method = RequestMethod.POST)
    public String addVideo(@RequestBody TVoteLog voteLog, HttpSession session) {
        TUser user = (TUser)session.getAttribute("user");
        voteLog.setUserId(user.getUserId());
        voteLogService.insert(voteLog);
        return "200";
    }

    @ApiOperation(value = "模糊查询投票结果")
    @RequestMapping(value = "/getList", method = RequestMethod.GET)
    public  List<TVoteLog> getList(TVoteLog voteLog) {
        List<TVoteLog> tVoteLogs = voteLogService.selectList(voteLog);
        return tVoteLogs;
    }

    @ApiOperation(value = "获取投票结果")
    @RequestMapping(value = "/getData", method = RequestMethod.GET)
    public  List<Integer> getData(Long id) {
        List<Integer> result = new ArrayList<>();
        TVoteLog log = new TVoteLog();
        log.setVoteId(id);
        List<TVoteLog> tVoteLogs = voteLogService.selectList(log);
        int a=0,b=0,c=0,d=0;
        for (TVoteLog tVoteLog : tVoteLogs) {
            if("A".equals(tVoteLog.getAnswer())){
                a++;
            }else if("B".equals(tVoteLog.getAnswer())){
                b++;
            }else if("C".equals(tVoteLog.getAnswer())){
                c++;
            }else if("D".equals(tVoteLog.getAnswer())){
                d++;
            }
        }
        TVote tVote = voteService.selectById(id);
        result.add(a);
        result.add(b);
        if(null != tVote.getOptionC() && !"".equals(tVote.getOptionC())){
            result.add(c);
        }
        if(null != tVote.getOptionD() && !"".equals(tVote.getOptionD())){
            result.add(d);
        }
        return result;
    }
}

