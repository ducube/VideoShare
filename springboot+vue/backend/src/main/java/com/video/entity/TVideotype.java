package com.video.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(description = "视频类型表")
public class TVideotype {
    @ApiModelProperty(value = "视频类型ID")
    private Long videotypeId;
    @ApiModelProperty(value = "类型名")
    private String typeName;

    public Long getVideotypeId() {
        return videotypeId;
    }

    public void setVideotypeId(Long videotypeId) {
        this.videotypeId = videotypeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    @Override
    public String toString() {
        return "TVideotype{" +
                "videotypeId=" + videotypeId +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
