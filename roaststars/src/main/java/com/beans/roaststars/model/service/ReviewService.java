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
	
	// 리뷰 작성
	void registerReview(ReviewVO reviewVO);
	// 카페 특성 update
	void updateProperty(PropertyVO propertyVO);
	
	// 리뷰 수정
	void updateReview(ReviewVO reviewVO);
	
	// 리뷰 삭제
	void deleteReview(String reviewNo);

}
