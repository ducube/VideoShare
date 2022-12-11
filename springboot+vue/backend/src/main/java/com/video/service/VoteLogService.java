package com.video.service;

import java.util.List;

import com.video.entity.TVote;
import com.video.entity.TVoteLog;

public interface VoteLogService {

    int insert(TVoteLog voteLog);

    List<TVoteLog> selectList(TVoteLog voteLog);
}
