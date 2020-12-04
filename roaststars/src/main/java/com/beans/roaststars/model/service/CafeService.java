package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.PropertyVO;

public interface CafeService {
	//no로 카페 찾기
	CafeVO findcafeByNoNotJoin(String cafeNo);
	// 카페 번호로 카페 정보 조회
	CafeOperatingTimeVO findCafeByCafeNo(String cafeNo);
	
	List<CafeOperatingTimeVO> findListByLoc(String loc);

	void registerCafe(CafeVO cafeVO, CafeOperatingTimeVO cafeOperVO);
	
	// 카페 번호로 카페 정보 조회(+특성까지)
	PropertyVO findCafeAndPropertyByCafeNo(String cafeNo);
}
