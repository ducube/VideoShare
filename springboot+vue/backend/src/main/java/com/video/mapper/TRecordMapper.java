package com.video.mapper;

import com.video.entity.TRecord;
import com.video.entity.TVideo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TRecordMapper {
    int deleteByPrimaryKey(Long recordId);

    int insert(TRecord record);

    int insertSelective(TRecord record);

    TRecord selectByPrimaryKey(Long recordId);

    int updateByPrimaryKeySelective(TRecord record);

    int updateByPrimaryKey(TRecord record);

    TRecord selectOne(@Param("userId") Long userId, @Param("videoId") Long videoId);

    int selectCountByUserId(@Param("userId") Long userId);

    int insertOne(@Param(value="userId")Long userId,@Param(value="videoId")Long videoId);

    List<TVideo> getRecordAll(Long userId);

    int deleteRecordByVideoId(@Param("userId") Long userId, @Param("videoId") Long videoId);

    void deleteByUserId(Long id);
}
