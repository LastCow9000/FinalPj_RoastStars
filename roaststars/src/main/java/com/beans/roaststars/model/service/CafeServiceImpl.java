package com.beans.roaststars.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beans.roaststars.model.mapper.CafeMapper;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.MenuKindVO;
import com.beans.roaststars.model.vo.PropertyVO;

@Service
public class CafeServiceImpl implements CafeService {

	@Resource
	private CafeMapper cafeMapper;
	
	//카페 번호로 카페 정보 조회
	@Override
	public CafeOperatingTimeVO findCafeByCafeNo(String cafeNo) {
		return cafeMapper.findCafeByCafeNo(cafeNo);
	}
	
	//지역으로 카페 리스트 조회
    @Override
    public List<CafeOperatingTimeVO> findListByLoc(String loc) {
       return cafeMapper.findListByLoc(loc);
    }
    
    //특성으로 카패 리스트 정렬
	@Override
	public List<PropertyVO> cafeListSortByProperty(String[] arrOption, String loc) {
		return cafeMapper.cafeListSortByProperty(arrOption, loc);
	}
	
	//카페 등록
	@Transactional
	@Override
	public void registerCafe(CafeVO cafeVO,CafeOperatingTimeVO cafeOperVO) {
		if(cafeVO.getCafePic()==null)
			cafeVO.setCafePic("no_image.jpg");
		cafeMapper.registerCafe(cafeVO);
		cafeMapper.registerCafeProperty(cafeVO.getCafeNo());
		cafeMapper.registerCafeOperatingTime(cafeOperVO);
	}

	// 비sql join 카페정보 찾기
	@Override
	public CafeVO findcafeByNoNotJoin(String cafeNo) {
		return cafeMapper.findcafeByNoNotJoin(cafeNo);
	}

	// 카페 번호로 카페 정보 조회(+특성까지)
	@Override
	public PropertyVO findCafeAndPropertyByCafeNo(String cafeNo) {
		return cafeMapper.findCafeAndPropertyByCafeNo(cafeNo);
	}
	//자신의 카페리스트 불러오기
	@Override
	public List<CafeVO> getCafeList(String id) {
		return cafeMapper.getCafeList(id);
	}
	
	// 카페 정보 수정하기
	@Transactional
	@Override
	public void updateCafe(CafeVO cafeVO, CafeOperatingTimeVO cafeOperVO) {
		if(cafeVO.getCafePic()==null)
			cafeVO.setCafePic("no_image.jpg");
		cafeMapper.updateCafe(cafeVO);
		cafeMapper.updateCafeOperatingTime(cafeOperVO);
	}

	//카페 삭제하기
	@Override
	public String deleteCafe(String cafeNo) {
		int count = cafeMapper.deleteCafe(cafeNo);
		return (count == 1) ? "ok" : "fail";
	}

	// 메뉴 등록 
	// 1 : menu table에 등록
	// 2: menu_kind table에 등록
	@Transactional
	@Override
	public String updateMenu(MenuKindVO menuKindVO) {
		int count1 = cafeMapper.updateMenu(menuKindVO.getMenuVO());
		int count2 = cafeMapper.updateMenuKind(menuKindVO);
		return (count1 == 1 && count2 ==1) ? "ok" : "fail";
	}

	// 카페 번호로 메뉴 찾기

	@Override

	public List<MenuKindVO> updateMenuList(String cafeNo) {
		return cafeMapper.updateMenuList(cafeNo);
	}
	
	//메뉴 이름 중복 체크
	@Override
	public String menuNameCheck(String cafeNo, String menuName) {
		int count = cafeMapper.menuNameCheck(cafeNo,menuName);
		return (count==0)? "ok":"fail";
	}
	
	//메뉴 삭제
	@Override
	public String deleteMenu(String cafeNo, String menuName) {
		int count = cafeMapper.deleteMenu(cafeNo,menuName);
		return (count == 1) ? "ok":"fail";
	}

}
