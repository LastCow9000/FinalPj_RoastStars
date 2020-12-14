package com.beans.roaststars.model.vo;

import java.util.List;

import com.beans.roaststars.model.service.PagingBean;

public class AdminListVO {
	private List<AuthorityVO> userList;
	private PagingBean pagingBean;
	
	public AdminListVO() {
		super();
	}
	
	public AdminListVO(List<AuthorityVO> userList, PagingBean pagingBean) {
		super();
		this.userList = userList;
		this.pagingBean = pagingBean;
		// 페이지 그룹 당 페이지 수
		pagingBean.setPageNumberPerPageGroup(4);
		//페이지 당 게시물 수
		pagingBean.setContentNumberPerPage(5);
	}
	
	public List<AuthorityVO> getUserList() {
		return userList;
	}
	public void setUserList(List<AuthorityVO> userList) {
		this.userList = userList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	
	@Override
	public String toString() {
		return "AdminListVO [userList=" + userList + ", pagingBean=" + pagingBean + "]";
	}
	
}
