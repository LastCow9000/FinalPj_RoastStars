package com.beans.roaststars.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beans.roaststars.model.mapper.CafeMapper;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
import com.beans.roaststars.model.vo.MenuVO;
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
	@Transactional
	@Override
	public void updateCafe(CafeVO cafeVO, CafeOperatingTimeVO cafeOperVO) {
		cafeMapper.updateCafe(cafeVO);
		cafeMapper.updateCafeOperatingTime(cafeOperVO);
	}

	@Override
	public String deleteCafe(String cafeNo) {
		int count = cafeMapper.deleteCafe(cafeNo);
		System.out.println(count);
		return (count == 1) ? "ok" : "fail";
	}

	@Override
	public void updateMenu(MenuVO menuVO) {
		cafeMapper.updateMenu(menuVO);
	}

	@Override
	public List<MenuVO> findMenuByCafeNo(String cafeNo) {
		return cafeMapper.findMenuByCafeNo(cafeNo);
	}

}
