package com.video.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(description = "预测推荐表")
public class TPredict {
    @ApiModelProperty(value = "预测ID")
    private Long preId;
    @ApiModelProperty(value = "用户ID")
    private Long userId;
    @ApiModelProperty(value = "视频ID")
    private Long videoId;
    @ApiModelProperty(value = "预测值ID")
    private Float preStar;

    public Long getPreId() {
        return preId;
    }

    public void setPreId(Long preId) {
        this.preId = preId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getVideoId() {
        return videoId;
    }

    public void setVideoId(Long videoId) {
        this.videoId = videoId;
    }

    public Float getPreStar() {
        return preStar;
    }

    public void setPreStar(Float preStar) {
        this.preStar = preStar;
    }
}