package com.beans.roaststars.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class BeansPickVO {
	private String beansNo;
	private String beansTitle;
	private String beansContent;
	private MultipartFile uploadFile;
	private String beansPic;
	private String beansRegdate;
	private UserVO userVO;
	public BeansPickVO(String beansNo, String beansTitle, String beansContent, MultipartFile uploadFile,
			String beansPic, String beansRegdate, UserVO userVO) {
		super();
		this.beansNo = beansNo;
		this.beansTitle = beansTitle;
		this.beansContent = beansContent;
		this.uploadFile = uploadFile;
		this.beansPic = beansPic;
		this.beansRegdate = beansRegdate;
		this.userVO = userVO;
	}
	public BeansPickVO() {
		super();
		// TODO Auto-generated constructor stub
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
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getBeansPic() {
		return beansPic;
	}
	public void setBeansPic(String beansPic) {
		this.beansPic = beansPic;
	}
	public String getBeansRegdate() {
		return beansRegdate;
	}
	public void setBeansRegdate(String beansRegdate) {
		this.beansRegdate = beansRegdate;
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
				+ ", uploadFile=" + uploadFile + ", beansPic=" + beansPic + ", beansRegdate=" + beansRegdate
				+ ", userVO=" + userVO + "]";
	}
	
}