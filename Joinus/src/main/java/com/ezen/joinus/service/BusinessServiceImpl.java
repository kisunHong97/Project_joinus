package com.ezen.joinus.service;

import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.vo.BusinessUserVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BusinessServiceImpl implements BusinessService{
    @Setter(onMethod_=@Autowired)
    private BusinessUserMapper mapper;
    @Override
    public BusinessUserVO getBusinessById(String b_id) {
        return mapper.getBusinessById(b_id);
    }
}
