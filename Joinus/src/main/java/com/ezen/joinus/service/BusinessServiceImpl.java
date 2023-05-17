package com.ezen.joinus.service;

import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.vo.BusinessUserVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BusinessServiceImpl implements BusinessService{
    @Setter(onMethod_=@Autowired)
    private BusinessUserMapper BusinessMapper;



    @Override
    public int b_idCheck(String b_id) {
        return BusinessMapper.b_idCheck(b_id);
    }

    @Override
    public BusinessUserVO MemberLogin(String b_id) throws Exception {
        return BusinessMapper.MemberLogin(b_id);
    }

    @Override
    public int getMaxBno() {
        return BusinessMapper.getMaxBno();
    }

    @Override
    public BusinessUserVO getBusinessById(String b_id) {
        return BusinessMapper.getBusinessById(b_id);
    }

    @Override
    public void registerBusiness(BusinessUserVO vo) {
        BusinessMapper.insertBusiness(vo);
    }

    @Override
    public void modifyBusiness(BusinessUserVO vo) {
        BusinessMapper.upadteBusiness(vo);
    }

    @Override
    public void removeBusiness(String b_id) {
        BusinessMapper.deleteBusiness(b_id);
    }
}