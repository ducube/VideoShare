package com.video.service.impl;

import java.util.Date;
import java.util.List;

import com.video.entity.TVote;
import com.video.entity.TVoteLog;
import com.video.mapper.VoteLogMapper;
import com.video.mapper.VoteMapper;
import com.video.service.VoteLogService;
import com.video.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VoteLogServiceImpl implements VoteLogService {

    @Autowired
    private VoteLogMapper voteLogMapper;

    @Override
    public int insert(TVoteLog voteLog) {
        voteLog.setVoteTime(new Date());
        return voteLogMapper.insert(voteLog);
    }

    @Override
    public List<TVoteLog> selectList(TVoteLog voteLog) {
        return voteLogMapper.selectList(voteLog);
    }
}
