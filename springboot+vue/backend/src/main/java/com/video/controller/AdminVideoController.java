package com.video.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.video.entity.TState;
import com.video.entity.TUser;
import com.video.entity.TVideo;
import com.video.entity.TVideotype;
import com.video.entity.dto.VideoInfoDTO;
import com.video.service.IAdminVideoService;
import com.video.service.IStateService;
import com.video.service.IVideoService;
import com.video.service.IVideoTypeService;
import com.video.util.DateUtil;
import com.video.util.MsgResponse;
import com.video.util.VueUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Api(tags ="后台-视频管理功能实现")
@RestController
@RequestMapping("admin")
public class AdminVideoController {


    @Autowired
    private IAdminVideoService adminVideoService;

    @Autowired
    private IStateService stateService;

    @Autowired
    private IVideoService videoService;

    @Autowired
    private IVideoTypeService videoTypeService;

    private static String aVideoTitle;

    @ApiOperation(value = "根据id删除用户视频数据")
    @RequestMapping(value = "deleteVideo/{id}", method = RequestMethod.GET)
    public String deleteVideo(@PathVariable Long id) {
        adminVideoService.deleteVideo(id);
        return "success";
    }

    @ApiOperation(value = "编辑视频信息")
    @RequestMapping(value = "editVideo", method = RequestMethod.POST)
    public String editVideo(@RequestBody TVideo video) {
        adminVideoService.editVideo(video);
        return "success";
    }

    @ApiOperation(value = "根据视频id获取视频详细信息")
    @RequestMapping(value = "getVideoById", method = RequestMethod.GET)
    public VideoInfoDTO getVideoById(Long id) {
        return adminVideoService.getVideoById(id);
    }

    @ApiOperation(value = "获取视频上架状态信息")
    @RequestMapping(value = "getStateList", method = RequestMethod.GET)
    public List<TState> getStateList() {
        return adminVideoService.getStateList();
    }

    @ApiOperation(value = "获取视频分类信息列表")
    @RequestMapping(value = "getVideoTypeList", method = RequestMethod.GET)
    public List<TVideotype> getVideoTypeList() {
        return adminVideoService.getVideoTypeList();
    }


    @ApiOperation(value = "根据视频id-刷新数据-未确认")
    @RequestMapping(value = "restoreVideo/{id}", method = RequestMethod.GET)
    public String restoreVideo(@PathVariable Long id) {
        adminVideoService.restoreVideo(id);
        return "success";
    }

    @ApiOperation(value = "根据视频id下架视频-数据未删除")
    @RequestMapping(value = "rdeleteVideo/{id}", method = RequestMethod.GET)
    public String rdeleteVideo(@PathVariable Long id) {
        adminVideoService.rdeleteVideo(id);
        return "success";
    }

    @RequestMapping(value ="upVideo/{id}", method = RequestMethod.GET)   //--todo
    public String upVideo(@PathVariable Long id) {
        adminVideoService.upVideo(id);
        return "success";
    }

    @ApiOperation(value = "添加视频")
    @RequestMapping(value = "addVideo", method = RequestMethod.POST)
    public String addVideo(@RequestParam String videoTitle,@RequestParam Long videoStateId,
                           @RequestParam String videoInfo, @RequestParam Long videoTypeId) {
        TUser user = new TUser();
        user.setUserId(1L);
        TVideo video = new TVideo();
        video.setUser(user);
        TState state = stateService.getStateByStateId(videoStateId);
        video.setVideoState(state);
        video.setVideoType(videoTypeService.getVideoTypeByVideoTypeId(videoTypeId));
        video.setVideoInfo(videoInfo);
        video.setVideoTitle(videoTitle);
        aVideoTitle = videoTitle;
        videoService.addVideo(video);
        return "200";
    }

    @ApiOperation(value = "根据视频名称和页数位置查询数据")
    @RequestMapping(value = "searchVideo", method = RequestMethod.GET)
    public PageInfo<VideoInfoDTO> searchVideo(int pageNum, int pageSize, String videoName) {
        //调用一个pageHelper的一个静态方法
        PageHelper.startPage(pageNum, pageSize);
        //视频记录
        List<VideoInfoDTO> videoInfoDTOs = adminVideoService.getiVideoByTitle(videoName);
        //获得 视频分页
        PageInfo<VideoInfoDTO> vidoePageInfo = new PageInfo<VideoInfoDTO>(videoInfoDTOs);
        return vidoePageInfo;
    }


    /**
     * 获得分页对象, pageNum是当前页数, pageSize是分页大小
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    @ApiOperation(value = "视频分页列表显示")
    @RequestMapping(value = "videoPageInfo", method = RequestMethod.GET)
    public PageInfo<VideoInfoDTO> getPageInfo(int pageNum, int pageSize) {
        //调用一个pageHelper的一个静态方法
        PageHelper.startPage(pageNum, pageSize);
        //视频记录
        List<VideoInfoDTO> videoInfoDTOs = adminVideoService.videoList();
        //获得 视频分页
        PageInfo<VideoInfoDTO> vidoePageInfo = new PageInfo<VideoInfoDTO>(videoInfoDTOs);
        return vidoePageInfo;
    }

    @ApiOperation(value = "视频分页功能")
    @RequestMapping(value = "underVideoPageInfo", method = RequestMethod.GET)
    public PageInfo<VideoInfoDTO> underVideoPageInfo(int pageNum, int pageSize) {
        //调用一个pageHelper的一个静态方法
        PageHelper.startPage(pageNum, pageSize);
        //视频记录
        List<VideoInfoDTO> videoInfoDTOs = adminVideoService.underVideoList();
        //获得 视频分页
        PageInfo<VideoInfoDTO> vidoePageInfo = new PageInfo<VideoInfoDTO>(videoInfoDTOs);
        return vidoePageInfo;
    }

    @ApiOperation(value = "视频上传功能")
    @RequestMapping(value = "adminVideoUpload",method = RequestMethod.POST)
    public MsgResponse adminVideoUpload(@RequestParam MultipartFile file) {
        String workplace = System.getProperty("user.dir");

        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
        String path = "/static/video/" + DateUtil.currentDateFormatString() + suffix;
        File newFile = new File(workplace + "/src/main/resources" + path);
        Long videoId = videoService.getVideoLastId(aVideoTitle);
        videoService.updateVideoPath(path, videoId);
        try {
            file.transferTo(newFile);
            return MsgResponse.success("上传成功", "http://localhost:8081" + path);
        } catch (IOException e) {
            e.printStackTrace();
            return MsgResponse.fail("上传失败");
        }
    }

    @ApiOperation(value = "编辑功能-根据id修改缩略图")
    @RequestMapping(value = "editThumbnailImageUpload",method = RequestMethod.POST)
    public VueUtil editThumbnailImageUpload(@RequestParam MultipartFile avatar, Long videoId) {
        String workplace = System.getProperty("user.dir");
        String suffix = avatar.getOriginalFilename().substring(avatar.getOriginalFilename().indexOf("."));
        String fileName = "video" + String.valueOf(videoId) + suffix;
        File newFile = new File(workplace + "/src/main/resources/static/vimages/" + fileName);
        videoService.adminUpdateVideoImage("/video/getVideoImage/" + fileName, videoId);
        try {
            avatar.transferTo(newFile);
            System.out.println("success");
            Object res = "http://localhost:8081/video/getVideoImage/video" + videoId + suffix;
            return VueUtil.success("上传成功", res);
        } catch (IOException e) {
            e.printStackTrace();
            return VueUtil.fail("上传失败");
        }
    }

    @ApiOperation(value = "缩略图上传-本地静态存储")
    @RequestMapping(value = "thumbnailImageupload",method = RequestMethod.POST)
    public VueUtil thumbnailImageupload(@RequestParam MultipartFile avatar) {
        String workplace = System.getProperty("user.dir");
        Long videoId = videoService.getVideoLastId(aVideoTitle);
        String suffix = avatar.getOriginalFilename().substring(avatar.getOriginalFilename().indexOf("."));
        String fileName = "video" + String.valueOf(videoId) + suffix;
        File newFile = new File(workplace + "/src/main/resources/static/vimages/" + fileName);
        videoService.adminUpdateVideoImage("/video/getVideoImage/" + fileName, videoId);
        try {
            avatar.transferTo(newFile);
            System.out.println("success");
            Object res = "http://localhost:8081/video/getVideoImage/video" + videoId + suffix;
            return VueUtil.success("上传成功", res);
        } catch (IOException e) {
            e.printStackTrace();
            return VueUtil.fail("上传失败");
        }
    }


}
