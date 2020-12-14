package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.MyPickListVO;
import com.beans.roaststars.model.vo.MyPickVO;

public interface MyPickService {
	//마이픽 리스트(페이징)
	MyPickListVO getMyPickList(String id);
	MyPickListVO getMyPickList(String id, String pageNo);
	
	// 사용자별 MyPick 리스트 총 갯수
	int getTotalCountMyPick(String id);
	
	// 마이픽 추가
	int addMyPick(String id, String cafeNo);
	
	//마이픽 삭제(pk)
	int deleteMyPick(String pickNo);
	
	//마이픽 삭제(id, cafeNo)
	int deleteMyPickByIdAndCafeNo(String id, String cafeNo);
	
	// 아이디로 마이픽 리스트 불러오기(No Paging)
	List<MyPickVO> findMyPickListById(String id);
}
