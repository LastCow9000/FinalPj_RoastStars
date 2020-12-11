package com.beans.roaststars.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beans.roaststars.model.mapper.MyPickMapper;
import com.beans.roaststars.model.vo.MyPickListVO;

@Service
public class MyPickServiceImpl implements MyPickService {
	
	@Resource
	MyPickMapper myPickMapper;
	
	@Override
	public MyPickListVO getMyPickList(String id) {
		return getMyPickList(id ,"1");
	}

	@Override
	public MyPickListVO getMyPickList(String id, String pageNo) {
		// 사용자별 마이픽 총 갯수
		int TotalCountMyPick = myPickMapper.getTotalCountMyPick(id);
		
		//페이징 빈 생성
		PagingBean pagingBean = null;
		if(pageNo == null)
			pagingBean = new PagingBean(TotalCountMyPick);
		else
			pagingBean = new PagingBean(TotalCountMyPick, Integer.parseInt(pageNo));
		
		pagingBean.setContentNumberPerPage(6);
		pagingBean.setPageNumberPerPageGroup(4);

		MyPickListVO myPickListVO = new MyPickListVO(myPickMapper.getMyPickList(id, pagingBean), pagingBean);
		return myPickListVO;
	}
	
	// 사용자별 마이픽 총 갯수
	@Override
	public int getTotalCountMyPick(String id) {
		return myPickMapper.getTotalCountMyPick(id);
	}
	
	// 마이픽 추가
	@Override
	public int addMyPick(String id, String cafeNo) {
		return myPickMapper.addMyPick(id, cafeNo);
	}

	// 마이픽 삭제
	@Override
	public int deleteMyPick(String pickNo) {
		return myPickMapper.deleteMyPick(pickNo);
	}

}
