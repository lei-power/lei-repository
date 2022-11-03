package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBJYQZDJB;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface CBJYQZDJBMapper {


	public Integer insert(CBJYQZDJB entity);

	public Integer update(CBJYQZDJB entity);

	public Integer delete(Long id);

    public CBJYQZDJB getById(Long id);

	public List<CBJYQZDJB> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                   @Param("pageSize") Integer pageSize);

	public long getCountByKeywordAndPage(@Param("keyword") String keyword);

}
