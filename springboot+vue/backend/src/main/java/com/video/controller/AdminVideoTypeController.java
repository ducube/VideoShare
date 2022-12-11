package com.video.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.video.entity.TVideotype;
import com.video.service.IAdminVideoTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Api(tags= "后台-影视分类管理功能实现")
@RestController
@RequestMapping("admin")
public class AdminVideoTypeController {

    @Autowired
    private IAdminVideoTypeService adminVideoTypeService;

    @ApiOperation(value = "根据类型名称再分页数据中查找数据")
    @RequestMapping(value = "searchVideoType", method = RequestMethod.GET)
    public PageInfo<TVideotype> searchVideoType(int pageNum, int pageSize, String typeName) {
        //调用一个pageHelper的一个静态方法
        PageHelper.startPage(pageNum, pageSize);
        //视频记录
        List<TVideotype> videoTypes = adminVideoTypeService.getVideoTypeByName(typeName);
        //获得 视频分页
        PageInfo<TVideotype> vidoeTypeInfo = new PageInfo<TVideotype>(videoTypes);
        return vidoeTypeInfo;
    }

    @ApiOperation(value = "分类数据分页")
    @RequestMapping(value = "categoryPageInfo", method = RequestMethod.GET)
    public PageInfo<TVideotype> categoryPageInfo(int pageNum, int pageSize) {
        //调用一个pageHelper的一个静态方法
        PageHelper.startPage(pageNum, pageSize);
        //视频记录
        List<TVideotype> videoTypes = adminVideoTypeService.categoryList();
        //获得 视频分页
        PageInfo<TVideotype> vidoeTypeInfo = new PageInfo<TVideotype>(videoTypes);
        return vidoeTypeInfo;
    }

    @ApiOperation(value = "添加影视分类")
    @RequestMapping(value = "addcategory", method = RequestMethod.POST)
    public String addVideoType(@RequestBody TVideotype videotype) {
        boolean flag = adminVideoTypeService.addVideoType(videotype);
        return flag ? "200" : "404";
    }

    @ApiOperation(value = "更新影视分类-wait")
    @RequestMapping(value = "updatecategory", method = RequestMethod.POST)
    public String updateVideoType(@RequestBody TVideotype videotype) {
        boolean flag = adminVideoTypeService.updateVideoType(videotype);
        return flag ? "200" : "404";
    }

    @ApiOperation(value = "获取影视分类")
    @RequestMapping(value = "getCategory", method = RequestMethod.GET)
    public TVideotype getCategory(Long id) {
        return adminVideoTypeService.getCategoryById(id);
    }

    @ApiOperation(value = "根据id删除分类")
    @RequestMapping(value = "deleteCategory/{id}", method = RequestMethod.GET)
    public String deleteCategory(@PathVariable("id") Long id) {
        boolean flag = adminVideoTypeService.deleteCategoryById(id);
        return flag ? "success" : "fail";
    }

}
