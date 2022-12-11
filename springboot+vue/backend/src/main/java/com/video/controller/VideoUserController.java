package com.video.controller;

import com.video.entity.TUser;
import com.video.entity.TVideo;
import com.video.entity.TVote;
import com.video.entity.TVoteLog;
import com.video.entity.dto.ResultDTO;
import com.video.service.IMessageService;
import com.video.service.IUserService;
import com.video.service.IVideoService;
import com.video.service.VoteLogService;
import com.video.service.VoteService;
import com.video.service.impl.VideoServiceImpl;
import com.video.util.MsgResponse;
import com.video.util.ValidateCode;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags ="前台-用户模块")
@Controller
@RequestMapping("user")
public class VideoUserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IMessageService messageService;

    @Autowired
    private VoteService voteService;

    @Autowired
    private VoteLogService voteLogService;

    @Autowired
    private IVideoService videoService;

    /**
     * 实现路由跳转
     * @return
     */
    @ApiOperation(value = "跳转登录页面")
    @RequestMapping(value = "toLogin",method = RequestMethod.GET)
    public String toLogin() {
        return "login";
    }

    @ApiOperation(value = "跳转注册页面")
    @RequestMapping(value = "toRegister", method = RequestMethod.GET)
    public String toRegister() {
        return "register";
    }

    @ApiOperation(value = "跳转主页面")
    @RequestMapping(value = "toIndex", method = RequestMethod.GET)
    public String toIndex(Model model) {
        List<TVideo> newVideo = videoService.getNewVideo();
        model.addAttribute("newVideos",newVideo);
        return "index";
    }

    @ApiOperation(value = "跳转个人中心（编辑用户信息界面）")
    @RequestMapping(value = "toUEditorUser", method = RequestMethod.GET)
    public String toUEditorUser() {
        return "ueditUser";
    }


    @ApiOperation(value = "跳转到消息中心页面")
    @RequestMapping(value = "toMessage", method = RequestMethod.GET)
    public String toMessage(){
        return "message";
    }

    @ApiOperation(value = "视频投票")
    @RequestMapping(value = "toVote",method = RequestMethod.GET)
    public String toVote(Model model,HttpSession session) {
        //查询投票信息
        List<TVote> undo = new ArrayList<>();
        List<TVote> tVotes = voteService.selectList(null);
        TVoteLog log = new TVoteLog();
        TUser user = (TUser)session.getAttribute("user");
        log.setUserId(user.getUserId());
        List<TVoteLog> tVoteLogs = voteLogService.selectList(log);
        for (TVote tVote : tVotes) {
            boolean flag = false;
            for (TVoteLog tVoteLog : tVoteLogs) {
                if(tVote.getId().equals(tVoteLog.getVoteId())){
                    flag = true;
                    break;
                }
            }
            if(!flag){
                undo.add(tVote);
            }
        }
        model.addAttribute("votes",undo);
        return "voteList";
    }

    /*---------检验手机号是否已存在--------*/
    @ApiOperation(value = "检验手机号是否已存在（账号不为空即可）")
    @RequestMapping(value = "checkTel", method = RequestMethod.GET)
    @ResponseBody
    public Map<Object, Boolean> checkTel(String userTel) {
        boolean flag = userService.queryByuserTel(userTel);
        Map<Object, Boolean> map = new HashMap<Object, Boolean>();
        System.out.println("flag" + flag);
        if (flag) {
            map.put("res", true);
        } else {
            map.put("res", false);
        }
        return map;
    }

    @ApiOperation(value = "修改密保接口")
    @RequestMapping(value = "UEditorUser", method = RequestMethod.POST)
    public String UEditorUser(HttpSession session, TUser tUser, String preEncryptedProblem, Model model) {
        if(!tUser.getEncryptedProblem().equals(preEncryptedProblem)) {
            model.addAttribute("errorMsg", "当前密保不是最新密保");
            return "ueditUser";
        }
        session.removeAttribute("user");
        tUser.setIconUrl(userService.getUserByUserId(tUser.getUserId()).getIconUrl());
        session.setAttribute("user", tUser);
        System.out.println("tuser" + tUser);
        userService.updateUserByUserId(tUser);
        return "index";
    }

    /*---------上传头像--------*/
    @ApiOperation(value = "修改头像")
    @ResponseBody
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public MsgResponse upload(@RequestParam MultipartFile file, HttpSession session) {
        String workplace = System.getProperty("user.dir");
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
        TUser user = (TUser) session.getAttribute("user");
        String fileName = "icon" + String.valueOf(user.getUserId()) + suffix;
        File newFile = new File(workplace + "/src/main/resources/static/uimages/" + fileName);
        userService.updateUserIcon("/user/getIcon/" + fileName,user.getUserId());
        try {
            file.transferTo(newFile);
            System.out.println("success");
            return MsgResponse.success("上传成功",null);
        } catch (IOException e) {
            e.printStackTrace();
            return MsgResponse.fail("上传失败");
        }
    }

    /*---------src getIcon--------*/
    @ApiOperation(value = "获取用户头像图片")
    @RequestMapping(value = "/getIcon/{iconPath}", method = RequestMethod.GET)
    public void getIcon(HttpServletResponse response, @PathVariable String iconPath) throws IOException {
        String workpace = System.getProperty("user.dir");
        System.out.println(iconPath);

        File file = new File(workpace + "/src/main/resources/static/uimages/" + iconPath);

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

    /*----------用户注册-----------*/
    @ApiOperation(value = "用户注册")
    @RequestMapping(value = "userRegister", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO register(TUser tUser) {
        tUser.setStateId(1);
        tUser.setFanNum(0);
        ResultDTO res = userService.register(tUser);
        return res;
    }

    /*----------用户登录-----------*/
    @ApiOperation(value = "用户登录")
    @RequestMapping(value = "userLogin", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO login(String userTel, String password, String aCode, HttpSession session,Model model) {

        ResultDTO<TUser> res = userService.login(userTel, password);
        if (res.getResult()) {
            String randomCode = (String) session.getAttribute(ValidateCode.RANDOMCODEKEY);
            if (!aCode.equalsIgnoreCase(randomCode)) {
                //equalsIgnoreCase方法忽略大小写判断

                res.setMessage("验证码错误");
                res.setResult(false);
                return res;
            }
            int messageCount = messageService.msgCount(res.getData().getUserId());
            System.out.println(messageCount);
            session.setAttribute("messageCount", "(" + messageCount + ")");
            session.setAttribute("messageCount", "(" + messageCount + ")");
            session.setAttribute("user", res.getData());
        }
        return res;
    }


    /*----------用户验证码验证-----------*/
    @ApiOperation(value = "用户验证码验证")
    @RequestMapping(value = "Img", method = RequestMethod.GET)
    public void Img(HttpServletRequest req, HttpServletResponse resp) {
        resp.setContentType("image/jpeg");
        //设置响应头，阻止浏览器缓存此响应的内容(节约内存)
        resp.setHeader("Pragma", "No-cache");
        //引用工具类中的方法，绘制验证码图片
        ValidateCode code = new ValidateCode();
        code.getValidateCode(req, resp);//调用绘制验证码的方法，绘制图片
    }

    @ApiOperation(value = "退出登录")
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        session.invalidate();
        return "index";
    }

    @ApiOperation(value = "更新用户等级")
    @RequestMapping(value = "updateLevel", method = RequestMethod.POST)
    @ResponseBody
    public String updateLevel(@RequestBody TUser tUser) {
        userService.updateLevel(tUser.getLevel(),tUser.getUserId());
        return "200";
    }
}
