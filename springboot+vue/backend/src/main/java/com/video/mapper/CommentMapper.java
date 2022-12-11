package com.video.mapper;

import java.util.List;

import com.video.entity.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface CommentMapper {
    int deleteComment(Long id);

    int insertComment(Comment comment);

    List<Comment> selectByVideoId(Long videoId);

    List<Comment> selectByParentId(Long parentId);
}
