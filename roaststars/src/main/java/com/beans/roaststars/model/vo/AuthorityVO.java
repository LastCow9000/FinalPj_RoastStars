package com.beans.roaststars.model.vo;

import java.io.Serializable;

public class AuthorityVO implements Serializable{
	private static final long serialVersionUID = 7074773449013571163L;
	private String username;
	private String authority;
	
	public AuthorityVO() {
		super();
	}

	public AuthorityVO(String username, String authority) {
		super();
		this.username = username;
		this.authority = authority;
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

	@Override
	public String toString() {
		return "AuthorityVO [username=" + username + ", authority=" + authority + "]";
	}
	
}
