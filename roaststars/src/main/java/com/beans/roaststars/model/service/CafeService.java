package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.PropertyVO;

public interface CafeService {
	
	// 카페 번호로 카페 정보 조회
	CafeOperatingTimeVO findCafeByCafeNo(String cafeNo);
	
	// 지역으로 카페 리스트 조회
	List<CafeOperatingTimeVO> findListByLoc(String loc);
	
	// 카페 번호로 카페 정보 조회(+특성까지)
	PropertyVO findCafeAndPropertyByCafeNo(String cafeNo);
}
