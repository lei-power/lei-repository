package com.lei.spanner.mapper;


import com.lei.spanner.entity.dto.AllParentOnAreaDTO;
import com.lei.spanner.entity.dto.AreaLocalDTO;
import com.lei.spanner.entity.dto.AreaLocalListAllByCountyDTO;
import com.lei.spanner.entity.po.AreaLocal;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AreaLocalMapper {


	public Integer insert(AreaLocal entity);

	public Integer update(AreaLocal entity);

	public Integer delete(Long id);

    public AreaLocal getById(Long id);

	public List<AreaLocal> getListByKeywordAndPage(@Param("keyword") String keyword, @Param("startIndex") Integer startIndex,
                                                   @Param("pageSize") Integer pageSize);

	public long getCountByKeywordAndPage(@Param("keyword") String keyword);

	List<AreaLocal> getListByParentId(String parentId);

	AreaLocal getByParentIdAndName(@Param("parentId") Long parentId, @Param("name") String name);

	Long getMaxIdByLevel(int level);


	List<AreaLocalDTO> getByAreaIds(@Param("list") List<Long> areaIds);

	AllParentOnAreaDTO getAllParentOnAreaByAreaIdAndAreaLevel(@Param("areaId") String areaId, @Param("areaLevel") Integer areaLevel);

	List<AreaLocalListAllByCountyDTO> listAllByCountryId(@Param("countryId") String countryId);

    void insertBatch(@Param("areaLocalList") List<AreaLocal> areaLocalList);
}
