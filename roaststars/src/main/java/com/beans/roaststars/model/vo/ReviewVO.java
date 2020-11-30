package com.beans.roaststars.model.vo;

public class ReviewVO {
	private String reviewNo;
	private String reviewContent;
	private String reviewRegdate;
	private CafeVO cafeVO;
	private UserVO userVO;
	
	public ReviewVO() {
		super();
	}

	public ReviewVO(String reviewNo, String reviewContent, String reviewRegdate, CafeVO cafeVO, UserVO userVO) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewRegdate = reviewRegdate;
		this.cafeVO = cafeVO;
		this.userVO = userVO;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewRegdate() {
		return reviewRegdate;
	}

	public void setReviewRegdate(String reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}

	public CafeVO getCafeVO() {
		return cafeVO;
	}

	public void setCafeVO(CafeVO cafeVO) {
		this.cafeVO = cafeVO;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", reviewRegdate="
				+ reviewRegdate + ", cafeVO=" + cafeVO + ", userVO=" + userVO + "]";
	}
	
}
