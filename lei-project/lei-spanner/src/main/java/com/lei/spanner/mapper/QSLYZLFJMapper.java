package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.QSLYZLFJ;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface QSLYZLFJMapper {


	public Integer insert(QSLYZLFJ entity);

	public Integer update(QSLYZLFJ entity);

	public Integer delete(Long id);

    public QSLYZLFJ getById(Long id);

	public List<QSLYZLFJ> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                  @Param("pageSize") Integer pageSize);

	public long getCountByKeywordAndPage(@Param("keyword") String keyword);

}
