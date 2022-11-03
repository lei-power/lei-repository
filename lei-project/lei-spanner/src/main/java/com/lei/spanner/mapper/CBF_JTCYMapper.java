package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.CBF_JTCY;
import org.apache.ibatis.annotations.Param;
import java.util.List;


public interface CBF_JTCYMapper {


	public Integer insert(CBF_JTCY entity);

	public Integer update(CBF_JTCY entity);

	public Integer delete(Long id);

    public CBF_JTCY getById(Long id);

	public List<CBF_JTCY> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                  @Param("pageSize") Integer pageSize);

	public long getCountByKeywordAndPage(@Param("keyword") String keyword);

}
