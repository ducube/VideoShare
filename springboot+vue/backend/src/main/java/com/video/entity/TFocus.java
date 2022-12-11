package com.video.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
@ApiModel(description = "用户关注表")
public class TFocus {
    @ApiModelProperty(value = "关注ID")
    private Long focusId;
    @ApiModelProperty(value = "用户ID")
    private Long userId;
    @ApiModelProperty(value = "被关注用户ID")
    private Long focusedId;

    public Long getFocusId() {
        return focusId;
    }

    public void setFocusId(Long focusId) {
        this.focusId = focusId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getFocusedId() {
        return focusedId;
    }

    public void setFocusedId(Long focusedId) {
        this.focusedId = focusedId;
    }
}