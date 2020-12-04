package com.beans.roaststars.model.vo;


public class PropertyVO {
	// 평가 점수 기준
	public final static int good = 1;
	public final static int soso = 0;
	public final static int bad = -2;

	private int service;
	private int taste;
	private int price;
	private int mood;
	private int diversity;
	private CafeOperatingTimeVO cafeOperatingTimeVO;
	
	public PropertyVO() {
		super();
	}

	public PropertyVO(int service, int taste, int price, int mood, int diversity,
			CafeOperatingTimeVO cafeOperatingTimeVO) {
		super();
		this.service = service;
		this.taste = taste;
		this.price = price;
		this.mood = mood;
		this.diversity = diversity;
		this.cafeOperatingTimeVO = cafeOperatingTimeVO;
	}

	public int getService() {
		return service;
	}

	public void setService(int service) {
		this.service = service;
	}

	public int getTaste() {
		return taste;
	}

	public void setTaste(int taste) {
		this.taste = taste;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMood() {
		return mood;
	}

	public void setMood(int mood) {
		this.mood = mood;
	}

	public int getDiversity() {
		return diversity;
	}

	public void setDiversity(int diversity) {
		this.diversity = diversity;
	}

	public CafeOperatingTimeVO getCafeOperatingTimeVO() {
		return cafeOperatingTimeVO;
	}

	public void setCafeOperatingTimeVO(CafeOperatingTimeVO cafeOperatingTimeVO) {
		this.cafeOperatingTimeVO = cafeOperatingTimeVO;
	}

	public static int getGood() {
		return good;
	}

	public static int getSoso() {
		return soso;
	}

	public static int getBad() {
		return bad;
	}

	@Override
	public String toString() {
		return "PropertyVO [service=" + service + ", taste=" + taste + ", price=" + price + ", mood=" + mood
				+ ", diversity=" + diversity + ", cafeOperatingTimeVO=" + cafeOperatingTimeVO + "]";
	}

}
