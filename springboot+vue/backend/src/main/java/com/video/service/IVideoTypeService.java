package com.video.service;

import com.video.entity.TVideotype;

import java.util.List;

public interface IVideoTypeService {
    TVideotype getVideoTypeByVideoTypeId(Long videotypeId);

    List<TVideotype> getVideoTypeAll();

    TVideotype getVideoTypeByTypeName(String typeName);

}
