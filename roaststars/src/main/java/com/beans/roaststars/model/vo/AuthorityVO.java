package com.beans.roaststars.model.vo;

import java.io.Serializable;

public class AuthorityVO implements Serializable{
	private static final long serialVersionUID = 7074773449013571163L;
	private String username;
	private String authority;
	//성호:UserVO 추가:시작
	private UserVO userVO;
	//성호:UserVO 추가:끝
	public AuthorityVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuthorityVO(String username, String authority, UserVO userVO) {
		super();
		this.username = username;
		this.authority = authority;
		this.userVO = userVO;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "AuthorityVO [username=" + username + ", authority=" + authority + ", userVO=" + userVO + "]";
	}

	
	
	
}
