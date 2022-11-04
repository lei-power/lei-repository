package com.lei.spanner.mapper;

import com.lei.spanner.entity.po.ReqData;
import java.util.List;
import org.apache.ibatis.annotations.Param;


public interface ReqDataMapper {


    public Integer insert(ReqData entity);

    public Integer update(ReqData entity);

    public Integer delete(Long id);

    public ReqData getById(Long id);

    public List<ReqData> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                 @Param("pageSize") Integer pageSize);

    public long getCountByKeywordAndPage(@Param("keyword") String keyword);

	List<String> getDkbm();
}
