package com.video.entity;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;
@ApiModel(description = "消息表")
public class TMessage {
    @ApiModelProperty(value = "消息ID")
    private Long msgId;
    @ApiModelProperty(value = "消息标题")
    private String msgTitle;
    @ApiModelProperty(value = "消息内容")
    private String msgContext;
    @ApiModelProperty(value = "消息发送日期")
    private Date msgSendDate;
    @ApiModelProperty(value = "消息发送用户ID")
    private Long msgSendUserId;
    @ApiModelProperty(value = "消息接受用户ID")
    private Long msgReceiveUserId;
    @ApiModelProperty(value = "视频用户类-发送用户信息")
    private TUser sendUser;
    @ApiModelProperty(value = "视频用户类-接收用户信息")
    private TUser receiveUser;
    @ApiModelProperty(value = "消息状态类-状态信息")
    private TState msgState;
    @ApiModelProperty(value = "消息类型类-类型信息")
    private TMsgtype msgType;

    public TUser getSendUser() {
        return sendUser;
    }

    public void setSendUser(TUser sendUser) {
        this.sendUser = sendUser;
    }

    public TUser getReceiveUser() {
        return receiveUser;
    }

    public void setReceiveUser(TUser receiveUser) {
        this.receiveUser = receiveUser;
    }

    public TState getMsgState() {
        return msgState;
    }

    public void setMsgState(TState msgState) {
        this.msgState = msgState;
    }

    public TMsgtype getMsgType() {
        return msgType;
    }

    public void setMsgType(TMsgtype msgType) {
        this.msgType = msgType;
    }

    private Long msgStateId;

    private Long msgtypeId;

    public Long getMsgId() {
        return msgId;
    }

    public void setMsgId(Long msgId) {
        this.msgId = msgId;
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle == null ? null : msgTitle.trim();
    }

    public String getMsgContext() {
        return msgContext;
    }

    public void setMsgContext(String msgContext) {
        this.msgContext = msgContext == null ? null : msgContext.trim();
    }

    public Date getMsgSendDate() {
        return msgSendDate;
    }

    public void setMsgSendDate(Date msgSendDate) {
        this.msgSendDate = msgSendDate;
    }

    public Long getMsgSendUserId() {
        return msgSendUserId;
    }

    public void setMsgSendUserId(Long msgSendUserId) {
        this.msgSendUserId = msgSendUserId;
    }

    public Long getMsgReceiveUserId() {
        return msgReceiveUserId;
    }

    public void setMsgReceiveUserId(Long msgReceiveUserId) {
        this.msgReceiveUserId = msgReceiveUserId;
    }

    public Long getMsgStateId() {
        return msgStateId;
    }

    public void setMsgStateId(Long msgStateId) {
        this.msgStateId = msgStateId;
    }

    public Long getMsgtypeId() {
        return msgtypeId;
    }

    public void setMsgtypeId(Long msgtypeId) {
        this.msgtypeId = msgtypeId;
    }
}
