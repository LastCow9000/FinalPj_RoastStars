package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.beans.roaststars.model.vo.CafeVO;

@Mapper
public interface CafeMapper {
	
	// 카페 번호로 카페 정보 조회
	CafeVO findCafeByCafeNo(String CafeNo);
	
	List<CafeVO> findListByLoc(String loc);
	
	
}
