package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.MenuVO;
import com.beans.roaststars.model.vo.PropertyVO;

public interface CafeService {
	List<MenuVO> findMenuByCafeNo(String cafeNo);
	
	//no로 카페 찾기
	CafeVO findcafeByNoNotJoin(String cafeNo);
	
	// 카페 번호로 카페 정보 조회
	CafeOperatingTimeVO findCafeByCafeNo(String cafeNo);

	// 지역으로 카페 리스트 조회
	List<CafeOperatingTimeVO> findListByLoc(String loc);

	// 특성으로 카페리스트 정렬
	List<PropertyVO> cafeListSortByProperty(String[] arrOption, String loc);
	
	// 카페등록
	void registerCafe(CafeVO cafeVO, CafeOperatingTimeVO cafeOperVO);
	
	// 카페 번호로 카페 정보 조회(+특성까지)
	PropertyVO findCafeAndPropertyByCafeNo(String cafeNo);

	List<CafeVO> getCafeList(String id);

	void updateCafe(CafeVO cafeVO, CafeOperatingTimeVO cafeOperVO);

	String deleteCafe(String cafeNo);


	String updateMenu(MenuVO menuVO);

	List<MenuVO> updateMenuList(String cafeNo);

	String menuNameCheck(String cafeNo, String menuName);

	String deleteMenu(String cafeNo, String menuName);
}
