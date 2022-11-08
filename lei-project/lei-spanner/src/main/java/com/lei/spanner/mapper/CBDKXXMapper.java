package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBDKXX;
import java.util.List;


public interface CBDKXXMapper {


    public CBDKXX getBydkbm(String dkbm);

    public List<CBDKXX> getAll();

    //	public List<CBDKXX> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
    //                                                @Param("pageSize") Integer pageSize);
    //
    //	public long getCountByKeywordAndPage(@Param("keyword") String keyword);

}
