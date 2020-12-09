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
	
	// 카페 등록
	void registerCafe(CafeVO cafeVO);
	//카페 등록 시, property 테이블에 카페 넘버로 row 삽입
	void registerCafeProperty(String cafeNo);
	
	CafeVO findcafeByNoNotJoin(String cafeNo);

	void registerCafeOperatingTime(CafeOperatingTimeVO cafeOperVO);

	// 카페 번호로 카페 정보 조회(+특성까지)
	PropertyVO findCafeAndPropertyByCafeNo(String cafeNo);

	List<CafeVO> getCafeList(String id);

	void updateCafe(CafeVO cafeVO);

	void updateCafeOperatingTime(CafeOperatingTimeVO cafeOperVO);

	int deleteCafe(String cafeNo);
}
