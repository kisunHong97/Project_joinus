package com.ezen.joinus.service;

import com.ezen.joinus.dto.AttachFileDTO;

import java.util.List;

public interface FileService {

    // 상품 파일 테이블에 상품 이미지(썸네일, 상세정보) 파일정보 삽입
    public void registerProductImage(AttachFileDTO attach);

    public void modifyProductImage(AttachFileDTO attach);

    public void removeProductImage(int pno);

    // pno에 맞는 상품 썸네일, 제일 앞에 있는 파일정보 가져오기
    public AttachFileDTO selectMainThumbnail(int pno);

    // pno에 맞는 상품 썸네일 전부 가져오기
    public List<AttachFileDTO> selectThumbnailList(int pno);

    public AttachFileDTO selectDetail(int pno);
}
