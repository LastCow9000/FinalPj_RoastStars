package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.AuthorityVO;
import com.beans.roaststars.model.vo.UserVO;

public interface UserService {
	
	void registerUser(UserVO userVO);
	
	void withdrawalUser(String id);
	
	String idCheck(String id);
	
	UserVO findUserById(String id);
	
	String nicknameCheck(String nickname);
	
	void grantAuthorization(String id, String authority);
	
	List<AuthorityVO> selectAuthorityByUsername(String username);
}
