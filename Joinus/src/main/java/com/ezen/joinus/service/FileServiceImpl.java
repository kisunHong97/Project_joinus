package com.ezen.joinus.service;

import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.mappers.FileMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FileServiceImpl implements FileService{
    @Setter(onMethod_=@Autowired)
    FileMapper fileMapper;

    @Override
    public void registerProductImage(AttachFileDTO attach) {
        fileMapper.insertProductImage(attach);
    }

    @Override
    public AttachFileDTO selectMainThumbnail(int pno) {
        System.out.println("Service PNO : " + pno);
        return fileMapper.selectMainThumbnail(pno);
    }

    @Override
    public List<AttachFileDTO> selectThumbnailList(int pno) {
        // return selectThumbnaulList(pno); 앞에 Mapper를 안쓰니깐 무한 재귀호출을 하네
        return fileMapper.selectThumbnailList(pno);
    }

    @Override
    public void registerStoreImage(AttachFileDTO attach) {
        fileMapper.insertStoreImage(attach);
    }
}
