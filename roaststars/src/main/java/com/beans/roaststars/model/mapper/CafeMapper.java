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
	
	// 지역으로 카페 목록 불러오기
	List<CafeOperatingTimeVO> findListByLoc(String loc);

	List<PropertyVO> cafeListSortByProperty(@Param("arrOption") String[] arrOption, @Param("loc") String loc);
}
