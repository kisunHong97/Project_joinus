package com.ezen.joinus.mappers;

import com.ezen.joinus.dto.AttachFileDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FileMapper {
    public void insertThumbnail(AttachFileDTO attach);
    public AttachFileDTO selectMainThumbnail(int pno);
    public List<AttachFileDTO> selectThumbnailList(int pno);
}
