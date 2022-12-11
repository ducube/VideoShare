package com.video.controller;

import com.video.entity.TMessage;
import com.video.entity.TMsgtype;
import com.video.entity.TState;
import com.video.entity.TUser;
import com.video.service.IMessageService;
import com.video.service.IMsgTypeService;
import com.video.service.IStateService;
import com.video.service.IUserService;
import com.video.util.MsgResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Api(tags ="前台-消息中心")
@RestController
@RequestMapping("Message")
public class MessageController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IMsgTypeService msgTypeService;

    @Autowired
    private IStateService stateService;

    @Autowired
    private IMessageService messageService;

    @ApiOperation(value = "获取私信列表")
    @RequestMapping(value = "getMsgList", method = RequestMethod.GET)
    @ResponseBody
    public List<TMessage> getMsgListByAjax(HttpSession session, @RequestParam String msgTypeName) {
        return messageService.findMsgByMsgType((TUser)session.getAttribute("user"),msgTypeName);
    }

    @ApiOperation(value = "已读私信删除")
    @RequestMapping(value = "delMsg", method = RequestMethod.GET)
    public MsgResponse delMsg(Long msgId) {
        return MsgResponse.success(messageService.deleteMsgById(msgId),null);
    }

    @ApiOperation(value = "私信读取状态更新（是否已读）")
    @RequestMapping(value = "updateMsgState", method = RequestMethod.GET)
    public MsgResponse updateMsgState(Long msgId) {
        return MsgResponse.success(messageService.updateReadMessage(msgId, 7L), null);
    }

    @ApiOperation(value = "发送私信")
    @RequestMapping(value = "addLetter",method = RequestMethod.POST)
    public MsgResponse addLetter(HttpSession session, @RequestParam String msgTitle, @RequestParam String msgContext, @RequestParam Long receiveUserId, @RequestParam Long msgTypeId) {
        TUser sendUser = (TUser) session.getAttribute("user");
        TMessage msg = new TMessage();
        String addMsg = null;
        if(sendUser != null) {
            msg.setMsgTitle(msgTitle);
            msg.setMsgContext(msgContext);
            msg.setSendUser(sendUser);
            TUser recieveUser = userService.getUserByUserId(receiveUserId);
            if(recieveUser == null) {
                addMsg = "接收用户为空";
                return  MsgResponse.fail(addMsg);
            }
            if(recieveUser.getUserId().equals(sendUser.getUserId())) {
                return MsgResponse.fail("不可对自己私信");
            }
            msg.setReceiveUser(recieveUser);
            TMsgtype msgType = msgTypeService.findOneByMsgTypeId(msgTypeId);
            msg.setMsgType(msgType);
            TState msgState = stateService.getStateByStateId(6L);
            msg.setMsgState(msgState);
            addMsg = messageService.addMsg(msg);
            return MsgResponse.success(addMsg, null);
        }
        addMsg = "发送用户为空";
        return MsgResponse.fail(addMsg);
    }
}
