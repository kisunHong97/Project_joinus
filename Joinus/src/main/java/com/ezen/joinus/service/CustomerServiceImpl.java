package com.ezen.joinus.service;

import com.ezen.joinus.mappers.CustomerUserMapper;
import com.ezen.joinus.vo.CustomerUserVO;
import com.ezen.joinus.vo.ReviewVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Setter(onMethod_=@Autowired)
    private CustomerUserMapper customerMapper;

    @Override
    public int u_idCheck(String u_id) {
        return customerMapper.u_idCheck(u_id);
    }

    @Override
    public CustomerUserVO CustomerLogin(String u_id) throws Exception {
        return customerMapper.CustomerLogin(u_id);
    }

    @Override
    public CustomerUserVO getCustomerById(String u_id) {
        return customerMapper.getCustomerById(u_id);
    }

    @Override
    public void registerCustomer(CustomerUserVO vo) {
        customerMapper.insertCustomer(vo);
    }

    @Override
    public void modifyCustomer(CustomerUserVO vo) {
        customerMapper.updateCustomer(vo);
    }

    @Override
    public void removeCustomer(String u_id) {
        customerMapper.deleteCustomer(u_id);
    }


    @Override
    public void update(int buypoint, String u_id) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("u_id", u_id);
        paramMap.put("buypoint", buypoint);
        customerMapper.update(paramMap);
    }

    @Override
    public void insertreview(ReviewVO vo) {
        customerMapper.insertreview(vo);
    }

    @Override
    public List<ReviewVO> getreview(int pno) {
        return customerMapper.getreview(pno);
    }
    @Override
    public List<ReviewVO> customerreview(String u_id) {
        return customerMapper.customerreview(u_id);
    }


}
