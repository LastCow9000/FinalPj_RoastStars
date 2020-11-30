package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.ReviewVO;

public interface ReviewService {
	
	// 카페넘버에 해당하는 리뷰 리스트 목록 불러오기
	public List<ReviewVO> findReviewListByCafeNo(String cafeNo);

}
