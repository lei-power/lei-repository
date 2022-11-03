package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.LZHT;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface LZHTMapper {


	public Integer insert(LZHT entity);

	public Integer update(LZHT entity);

	public Integer delete(Long id);

    public LZHT getById(Long id);

	public List<LZHT> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                              @Param("pageSize") Integer pageSize);

	public long getCountByKeywordAndPage(@Param("keyword") String keyword);

}
