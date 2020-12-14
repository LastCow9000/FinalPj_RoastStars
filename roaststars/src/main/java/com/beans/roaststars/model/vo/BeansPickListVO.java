package com.beans.roaststars.model.vo;

import java.util.List;

import com.beans.roaststars.model.service.PagingBean;

public class BeansPickListVO {
	private List<BeansPickVO> beansPickList;
	private PagingBean pagingBean;

	public BeansPickListVO(List<BeansPickVO> beansPickList, PagingBean pagingBean) {
		super();
		this.beansPickList = beansPickList;
		this.pagingBean = pagingBean;
		// 페이지 그룹 당 페이지 수
		pagingBean.setPageNumberPerPageGroup(3);
		// 페이지 당 게시물 수
		pagingBean.setContentNumberPerPage(3);
	}

	public BeansPickListVO() {
		super();
	}

	public List<BeansPickVO> getBeansPickList() {
		return beansPickList;
	}

	public void setBeansPickList(List<BeansPickVO> beansPickList) {
		this.beansPickList = beansPickList;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "BeansPickListVO [beansPickList=" + beansPickList + ", pagingBean=" + pagingBean + "]";
	}
}
