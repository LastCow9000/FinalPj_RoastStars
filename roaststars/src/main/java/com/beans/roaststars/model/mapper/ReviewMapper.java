package com.beans.roaststars.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.beans.roaststars.model.service.PagingBean;
import com.beans.roaststars.model.vo.PropertyVO;
import com.beans.roaststars.model.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
   
   // 카페넘버에 해당하는 리뷰 리스트 목록 불러오기
   // 파라미터 값으로 두 개의 타입 보내기
   List<ReviewVO> findReviewListByCafeNo(@Param("cafeNo") String cafeNo, 
         @Param("pagingBean") PagingBean pagingBean);
   
   // 카페넘버에 해당하는 리뷰 총 개수 조회하기
   int findReviewTotalCountByCafeNo(String cafeNo);
   
   // 리뷰 번호로 리뷰 정보 조회
   ReviewVO findReviewByReviewNo(String reviewNo);
   
   //리뷰 등록 전, 해당 아이디로 해당 카페에 리뷰 등록 여부 확인
   int checkDuplicatedReview(String cafeNo, String id);
   
   // 리뷰 작성
   void registerReview(ReviewVO reviewVO);
   // 카페 특성 update
   void updateProperty(PropertyVO propertyVO);
   // 리뷰 평가 내용 insert
   void insertEvalProperty(@Param("reviewNo") String reviewNo,
		   @Param("propertyVO") PropertyVO propertyVO);
  
   // 리뷰 번호로 평가 정보 조회
   PropertyVO findPropertyByReviewNo(String reviewNo);
   
   // 리뷰 삭제
   void deleteReview(String reviewNo);
   // 카페 특성 update(rollback)
   void rollbackProperty(PropertyVO propertyVO);
  
}