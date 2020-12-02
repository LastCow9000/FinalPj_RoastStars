package com.beans.roaststars.model.vo;

import java.util.List;

import com.beans.roaststars.model.service.PagingBean;

public class ReviewListVO {
	private List<ReviewVO> reviewList;
	private PagingBean pagingBean;
	
	public ReviewListVO() {
		super();
	}

	// reviewList가 적용된 ListVO 생성자
	public ReviewListVO(List<ReviewVO> reviewList, PagingBean pagingBean) {
		super();
		this.reviewList = reviewList;
		this.pagingBean = pagingBean;
		// 페이지 그룹 당 페이지 수
		pagingBean.setPageNumberPerPageGroup(3);
		//페이지 당 게시물 수
		pagingBean.setContentNumberPerPage(4);
	}

	public List<ReviewVO> getReviewList() {
		return reviewList;
	}

	public void setReviewList(List<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [reviewList=" + reviewList + ", pagingBean=" + pagingBean + "]";
	}
	
}
