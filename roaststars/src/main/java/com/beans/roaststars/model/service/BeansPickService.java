package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.BeansPickVO;

public interface BeansPickService {

	List<BeansPickVO> getAllBeansPickList();
	
	List<BeansPickVO> getOneBeansPick(String beansNo);

}
