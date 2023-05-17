package com.ezen.joinus.service;

import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.mappers.StoreMapper;
import com.ezen.joinus.vo.StoreVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StoreServiceImpl implements StoreService{

    @Setter(onMethod_=@Autowired)
    StoreMapper storeMapper;

    @Setter(onMethod_=@Autowired)
    BusinessUserMapper businessMapper;


    @Override
    public void registerStore(StoreVO vo) {
        System.out.println("서비스 "+vo);
        vo.setBno(businessMapper.getMaxBno());
        System.out.println("서비스22 "+vo);
        storeMapper.insertStore(vo);
    }

    @Override
    public int s_nameCheck(String storename) {
        return storeMapper.s_nameCheck(storename);
    }

    @Override
    public int getMaxSno() {
        return storeMapper.getMaxSno();
    }
}
