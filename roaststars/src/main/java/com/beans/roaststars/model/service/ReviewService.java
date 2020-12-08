package com.beans.roaststars.model.service;


import com.beans.roaststars.model.vo.PropertyVO;
import com.beans.roaststars.model.vo.ReviewListVO;
import com.beans.roaststars.model.vo.ReviewVO;

public interface ReviewService {
	
	// 카페넘버에 해당하는 리뷰 리스트 목록 불러오기
	//  : 페이지 번호가 없을 때는 default 1 page
	ReviewListVO findReviewListByCafeNo(String cafeNo);
	
	// getPostList() : 페이지 번호가 없을 때는 default 1 page
	ReviewListVO findReviewListByCafeNo(String cafeNo, String pageNo);
	
	// 카페넘버에 해당하는 리뷰 총 개수 조회하기
	int findReviewTotalCountByCafeNo(String cafeNo);
	
	// 리뷰 번호로 리뷰 정보 조회
	ReviewVO findReviewByReviewNo(String reviewNo);
	
	//리뷰 등록 전, 해당 아이디로 해당 카페에 리뷰 등록 여부 확인
	// 1: 중복, 0: 사용가능
	int checkDuplicatedReview(String cafeNo, String id);

	// 리뷰 작성
	public void registerReviewAndUpdateProperty(ReviewVO reviewVO, PropertyVO propertyVO, String cafeNo, String id);

	// 리뷰 삭제
	void deleteReviewAndRollbackProperty(String reviewNo);


}
