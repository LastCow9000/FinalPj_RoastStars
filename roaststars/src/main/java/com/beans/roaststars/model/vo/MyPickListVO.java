package com.beans.roaststars.model.vo;

import java.util.List;

import com.beans.roaststars.model.service.PagingBean;

public class MyPickListVO {
	private List<MyPickVO> myPickList;
	private PagingBean pagingBean;
	public MyPickListVO() {
		super();
	}
	public MyPickListVO(List<MyPickVO> myPickList, PagingBean pagingBean) {
		super();
		this.myPickList = myPickList;
		this.pagingBean = pagingBean;
		pagingBean.setContentNumberPerPage(6);
		pagingBean.setPageNumberPerPageGroup(4);
	}
	public List<MyPickVO> getMyPickList() {
		return myPickList;
	}
	public void setMyPickList(List<MyPickVO> myPickList) {
		this.myPickList = myPickList;
	}
	public PagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "MyPickListVO [myPickList=" + myPickList + ", pagingBean=" + pagingBean + "]";
	}
}
