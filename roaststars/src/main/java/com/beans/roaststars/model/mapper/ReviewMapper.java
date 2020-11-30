package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.beans.roaststars.model.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
	
	// 카페넘버에 해당하는 리뷰 리스트 목록 불러오기
	public List<ReviewVO> findReviewListByCafeNo(String cafeNo);
	
	// 카페넘버에 해당하는 리뷰 총 개수 조회하기
	public int findReviewTotalCountByCafeNo(String cafeNo);
	
	// 리뷰 번호로 리뷰 정보 조회
	
	// 리뷰 작성
	
	// 리뷰 수정
	
	// 리뷰 삭제
	
}
