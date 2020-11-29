package com.beans.roaststars.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class CafeVO {
	private String cafeNo;
	private String cafeName;
	private String cafeLoc;
	private MultipartFile cafePic;
	private String cafeInfo;
	private CafeOperatingTimeVO cafeOperatingTimeVO;
	private UserVO userVO;
	
	public CafeVO() {
		super();
	}

	public CafeVO(String cafeNo, String cafeName, String cafeLoc, MultipartFile cafePic, String cafeInfo,
			CafeOperatingTimeVO cafeOperatingTimeVO, UserVO userVO) {
		super();
		this.cafeNo = cafeNo;
		this.cafeName = cafeName;
		this.cafeLoc = cafeLoc;
		this.cafePic = cafePic;
		this.cafeInfo = cafeInfo;
		this.cafeOperatingTimeVO = cafeOperatingTimeVO;
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

	public MultipartFile getCafePic() {
		return cafePic;
	}

	public void setCafePic(MultipartFile cafePic) {
		this.cafePic = cafePic;
	}

	public String getCafeInfo() {
		return cafeInfo;
	}

	public void setCafeInfo(String cafeInfo) {
		this.cafeInfo = cafeInfo;
	}

	public CafeOperatingTimeVO getCafeOperatingTimeVO() {
		return cafeOperatingTimeVO;
	}

	public void setCafeOperatingTimeVO(CafeOperatingTimeVO cafeOperatingTimeVO) {
		this.cafeOperatingTimeVO = cafeOperatingTimeVO;
	}

	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

	@Override
	public String toString() {
		return "CafeVO [cafeNo=" + cafeNo + ", cafeName=" + cafeName + ", cafeLoc=" + cafeLoc + ", cafePic=" + cafePic
				+ ", cafeInfo=" + cafeInfo + ", cafeOperatingTimeVO=" + cafeOperatingTimeVO + ", userVO=" + userVO
				+ "]";
	}
}
