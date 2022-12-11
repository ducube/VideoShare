package com.video.controller;

import com.video.entity.Comment;
import com.video.entity.TState;
import com.video.entity.TUser;
import com.video.entity.TVideo;
import com.video.entity.TVideotype;
import com.video.service.*;
import com.video.util.DateUtil;
import com.video.util.MsgResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;

// url : 127.0.0.1/video?vidoeId=1
@Api(tags ="前台-视频管理模块")
@RequestMapping("video")
@Controller
public class VideoController {

    @Autowired
    private IVideoService videoService;

    @Autowired
    private IRecordService recordService;

    @Autowired
    private IUserService userService;

    @Autowired
    private IVideoTypeService videoTypeService;

    @Autowired
    private IStateService stateService;

    @Autowired
    private CommentService commentService;

    private static String uVideoTitle;

    @ApiOperation(value = "跳转到视频中心")
    @RequestMapping(value = "toVideoCenter",method = RequestMethod.GET)
    public String toVideoCenter() {
        return "videoCenter";
    }

    @ApiOperation(value = "根据分类id，获得视频信息")
    @RequestMapping(value = "getVideoByType",method = RequestMethod.GET)
    @ResponseBody
    public List<TVideo> getVideoByType(Long videoTypeId) {
        return videoService.getVideoByVideoTypeId(videoTypeId);
    }


    @ApiOperation(value = "根据视频发布时间，降序排列，返回视频信息")
    @RequestMapping(value = "getIndexLastVideo",method = RequestMethod.GET)
    @ResponseBody
    public List<TVideo> getIndexLastVideo() {
        List<TVideo> indexLastVideo = videoService.getIndexLastVideo();
        return indexLastVideo;
    }

    @ApiOperation(value = "获取所有视频")
    @RequestMapping(value = "getAllVideo",method = RequestMethod.GET)
    @ResponseBody
    public List<TVideo> getAllVideo() {
        List<TVideo> indexLastVideo = videoService.getAllPassVideo();
        return indexLastVideo;
    }

    @ApiOperation(value = "根据用户id，返回用户发布视频信息")
    @RequestMapping(value = "getVideoListByUserId",method = RequestMethod.GET)
    @ResponseBody
    public MsgResponse getVideoListByUserId(Long userId) {
        List<TVideo> videoList = videoService.getVideoListByUserId(userId);
        if (videoList != null) {
            return MsgResponse.success("success", videoList);
        }
        return MsgResponse.fail("fail");
    }

    @ApiOperation(value = "根据视频标题（部分即可），返回视频信息")
    @RequestMapping(value = "search",method = RequestMethod.POST)
    public String searchVideo(String videoTitle, Model model) {
        List<TVideo> videoList = videoService.queryByVideoTitle(videoTitle);
        model.addAttribute("videoList", videoList);
        return "genre";
    }

    @ApiOperation(value = "跳转用户上传视频界面")
    @RequestMapping(value = "toAddVideo",method = RequestMethod.GET)
    public String toAddVideo(Model model) {
        List<TVideotype> videoTypes = videoTypeService.getVideoTypeAll();
        model.addAttribute("videoTypeList", videoTypes);
        return "uaddVideo";
    }


    @ApiOperation(value = "上传视频标题，简介，视频类型->表单信息")
    @RequestMapping(value = "uAddVideo",method = RequestMethod.POST)
    @ResponseBody
    public String uAddVideo(HttpSession session, @RequestParam String videoTitle,
                            @RequestParam String videoInfo, @RequestParam String typeName,
        @RequestParam String thunmbnailUrl,@RequestParam String videoUrl) {
        TUser tUser = (TUser) session.getAttribute("user");
        TVideo video = new TVideo();
        video.setUser(tUser);
        TState state = stateService.getStateByStateId(5L);
        video.setVideoState(state);
        video.setVideoType(videoTypeService.getVideoTypeByTypeName(typeName));
        video.setVideoInfo(videoInfo);
        video.setVideoTitle(videoTitle);
        video.setVideoUrl(videoUrl);
        video.setThunmbnailUrl(thunmbnailUrl);
        uVideoTitle = videoTitle;
        videoService.addVideo(video);
        return "200";
    }

    /*---------上传视频--------*/
    @ApiOperation(value = "上传视频")
    @RequestMapping(value = "uploadVideo",method = RequestMethod.POST)
    @ResponseBody
    public MsgResponse uploadVideo(@RequestParam MultipartFile file) {
        String workplace = System.getProperty("user.dir");
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
        String path = "/static/video/" + DateUtil.currentDateFormatString() + suffix;
        File newFile = new File(workplace + "/src/main/resources" + path);
        Long videoId = videoService.getVideoLastId(uVideoTitle);
        videoService.updateVideoPath(path, videoId);
        try {
            file.transferTo(newFile);
            return MsgResponse.success("上传成功",path);
        } catch (IOException e) {
            e.printStackTrace();
            return MsgResponse.fail("上传失败");
        }
    }

    /*---------上传视频图片--------*/
    @ApiOperation(value = "上传封面")
    @ResponseBody
    @RequestMapping(value = "uploadImage",method = RequestMethod.POST)
    public MsgResponse uploadImage(@RequestParam MultipartFile file, HttpSession session) {
        String workplace = System.getProperty("user.dir");
        Long videoId = videoService.getVideoLastId(uVideoTitle);
        String fileName = file.getOriginalFilename();
        File newFile = new File(workplace + "/src/main/resources/static/vimages/" + fileName);
        videoService.updateVideoImage("/video/getVideoImage/" + fileName, videoId);
        try {
            file.transferTo(newFile);
            System.out.println("success");
            return MsgResponse.success("上传成功","/video/getVideoImage/" + fileName);
        } catch (IOException e) {
            e.printStackTrace();
            return MsgResponse.fail("上传失败");
        }
    }
    /*---------get视频图片--------*/
    @ApiOperation(value = "获得视频封面")
    @RequestMapping(value = "/getVideoImage/{iconPath}",method = RequestMethod.GET)
    public void getVideoImage(HttpServletResponse response, @PathVariable String iconPath) throws IOException {
        String workpace = System.getProperty("user.dir");
        File file = new File(workpace + "/src/main/resources/static/vimages/" + iconPath);
        InputStream in = new FileInputStream(file);
        OutputStream out = response.getOutputStream();
        byte[] buffer = new byte[1024];
        int len = -1;
        while((len = in.read(buffer)) != -1) {
            out.write(buffer, 0, len);
        }
        in.close();
        out.close();
    }

    @ApiOperation(value = "推荐视频列表(查询出推荐视频，不含自己的视频，按预测值由高到底排序)")
    @RequestMapping(value = "getRecommendVideo",method = RequestMethod.GET)
    @ResponseBody
    public List<TVideo> getRecommendVideo(HttpServletRequest request) {
        TUser user = (TUser) request.getSession().getAttribute("user");
        return videoService.getRecommendVideo(1, 8, user.getUserId());
    }

    @ApiOperation(value = "根据预测表，进行推荐预测")
    @RequestMapping(value = "getIndexRecommendVideo",method = RequestMethod.GET)
    @ResponseBody
    public List<TVideo> getIndexRecommendVideo() {
        return videoService.getIndexRecommendVideo();
    }

    @ApiOperation(value = "视频播放,点赞和播放次数等部分逻辑")
    @RequestMapping(value = "videoPlay",method = RequestMethod.GET)
    public String videoPlay(String videoId, HttpServletResponse response, HttpSession session, Model model) throws IOException {
        Object obj = session.getAttribute("user");
        TUser sUser = (TUser)obj;
        TVideo s = null;
        if (obj != null && videoId != null && !videoId.equals("")) {
            Long videoId2 = Long.parseLong(videoId);
            TVideo video = videoService.getVideoByVideoId(videoId2);
            if (video != null) {
                TUser user = userService.getUserByUserId(video.getUser().getUserId());
                TUser tmpUser = userService.getUserByUserId(sUser.getUserId());
                video.setUser(user);
                TVideotype videoType = videoTypeService.getVideoTypeByVideoTypeId(video.getVideoType().getVideotypeId());
                video.setVideoType(videoType);
                session.setAttribute("curVideo", video);
                //判断会员等级和上传人员
                int videoLevel = video.getLevel();
                Long userId = video.getUserId();
                //不是上传人再判断等级限制
                if(!tmpUser.getUserId().equals(userId)){
                    if(tmpUser.getLevel() < videoLevel){
                        //等级限制不给看
                        model.addAttribute("noAuth", videoLevel);
                        return "videoplay";
                    }
                }

                // 因为要观看要记录，故要增加观看次数
                String result = videoService.addViewSum(videoId2);
                // 添加观看记录
                recordService.addRecord(((TUser) obj).getUserId(), videoId2);
                model.addAttribute("result", result);
            }
        }
        return "videoplay";

    }

    @ApiOperation(value = "点赞")
    @RequestMapping(value = "thumbsUp",method = RequestMethod.GET)
    @ResponseBody
    public MsgResponse thumbsUp(HttpSession session, @RequestParam String videoId) {
        TUser user = (TUser) session.getAttribute("user");
        String msg = videoService.thumbsUp(user, Long.parseLong(videoId));
        if (msg.equals("点赞成功")) {
            return MsgResponse.success(msg, null);
        }
        return MsgResponse.fail(msg);
    }

    @ApiOperation(value = "打星点评")
    @RequestMapping(value = "commented",method = RequestMethod.POST)
    @ResponseBody
    public MsgResponse commented(@RequestParam int starNum, @RequestParam Long userId, @RequestParam Long videoId) {
        return MsgResponse.success(videoService.addComment(starNum, userId, videoId), null);
    }

    @ApiOperation(value = "更新会员等级-wait")
    @RequestMapping(value = "updateLevel",method = RequestMethod.POST)
    @ResponseBody
    public String updateLevel(@RequestBody  TVideo tVideo) {
        videoService.updateLevel(tVideo.getLevel(),tVideo.getVideoId());
        return "200";
    }
}
