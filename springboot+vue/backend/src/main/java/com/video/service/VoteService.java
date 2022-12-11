package com.video.service;

import java.util.List;

import com.video.entity.TVote;

public interface VoteService {
    int deleteByPrimaryKey(Long id);

    int insert(TVote vote);

    List<TVote> selectList(String voteName);

    TVote selectById(Long id);
}
