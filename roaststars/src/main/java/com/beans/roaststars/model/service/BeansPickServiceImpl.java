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
	//빈즈픽 등록하기
	@Override
	public void registerBeansPick(BeansPickVO beansPickVO) {
		beansPickMapper.registerBeansPick(beansPickVO);
	}
	//빈즈픽 수정하기
	@Override
	public void updateFormBeansPick(BeansPickVO beansPickVO) {
		beansPickMapper.updateFormBeansPick(beansPickVO);
	}
	//빈즈픽 삭제하기
	@Override
	public void deleteFormBeansPick(String beansNo) {
		beansPickMapper.deleteFormBeansPick(beansNo);
	}
	//빈즈픽 총 수량
	@Override
	public int getTotalCountBeansPick() {
		return beansPickMapper.getTotalCountBeansPick();
	}
	
}
