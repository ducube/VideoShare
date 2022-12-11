package com.video.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.video.entity.Admin;
import com.video.entity.TUser;
import com.video.entity.dto.UserStateDTO;
import com.video.service.IAdminUserService;
import com.video.service.IUserService;
import com.video.util.MsgResponse;
import com.video.util.VueUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Api(tags ="后台-管理员管理用户功能实现")
@RequestMapping("admin")
@RestController
public class AdminUserController {

    @Autowired
    private IAdminUserService adminUserService;

    @Autowired
    private IUserService userService;

    @ApiOperation(value = "后台管理员登录")
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public MsgResponse login(@RequestBody Admin admin, HttpSession session) {
        Admin admin1 = adminUserService.login(admin);
        if (admin1 == null) {
            return MsgResponse.fail("密码错误");
        }
        session.setAttribute("admin", admin);
        return MsgResponse.success("登录成功", null);
    }

    @ApiOperation(value = "显示所有用户列表")
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public List<UserStateDTO> userList() {
        return adminUserService.userList();
    }

    @ApiOperation(value = "通过id获取用户信息")
    @RequestMapping(value = "getUserById", method = RequestMethod.GET)
    public UserStateDTO getUserById(Long id) {
        return adminUserService.getUserById(id);
    }

    @ApiOperation(value = "编辑用户信息")
    @RequestMapping(value = "editUser", method = RequestMethod.POST)
    public void editUser(@RequestBody TUser tUser) {
        adminUserService.editUser(tUser);
    }

    @ApiOperation(value = "根据用户id删除用户")
    @RequestMapping(value = "deleteUser/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable Long id) {
        adminUserService.deleteUser(id);
        return "success";
    }
    @ApiOperation(value = "添加用户信息")
    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    public String addUser(@RequestBody TUser tUser) {
        adminUserService.addUser(tUser);
        return "success";
    }

    /*---------上传头像--------*/
    @ApiOperation(value = "上传头像")
    @ResponseBody
    @RequestMapping(value = "upload", method = RequestMethod.GET)
    public VueUtil upload(@RequestParam MultipartFile avatar, Long userId) {
        String workplace = System.getProperty("user.dir");
        //获取上传时候的文件名
        String suffix = avatar.getOriginalFilename().substring(avatar.getOriginalFilename().indexOf("."));
        String fileName = "icon" + String.valueOf(userId) + suffix;
        File newFile = new File(workplace + "/src/main/resources/static/uimages/" + fileName);
        userService.updateUserIcon("/user/getIcon/" + fileName,userId);
        try {
            avatar.transferTo(newFile);
            System.out.println("success");
            Object res = "http://localhost:8081/user/getIcon/icon" + userId + suffix;
            System.out.println(res);
            return VueUtil.success("上传成功",res);
        } catch (IOException e) {
            e.printStackTrace();
            return VueUtil.fail("上传失败");
        }
    }
    @ApiOperation(value = "searchUser-wait")
    @RequestMapping(value = "searchUser", method = RequestMethod.GET)
    public PageInfo<UserStateDTO> searchUser(int pageNum, int pageSize,String username) {
        //调用一个pageHelper的一个静态方法
        PageHelper.startPage(pageNum, pageSize);
        //用户记录
        List<UserStateDTO> userStateDTOS = adminUserService.getUserByName(username);
        //获得 用户分页
        PageInfo<UserStateDTO> pageInfo = new PageInfo<UserStateDTO>(userStateDTOS);
        return pageInfo;
    }

    /**
     * 获得分页对象, pageNum是当前页数, pageSize是分页大小
     * @param pageNum
     * @param pageSize
     * @return
     */
    @ApiOperation(value = "用户分页")
    @RequestMapping(value = "pageInfo", method = RequestMethod.GET)
    public PageInfo<UserStateDTO> getPageInfo(int pageNum, int pageSize) {
        //调用一个pageHelper的一个静态方法
        PageHelper.startPage(pageNum, pageSize);
        //用户记录
        List<UserStateDTO> userStateDTOS = adminUserService.userList();
        //获得 用户分页
        PageInfo<UserStateDTO> pageInfo = new PageInfo<UserStateDTO>(userStateDTOS);
        return pageInfo;
    }
}
