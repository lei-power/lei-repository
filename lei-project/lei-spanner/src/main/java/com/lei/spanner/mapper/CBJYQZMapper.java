package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBJYQZ;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface CBJYQZMapper {


	public Integer insert(CBJYQZ entity);

	public Integer update(CBJYQZ entity);

	public Integer delete(Long id);

    public CBJYQZ getById(Long id);

	public List<CBJYQZ> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                @Param("pageSize") Integer pageSize);

	public long getCountByKeywordAndPage(@Param("keyword") String keyword);

}
