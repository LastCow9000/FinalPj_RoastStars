package com.beans.roaststars.model.service;

import com.beans.roaststars.model.vo.CafeVO;

public interface CafeService {
	
	// 카페 번호로 카페 정보 조회
	public CafeVO findCafeByCafeNo(String cafeNo);
	
}
