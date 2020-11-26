package com.beans.roaststars.model.vo;

public class UserVO {
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String tel;
	private String address;
	private int isEnabled;
	
	public UserVO() {
		super();
	}
	public UserVO(String id, String password, String name, String nickname, String tel, String address, int isEnabled) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickname = nickname;
		this.tel = tel;
		this.address = address;
		this.isEnabled = isEnabled;
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
	public int getIsEnabled() {
		return isEnabled;
	}
	public void setIsEnabled(int isEnabled) {
		this.isEnabled = isEnabled;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", tel="
				+ tel + ", address=" + address + ", isEnabled=" + isEnabled + "]";
	}
}
