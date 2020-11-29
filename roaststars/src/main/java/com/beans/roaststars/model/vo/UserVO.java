package com.beans.roaststars.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String tel;
	private String address;
	private String businessName;
	private MultipartFile businessPic;
	private String businessNo;
	private int enabled;
	
	public UserVO() {
		super();
	}

	public UserVO(String id, String password, String name, String nickname, String tel, String address,
			String businessName, MultipartFile businessPic, String businessNo, int enabled) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.tel = tel;
		this.address = address;
		this.businessName = businessName;
		this.businessPic = businessPic;
		this.businessNo = businessNo;
		this.enabled = enabled;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public MultipartFile getBusinessPic() {
		return businessPic;
	}

	public void setBusinessPic(MultipartFile businessPic) {
		this.businessPic = businessPic;
	}

	public String getBusinessNo() {
		return businessNo;
	}

	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", tel="
				+ tel + ", address=" + address + ", businessName=" + businessName + ", businessPic=" + businessPic
				+ ", businessNo=" + businessNo + ", enabled=" + enabled + "]";
	}
}
