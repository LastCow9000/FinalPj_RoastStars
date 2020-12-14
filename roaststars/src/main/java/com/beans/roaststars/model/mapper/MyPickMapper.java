package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.beans.roaststars.model.service.PagingBean;
import com.beans.roaststars.model.vo.MyPickVO;

@Mapper
public interface MyPickMapper {
	// 마이픽 리스트 불러오기
	List<MyPickVO> getMyPickList(@Param("id") String id, @Param("pagingBean") PagingBean pagingBean);
	
	// 사용자별 MyPick 리스트 총 갯수
	int getTotalCountMyPick(String id);
	
	// 마이픽 추가
	int addMyPick(@Param("id") String id, @Param("cafeNo") String cafeNo);
	
	//마이픽 삭제(pk)
	int deleteMyPick(String pickNo);
	
	//마이픽 삭제(id, cafeNo)
	int deleteMyPickByIdAndCafeNo(@Param("id") String id, @Param("cafeNo") String cafeNo);	
	
	// 아이디로 마이픽 리스트 불러오기(No Paging)
	List<MyPickVO> findMyPickListById(String id);
}
