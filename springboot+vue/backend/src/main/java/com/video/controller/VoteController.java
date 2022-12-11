package com.video.controller;

import java.util.ArrayList;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.video.entity.TVote;
import com.video.entity.TVoteLog;
import com.video.service.VoteService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Api(tags ="前台-视频投票模块")
@RestController
@RequestMapping("vote")
public class VoteController {

    @Autowired
    private VoteService voteService;

    @ApiOperation(value = "删除投票记录")
    @RequestMapping(value = "deleteVote/{id}", method = RequestMethod.GET)
    public String deleteVideo(@PathVariable Long id) {
        voteService.deleteByPrimaryKey(id);
        return "success";
    }

    @ApiOperation(value = "后台添加投票")
    @RequestMapping(value = "addVote", method = RequestMethod.POST)   //--post options
    public String addVideo(@RequestBody TVote vote) {
        voteService.insert(vote);
        return "200";
    }

    @ApiOperation(value = "投票数据分页list")
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<TVote> getPage(int pageNum, int pageSize, String voteName) {
        //调用一个pageHelper的一个静态方法
        PageHelper.startPage(pageNum, pageSize);
        List<TVote> tVotes = voteService.selectList(voteName);
        PageInfo<TVote> vidoePageInfo = new PageInfo<TVote>(tVotes);
        return vidoePageInfo;
    }

    @ApiOperation(value = "获取投票结果")
    @RequestMapping(value = "/getData", method = RequestMethod.GET)
    public  List<String> getData(Long id) {
        List<String> result = new ArrayList<>();
        TVote tVote = voteService.selectById(id);
        result.add(tVote.getOptionA());
        result.add(tVote.getOptionB());
        if(null != tVote.getOptionC() && !"".equals(tVote.getOptionC())){
            result.add(tVote.getOptionC());
        }
        if(null != tVote.getOptionD() && !"".equals(tVote.getOptionD())){
            result.add(tVote.getOptionD());
        }
        return result;
    }
}
