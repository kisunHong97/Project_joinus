package com.ezen.joinus.service;

import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.mappers.StoreMapper;
import com.ezen.joinus.vo.RevenueVO;
import com.ezen.joinus.vo.StoreVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public int s_nameCheck(String s_name) {
        return storeMapper.s_nameCheck(s_name);
    }

    @Override
    public int getMaxSno() {
        return storeMapper.getMaxSno();
    }

    @Override
    public StoreVO getStore(Integer bno) {
        return storeMapper.getStore(bno);
    }

    @Override
    public List<StoreVO> getAllStore() { return storeMapper.getAllStore();}

    @Override
    public void updateStore(StoreVO vo) {
        storeMapper.updateStore(vo);
    }

    @Override
    public void updateRevenue(int s_revenue, int sno) {
        Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("s_revenue", s_revenue);
        parameterMap.put("sno", sno);
        System.out.println("매출 : " + parameterMap);
        storeMapper.updateRevenue(parameterMap);
    }

    @Override
    public void insertRevenue(RevenueVO revenue) {
        storeMapper.insertRevenue(revenue);
    }

    @Override
    public List<RevenueVO> getRevenueList(int sno) {
        System.out.println("수익금 조회 sno : " + sno);
        return storeMapper.getRevenueList(sno);
    }


    @Override
    public List<StoreVO> selectlocation(String location) {
        return storeMapper.selectlocation(location);
    }

    @Override
    public void deletestore(Integer bno) {
        storeMapper.deletestore(bno);
    }

}
