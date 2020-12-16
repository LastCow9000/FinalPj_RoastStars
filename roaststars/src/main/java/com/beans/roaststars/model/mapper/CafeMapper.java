package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.MenuKindVO;
import com.beans.roaststars.model.vo.MenuVO;
import com.beans.roaststars.model.vo.PropertyVO;

@Mapper
public interface CafeMapper {
	List<MenuVO> findMenuByCafeNo(String cafeNo);

	// 카페 번호로 카페 정보 조회
	CafeOperatingTimeVO findCafeByCafeNo(String CafeNo);
	
	List<CafeOperatingTimeVO> findListByLoc(String loc);

	List<PropertyVO> cafeListSortByProperty(@Param("arrOption") String[] arrOption, @Param("loc") String loc);
	
	void registerCafe(CafeVO cafeVO);
	// 카페 등록 시, 특성 테이블에 해당 카페 넘버 row 추가하기
	void registerCafeProperty(String CafeNo);
	
	CafeVO findcafeByNoNotJoin(String cafeNo);

	void registerCafeOperatingTime(CafeOperatingTimeVO cafeOperVO);

	// 카페 번호로 카페 정보 조회(+특성까지)
	PropertyVO findCafeAndPropertyByCafeNo(String cafeNo);
	//아이디로 자기가 등록한 카페목록 불러오기
	List<CafeVO> getCafeList(String id);
	//카페 정보수정하기
	void updateCafe(CafeVO cafeVO);
	//카페정보중 운영시간 수정하기
	void updateCafeOperatingTime(CafeOperatingTimeVO cafeOperVO);
	//카페 삭제하기
	int deleteCafe(String cafeNo);

	//메뉴 등록 1 : menu table에 등록
	int updateMenu(MenuVO menuVO);
	
	//메뉴 등록 2 : menu_kind table에 등록
	int updateMenuKind(MenuKindVO menuKindVO);

	List<MenuKindVO> updateMenuList(String cafeNo);

	int menuNameCheck(@Param("cafeNo")String cafeNo,@Param("menuName")String menuName);
	//메뉴삭제하기
	int deleteMenu(@Param("cafeNo")String cafeNo, @Param("menuName")String menuName);
}
