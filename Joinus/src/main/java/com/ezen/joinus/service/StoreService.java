package com.ezen.joinus.service;

import com.ezen.joinus.vo.BusinessStore;
import com.ezen.joinus.vo.BusinessUserVO;

public interface StoreService {

    public void storeInsert(BusinessStore vo);

    public Long getMaxBno();
}
