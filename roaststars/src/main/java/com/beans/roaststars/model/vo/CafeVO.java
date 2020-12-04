package com.beans.roaststars.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class CafeVO {
   private String cafeNo;
   private String cafeName;
   private String cafeLoc;
   private MultipartFile uploadFile;
   private String cafePic;
   private String cafeInfo;
   private String cafeTel;
   private UserVO userVO;
   
   public CafeVO() {
      super();
   }

   public CafeVO(String cafeNo, String cafeName, String cafeLoc, MultipartFile uploadFile, String cafePic,
         String cafeInfo, String cafeTel, UserVO userVO) {
      super();
      this.cafeNo = cafeNo;
      this.cafeName = cafeName;
      this.cafeLoc = cafeLoc;
      this.uploadFile = uploadFile;
      this.cafePic = cafePic;
      this.cafeInfo = cafeInfo;
      this.cafeTel = cafeTel;
      this.userVO = userVO;
   }

   public String getCafeNo() {
      return cafeNo;
   }

   public void setCafeNo(String cafeNo) {
      this.cafeNo = cafeNo;
   }

   public String getCafeName() {
      return cafeName;
   }

   public void setCafeName(String cafeName) {
      this.cafeName = cafeName;
   }

   public String getCafeLoc() {
      return cafeLoc;
   }

   public void setCafeLoc(String cafeLoc) {
      this.cafeLoc = cafeLoc;
   }

   public MultipartFile getUploadFile() {
      return uploadFile;
   }

   public void setUploadFile(MultipartFile uploadFile) {
      this.uploadFile = uploadFile;
   }

   public String getCafePic() {
      return cafePic;
   }

   public void setCafePic(String cafePic) {
      this.cafePic = cafePic;
   }

   public String getCafeInfo() {
      return cafeInfo;
   }

   public void setCafeInfo(String cafeInfo) {
      this.cafeInfo = cafeInfo;
   }

   public String getCafeTel() {
      return cafeTel;
   }

   public void setCafeTel(String cafeTel) {
      this.cafeTel = cafeTel;
   }

   public UserVO getUserVO() {
      return userVO;
   }

   public void setUserVO(UserVO userVO) {
      this.userVO = userVO;
   }

   @Override
   public String toString() {
      return "CafeVO [cafeNo=" + cafeNo + ", cafeName=" + cafeName + ", cafeLoc=" + cafeLoc + ", uploadFile="
            + uploadFile + ", cafePic=" + cafePic + ", cafeInfo=" + cafeInfo + ", cafeTel=" + cafeTel + ", userVO="
            + userVO + "]";
   }
   
   
}