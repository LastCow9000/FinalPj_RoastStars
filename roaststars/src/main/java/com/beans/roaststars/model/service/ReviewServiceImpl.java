package com.beans.roaststars.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beans.roaststars.model.mapper.ReviewMapper;
import com.beans.roaststars.model.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Resource
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> findReviewListByCafeNo(String cafeNo) {
		return reviewMapper.findReviewListByCafeNo(cafeNo);
	}

}
