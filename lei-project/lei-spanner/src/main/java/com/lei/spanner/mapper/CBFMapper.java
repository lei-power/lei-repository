package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBF;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface CBFMapper {


	public Integer insert(CBF entity);

	public Integer update(CBF entity);

	public Integer delete(Long id);

    public CBF getById(Long id);

	public List<CBF> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                             @Param("pageSize") Integer pageSize);

	public long getCountByKeywordAndPage(@Param("keyword") String keyword);

	CBF getBycbfbm(String cbfbm);
}
