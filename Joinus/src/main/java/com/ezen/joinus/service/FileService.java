package com.ezen.joinus.service;

import com.ezen.joinus.dto.AttachFileDTO;

import java.util.List;

public interface FileService {

    public void insertThumbnail(AttachFileDTO attach);
    public AttachFileDTO selectMainThumbnail(int pno);
    public List<AttachFileDTO> selectThumbnailList(int pno);
}
