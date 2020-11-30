package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.CafeVO;

public interface CafeService {
	
	// 카페 번호로 카페 정보 조회
	CafeVO findCafeByCafeNo(String cafeNo);
	
	List<CafeVO> findListByLoc(String loc);
	
}
