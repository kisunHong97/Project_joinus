package com.ezen.joinus.service;

import com.ezen.joinus.mappers.CustomerUserMapper;
import com.ezen.joinus.vo.CustomerUserVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Setter(onMethod_=@Autowired)
    private CustomerUserMapper mapper;
    @Override
    public CustomerUserVO getCustomerById(String b_id) {
        return mapper.getCustomerById(b_id);
    }
}
