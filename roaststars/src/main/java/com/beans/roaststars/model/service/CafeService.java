package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.MenuKindVO;
import com.beans.roaststars.model.vo.PropertyVO;

public interface CafeService {
	//List<MenuVO> findMenuByCafeNo(String cafeNo);
	
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

	//자신의 카페리스트 불러오기
	List<CafeVO> getCafeList(String id);

	// 카페 정보 수정하기
	void updateCafe(CafeVO cafeVO, CafeOperatingTimeVO cafeOperVO);

	//카페 삭제하기
	String deleteCafe(String cafeNo);

	// 메뉴 등록 1 : menu table에 등록
	// 메뉴 등록 2: menu_kind table에 등록
	String updateMenu(MenuKindVO menuKindVO);

	// 카페 번호로 메뉴 찾기
	List<MenuKindVO> updateMenuList(String cafeNo);

	//메뉴 이름 중복 체크
	String menuNameCheck(String cafeNo, String menuName);
	
	//메뉴 삭제
	String deleteMenu(String cafeNo, String menuName);
}
