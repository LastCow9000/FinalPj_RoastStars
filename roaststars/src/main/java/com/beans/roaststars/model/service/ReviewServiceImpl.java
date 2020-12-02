package com.beans.roaststars.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beans.roaststars.model.mapper.ReviewMapper;
import com.beans.roaststars.model.vo.PropertyVO;
import com.beans.roaststars.model.vo.ReviewListVO;
import com.beans.roaststars.model.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Resource
	private ReviewMapper reviewMapper;
	
	// 카페넘버에 해당하는 리뷰 리스트 목록 불러오기

	// findReviewListByCafeNo(String cafeNo)
	// : 페이지 번호가 없을 때는 default 1 page
	@Override
	public ReviewListVO findReviewListByCafeNo(String cafeNo) {
		return findReviewListByCafeNo(cafeNo,"1");
	}
	
	@Override
	public ReviewListVO findReviewListByCafeNo(String cafeNo, String pageNo) {
		//카페에 해당하는 전체 리뷰 수
		int postTotalCount = reviewMapper.findReviewTotalCountByCafeNo(cafeNo);

		//페이징 빈 생성
		PagingBean pagingBean = null;
		
		if (pageNo == null)
			pagingBean = new PagingBean(postTotalCount);
		else
			pagingBean = new PagingBean(postTotalCount, Integer.parseInt(pageNo));
		
		//Review List에 해당하는 페이징 빈 초기 설정
		// setContentNumberPerPage : 한 페이지 당 나오는 리뷰 수
		// setPageNumberPerPageGroup : 페이지 그룹 당 속하는 페이지 수
		pagingBean.setContentNumberPerPage(4);
		pagingBean.setPageNumberPerPageGroup(3);
		
		ReviewListVO listVO 
			= new ReviewListVO(reviewMapper.findReviewListByCafeNo(cafeNo, pagingBean), pagingBean);
		
		return listVO;
	}
	
	// 카페넘버에 해당하는 리뷰 총 개수 조회하기
	@Override
	public int findReviewTotalCountByCafeNo(String cafeNo) {
		return reviewMapper.findReviewTotalCountByCafeNo(cafeNo);
	}

	// 리뷰 번호로 리뷰 정보 조회
	@Override
	public ReviewVO findReviewByReviewNo(String reviewNo) {
		return null;
	}
	
	// 리뷰 작성 및 카페 특성 update 는 둘 다 이루어져야함
	// --> 트랜잭션 처리
	@Transactional 
	@Override
	public void registerReview(ReviewVO reviewVO) {
	}
	
	@Override
	public void updateProperty(PropertyVO propertyVO) {
	}
	
	// 리뷰 수정
	@Override
	public void updateReview(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
	}
	
	// 리뷰 삭제
	@Override
	public void deleteReview(String reviewNo) {
		// TODO Auto-generated method stub
	}


}
