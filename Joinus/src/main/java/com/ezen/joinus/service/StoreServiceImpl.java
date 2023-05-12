package com.ezen.joinus.service;

import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.mappers.StoreMapper;
import com.ezen.joinus.vo.BusinessStore;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImpl implements StoreService{

    @Setter(onMethod_=@Autowired)
    StoreMapper storeMapper;

    @Setter(onMethod_=@Autowired)
    BusinessUserMapper businessUserMapper;


    @Override
    public void storeInsert(BusinessStore vo) {
        System.out.println("서비스 "+vo);
        vo.setBno(businessUserMapper.getMaxBno());
        System.out.println("서비스22 "+vo);
        storeMapper.insert(vo);
    }

    @Override
    public Long getMaxBno() {
        Long bno = businessUserMapper.getMaxBno();
        return bno;
    }
}
