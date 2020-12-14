package com.beans.roaststars.model.vo;

public class MyPickVO {
	private String pickNo;
	private String id;
	private CafeVO cafeVO;
	public MyPickVO() {
		super();
	}
	public MyPickVO(String pickNo, String id, CafeVO cafeVO) {
		super();
		this.pickNo = pickNo;
		this.id = id;
		this.cafeVO = cafeVO;
	}
	public String getPickNo() {
		return pickNo;
	}
	public void setPickNo(String pickNo) {
		this.pickNo = pickNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public CafeVO getCafeVO() {
		return cafeVO;
	}
	public void setCafeVO(CafeVO cafeVO) {
		this.cafeVO = cafeVO;
	}
	@Override
	public String toString() {
		return "MyPickVO [pickNo=" + pickNo + ", id=" + id + ", cafeVO=" + cafeVO + "]";
	}
}
