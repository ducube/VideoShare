package com.video.service;

import java.util.List;

import com.video.entity.Comment;

public interface CommentService {
    int deleteComment(Long id);

    int insertComment(Comment comment);

    List<Comment> getList(Long videoId);

    List<Comment> selectByParentId(Long parentId);
}
