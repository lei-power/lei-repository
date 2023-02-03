package com.lei.spanner.mapper;


import com.lei.spanner.entity.po.Area;
import com.lei.spanner.entity.po.AreaTiny;
import java.util.List;
import org.apache.ibatis.annotations.Param;


public interface AreaMapper {

    public Area getById(String id);

    public List<Area> getListByParentId(String parentId);

    public List<AreaTiny> getAllList(@Param("provinceId") String provinceId);

    List<Area> getListByIdListAndLevel(@Param("idList") List<String> idList, @Param("level") Integer level);

    Area getTopAreaByIdAndLevel(@Param("id") String id, @Param("level") Integer level);

    Area getParentAreaByIdAndLevel(@Param("areaId") String areaId);
}
