package com.video.mapper;

import java.util.List;

import com.video.entity.TVote;
import com.video.entity.TVoteLog;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface VoteLogMapper {
    int insert(TVoteLog voteLog);

    List<TVoteLog> selectList(TVoteLog voteLog);

    int getCountByVoteId(Long voteId);
}
