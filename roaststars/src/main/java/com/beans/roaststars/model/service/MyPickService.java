package com.beans.roaststars.model.service;

import com.beans.roaststars.model.vo.MyPickListVO;

public interface MyPickService {
	//마이픽 리스트(페이징)
	MyPickListVO getMyPickList(String id);
	MyPickListVO getMyPickList(String id, String pageNo);
	
	// 사용자별 MyPick 리스트 총 갯수
	int getTotalCountMyPick(String id);
	
	// 마이픽 추가
	int addMyPick(String id, String cafeNo);
	
	//마이픽 삭제
	int deleteMyPick(String pickNo);
}
