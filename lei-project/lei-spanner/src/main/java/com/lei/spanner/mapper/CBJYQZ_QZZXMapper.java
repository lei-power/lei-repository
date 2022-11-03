package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBJYQZ_QZZX;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface CBJYQZ_QZZXMapper {


	public Integer insert(CBJYQZ_QZZX entity);

	public Integer update(CBJYQZ_QZZX entity);

	public Integer delete(Long id);

    public CBJYQZ_QZZX getById(Long id);

	public List<CBJYQZ_QZZX> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                     @Param("pageSize") Integer pageSize);

	public long getCountByKeywordAndPage(@Param("keyword") String keyword);

}
