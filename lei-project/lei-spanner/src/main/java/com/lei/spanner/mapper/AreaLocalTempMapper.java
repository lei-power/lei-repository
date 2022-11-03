package com.lei.spanner.mapper;


import com.lei.spanner.entity.po.AreaLocalTemp;
import java.util.List;
import org.apache.ibatis.annotations.Param;


public interface AreaLocalTempMapper {


    public Integer insert(AreaLocalTemp entity);

    public Integer update(AreaLocalTemp entity);

    public Integer delete(Long id);

    public AreaLocalTemp getById(Long id);

    public List<AreaLocalTemp> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                       @Param("pageSize") Integer pageSize);

    public long getCountByKeywordAndPage(@Param("keyword") String keyword);

    List<AreaLocalTemp> getByVillageCode(@Param("code")String code);
}
