package com.beans.roaststars.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class BeansPickVO {
	private String beansNo;
	private String beansTitle;
	private String beansContent;
	private MultipartFile beansPic;
	private String beans_regdate;
	private UserVO userVO;
	
	public BeansPickVO() {
		super();
	}

	public BeansPickVO(String beansNo, String beansTitle, String beansContent, MultipartFile beansPic,
			String beans_regdate, UserVO userVO) {
		super();
		this.beansNo = beansNo;
		this.beansTitle = beansTitle;
		this.beansContent = beansContent;
		this.beansPic = beansPic;
		this.beans_regdate = beans_regdate;
		this.userVO = userVO;
	}

	public String getBeansNo() {
		return beansNo;
	}

	public void setBeansNo(String beansNo) {
		this.beansNo = beansNo;
	}

	public String getBeansTitle() {
		return beansTitle;
	}

	public void setBeansTitle(String beansTitle) {
		this.beansTitle = beansTitle;
	}

	public String getBeansContent() {
		return beansContent;
	}

	public void setBeansContent(String beansContent) {
		this.beansContent = beansContent;
	}

	public MultipartFile getBeansPic() {
		return beansPic;
	}

	public void setBeansPic(MultipartFile beansPic) {
		this.beansPic = beansPic;
	}

	public String getBeans_regdate() {
		return beans_regdate;
	}

	public void setBeans_regdate(String beans_regdate) {
		this.beans_regdate = beans_regdate;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "BeansPickVO [beansNo=" + beansNo + ", beansTitle=" + beansTitle + ", beansContent=" + beansContent
				+ ", beansPic=" + beansPic + ", beans_regdate=" + beans_regdate + ", userVO=" + userVO + "]";
	}

}
