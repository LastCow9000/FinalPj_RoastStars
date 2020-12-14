package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.beans.roaststars.model.vo.BeansPickVO;

@Mapper
public interface BeansPickMapper {

	List<BeansPickVO> getAllBeansPickList();
	
	List<BeansPickVO> getOneBeansPick(String beansNo);

	void registerBeansPick(BeansPickVO beansPickVO);
	
	void deleteFormBeansPick(String	beansNo);

	void updateFormBeansPick(BeansPickVO beansPickVO);
	
	int getTotalCountBeansPick();
	
}
