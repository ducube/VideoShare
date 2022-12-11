package com.video.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
@ApiModel(description = "管理员表")
public class Admin {
    @ApiModelProperty(value = "管理员ID")
    private Long aId;
    @ApiModelProperty(value = "管理员用户名")
    private String aUsername;
    @ApiModelProperty(value = "管理员密码")
    private String aPassword;

    public Long getaId() {
        return aId;
    }

    public void setaId(Long aId) {
        this.aId = aId;
    }

    public String getaUsername() {
        return aUsername;
    }

    public void setaUsername(String aUsername) {
        this.aUsername = aUsername == null ? null : aUsername.trim();
    }

    public String getaPassword() {
        return aPassword;
    }

    public void setaPassword(String aPassword) {
        this.aPassword = aPassword == null ? null : aPassword.trim();
    }
}