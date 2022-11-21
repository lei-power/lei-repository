package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBJYQZ_QZHF;
import java.util.List;
import org.apache.ibatis.annotations.Param;


public interface CBJYQZ_QZHFMapper {


    public Integer insert(CBJYQZ_QZHF entity);

    public Integer update(CBJYQZ_QZHF entity);

    public Integer delete(Long id);

    public CBJYQZ_QZHF getById(Long id);

    public List<CBJYQZ_QZHF> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                     @Param("pageSize") Integer pageSize);

    public long getCountByKeywordAndPage(@Param("keyword") String keyword);

}
