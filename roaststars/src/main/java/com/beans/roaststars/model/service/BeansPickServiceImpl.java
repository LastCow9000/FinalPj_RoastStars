package com.beans.roaststars.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beans.roaststars.model.mapper.BeansPickMapper;
import com.beans.roaststars.model.vo.BeansPickListVO;
import com.beans.roaststars.model.vo.BeansPickVO;

@Service
public class BeansPickServiceImpl implements BeansPickService{
	@Resource
	private BeansPickMapper beansPickMapper;
	
	@Override
    public BeansPickListVO getAllBeansPickList() {
       return getAllBeansPickList("1");
    }
    
    @Override
    public BeansPickListVO getAllBeansPickList(String pageNo) {
       //카페에 해당하는 전체 리뷰 수
       int beansPickTotalCount = beansPickMapper.getTotalCountBeansPick();

       //페이징 빈 생성
       PagingBean pagingBean = null;
       
       if (pageNo == null)
          pagingBean = new PagingBean(beansPickTotalCount);
       else
          pagingBean = new PagingBean(beansPickTotalCount, Integer.parseInt(pageNo));
       
       // 페이지 그룹 당 페이지 수
	   pagingBean.setPageNumberPerPageGroup(3);
	   //페이지 당 게시물 수
	   pagingBean.setContentNumberPerPage(2);
       
	   BeansPickListVO listVO 
          = new BeansPickListVO(beansPickMapper.getAllBeansPickList(pagingBean), pagingBean);
       
       return listVO;
    }
	
	//빈즈픽 불러오기
	@Override
	public BeansPickVO getOneBeansPick(String beansNo){
		return beansPickMapper.getOneBeansPick(beansNo);
	}
	//빈즈픽 등록하기
	@Override
	public void registerBeansPick(BeansPickVO beansPickVO) {
		beansPickMapper.registerBeansPick(beansPickVO);
	}
	
	//빈즈픽 수정하기
	@Override
	public void updateBeansPick(BeansPickVO beansPickVO) {
		beansPickMapper.updateBeansPick(beansPickVO);
	}
	
	//빈즈픽 삭제하기
	@Override
	public void deleteBeansPick(String beansNo) {
		beansPickMapper.deleteBeansPick(beansNo);
	}
	
	//빈즈픽 총 수량
	@Override
	public int getTotalCountBeansPick() {
		return beansPickMapper.getTotalCountBeansPick();
	}
	
}
