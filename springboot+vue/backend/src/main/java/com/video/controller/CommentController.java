package com.video.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.video.entity.Comment;
import com.video.entity.TUser;
import com.video.service.CommentService;
import com.video.util.MsgResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Api(tags ="前台-视频评论功能")
@RequestMapping("recomm")
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    //评论功能
    @ApiOperation(value = "发表评论-wait")
    @RequestMapping(value = "/comment",method = RequestMethod.POST)
    @ResponseBody
    public MsgResponse comment(HttpSession session, @RequestBody Comment comment){
        TUser user = (TUser)session.getAttribute("user");
        if(null != user){
            comment.setUserId(user.getUserId());
            comment.setCommentDate(new Date());
            commentService.insertComment(comment);
        }

        return MsgResponse.success("评论成功", null);
    }

    @ApiOperation(value = "显示评论list-wait")
    @RequestMapping(value = "/list",method = RequestMethod.POST)
    public String getList(HttpSession session,Model model, @RequestParam Long videoId){
        List<Comment> list = commentService.getList(videoId);
        for (Comment comment : list) {
            List<Comment> child = commentService.selectByParentId(comment.getId());
            comment.setReplies(child);
        }
        model.addAttribute("commentList",list);
        return "videoplay::commentfg";
    }
}
