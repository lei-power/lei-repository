package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBJYQZ_QZBF;
import java.util.List;
import org.apache.ibatis.annotations.Param;


public interface CBJYQZ_QZBFMapper {


    public Integer insert(CBJYQZ_QZBF entity);

    public Integer update(CBJYQZ_QZBF entity);

    public Integer delete(Long id);

    public CBJYQZ_QZBF getById(Long id);

    public List<CBJYQZ_QZBF> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                     @Param("pageSize") Integer pageSize);

    public long getCountByKeywordAndPage(@Param("keyword") String keyword);

}
