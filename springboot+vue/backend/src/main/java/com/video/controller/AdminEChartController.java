package com.video.controller;

import com.video.service.IAdminEChartService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Api(tags ="后台-管理数据可视化功能实现")
@Controller
@RequestMapping("admin")
public class AdminEChartController {

    @Autowired
    private IAdminEChartService adminEChartService;

    @ApiOperation(value = "获取影视名称信息")
    @RequestMapping(value ="getFilmData", method = RequestMethod.GET)
    @ResponseBody
    public List<String> getFilmData() {
        return adminEChartService.getFilmData();
    }

    @ApiOperation(value = "获取影视播放量信息")
    @RequestMapping(value ="getData", method = RequestMethod.GET)
    @ResponseBody
    public List<Integer> getData() {
        return adminEChartService.getData();

    }
}
