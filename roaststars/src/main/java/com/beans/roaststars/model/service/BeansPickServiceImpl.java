package com.beans.roaststars.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beans.roaststars.model.mapper.BeansPickMapper;
import com.beans.roaststars.model.vo.BeansPickVO;

@Service
public class BeansPickServiceImpl implements BeansPickService{
	@Resource
	private BeansPickMapper beansPickMapper;
	
	//빈즈픽 리스트 불러오기
	@Override
	public List<BeansPickVO> getAllBeansPickList(){
		return beansPickMapper.getAllBeansPickList();
	}
	//빈즈픽 불러오기
	@Override
	public List<BeansPickVO> getOneBeansPick(String beansNo){
		return beansPickMapper.getOneBeansPick(beansNo);
	}
	
}
