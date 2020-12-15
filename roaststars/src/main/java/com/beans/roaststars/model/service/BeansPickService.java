package com.beans.roaststars.model.service;

import com.beans.roaststars.model.vo.BeansPickListVO;
import com.beans.roaststars.model.vo.BeansPickVO;

public interface BeansPickService {

	BeansPickListVO getAllBeansPickList();
	
	BeansPickVO getOneBeansPick(String beansNo);

	void registerBeansPick(BeansPickVO beansPickVO);

	int getTotalCountBeansPick();

	BeansPickListVO getAllBeansPickList(String pageNo);

	void deleteBeansPick(String beansNo);

	void updateBeansPick(BeansPickVO beansPickVO);

}
