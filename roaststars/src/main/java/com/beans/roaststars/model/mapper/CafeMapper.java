package com.beans.roaststars.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.beans.roaststars.model.vo.CafeVO;

@Mapper
public interface CafeMapper {
	
	// 카페 번호로 카페 정보 조회
	CafeVO findCafeByCafeNo(String CafeNo);
	
}
