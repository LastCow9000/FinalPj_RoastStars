package com.beans.roaststars.model.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.beans.roaststars.model.mapper.CafeMapper;
import com.beans.roaststars.model.mapper.ReviewMapper;
import com.beans.roaststars.model.mapper.UserMapper;
import com.beans.roaststars.model.vo.CafeOperatingTimeVO;
import com.beans.roaststars.model.vo.PropertyVO;
import com.beans.roaststars.model.vo.ReviewListVO;
import com.beans.roaststars.model.vo.ReviewVO;
import com.beans.roaststars.model.vo.UserVO;

@Service
public class ReviewServiceImpl implements ReviewService {
   
   @Resource
   private ReviewMapper reviewMapper;
   
   @Resource
   private CafeMapper cafeMapper;
   
   @Resource
   private UserMapper userMapper;
   
   // 카페넘버에 해당하는 리뷰 리스트 목록 불러오기

   // findReviewListByCafeNo(String cafeNo)
   // : 페이지 번호가 없을 때는 default 1 page
   @Override
   public ReviewListVO findReviewListByCafeNo(String cafeNo) {
      return findReviewListByCafeNo(cafeNo,"1");
   }
   
   @Override
   public ReviewListVO findReviewListByCafeNo(String cafeNo, String pageNo) {
      //카페에 해당하는 전체 리뷰 수
      int postTotalCount = reviewMapper.findReviewTotalCountByCafeNo(cafeNo);

      //페이징 빈 생성
      PagingBean pagingBean = null;
      
      if (pageNo == null)
         pagingBean = new PagingBean(postTotalCount);
      else
         pagingBean = new PagingBean(postTotalCount, Integer.parseInt(pageNo));
      
      //Review List에 해당하는 페이징 빈 초기 설정
      // setContentNumberPerPage : 한 페이지 당 나오는 리뷰 수
      // setPageNumberPerPageGroup : 페이지 그룹 당 속하는 페이지 수
      pagingBean.setContentNumberPerPage(4);
      pagingBean.setPageNumberPerPageGroup(3);
      
      ReviewListVO listVO 
         = new ReviewListVO(reviewMapper.findReviewListByCafeNo(cafeNo, pagingBean), pagingBean);
      
      return listVO;
   }
   
   // 카페넘버에 해당하는 리뷰 총 개수 조회하기
   @Override
   public int findReviewTotalCountByCafeNo(String cafeNo) {
      return reviewMapper.findReviewTotalCountByCafeNo(cafeNo);
   }

   // 리뷰 번호로 리뷰 정보 조회
   @Override
   public ReviewVO findReviewByReviewNo(String reviewNo) {
      return reviewMapper.findReviewByReviewNo(reviewNo);
   }
   
   //리뷰 등록 전, 해당 아이디로 해당 카페에 리뷰 등록 여부 확인
   @Override
   public int checkDuplicatedReview(String cafeNo, String id) {
	   return reviewMapper.checkDuplicatedReview(cafeNo, id);
   }
   
   // 리뷰 작성 및 카페 특성 update 는 둘 다 이루어져야함
   // --> 트랜잭션 처리
   @Transactional 
   @Override
   public void registerReviewAndUpdateProperty(ReviewVO reviewVO, PropertyVO propertyVO, String cafeNo, String id) {
      // 리뷰 쓸 대상 cafeOperVO 가져오기
      CafeOperatingTimeVO cafeOperVO = cafeMapper.findCafeByCafeNo(cafeNo);
      // 리뷰 쓰는 대상 userVO 가져오기
      UserVO userVO = userMapper.findUserById(id);
      
      //reviewVO에 cafeOperVO의 cafeVO, userVO 할당
      reviewVO.setCafeVO(cafeOperVO.getCafeVO());
      reviewVO.setUserVO(userVO);
      
      //reviewVO로 registerReview 동작하여 리뷰 등록
      reviewMapper.registerReview(reviewVO);
      // 특성 업데이트를 위해 PropertyVO에 cafeVO 넣기
      propertyVO.setCafeVO(cafeOperVO.getCafeVO());
      
      // 해당 카페+특성 테이블 조인하여, 특성값 update
      reviewMapper.updateProperty(propertyVO);
      
      // 리뷰 평가 내용 evaluated_property 테이블에 등록
      reviewMapper.insertEvalProperty(reviewVO.getReviewNo(), propertyVO);
   }
   
   // 리뷰 삭제
   @Transactional
   @Override
   public void deleteReviewAndRollbackProperty(String reviewNo) {
	   //리뷰 넘버로 카페 특성 불러오기
	   PropertyVO propertyVO = reviewMapper.findPropertyByReviewNo(reviewNo);
	   
	   //해당 카페 특성 롤백하기
	   reviewMapper.rollbackProperty(propertyVO);
	   
	   //리뷰 테이블에서 해당 리뷰 지우기
	   reviewMapper.deleteReview(reviewNo);
   }


}