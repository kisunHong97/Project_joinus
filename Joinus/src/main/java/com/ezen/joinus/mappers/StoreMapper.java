package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.BusinessStore;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StoreMapper {
    public void insert(BusinessStore vo);
    public int s_nameCheck(String storename);
}
