package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.PropertyVO;

@Mapper
public interface CafeMapper {
	
	// 카페 번호로 카페 정보 조회
	CafeOperatingTimeVO findCafeByCafeNo(String CafeNo);
	
	List<CafeOperatingTimeVO> findListByLoc(String loc);

	List<PropertyVO> cafeListSortByProperty(@Param("arrOption") String[] arrOption, @Param("loc") String loc);
	
	void registerCafe(CafeVO cafeVO);

	CafeVO findcafeByNoNotJoin(String cafeNo);

	void registerCafeOperatingTime(CafeOperatingTimeVO cafeOperVO);

	// 카페 번호로 카페 정보 조회(+특성까지)
	PropertyVO findCafeAndPropertyByCafeNo(String cafeNo);
}
