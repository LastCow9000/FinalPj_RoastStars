package com.beans.roaststars.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beans.roaststars.model.mapper.CafeMapper;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.CafeVO;
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
	@Transactional
	@Override
	public void registerCafe(CafeVO cafeVO,CafeOperatingTimeVO cafeOperVO) {
		cafeMapper.registerCafe(cafeVO);
		cafeMapper.registerCafeOperatingTime(cafeOperVO);
	}


	@Override
	public CafeVO findcafeByNoNotJoin(String cafeNo) {
		return cafeMapper.findcafeByNoNotJoin(cafeNo);
	}

	// 카페 번호로 카페 정보 조회(+특성까지)
	@Override
	public PropertyVO findCafeAndPropertyByCafeNo(String cafeNo) {
		return cafeMapper.findCafeAndPropertyByCafeNo(cafeNo);
	}
	
	

}
