package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.AuthorityVO;
import com.beans.roaststars.model.vo.UserVO;

public interface UserService {
	
	void registerUser(UserVO vo);
	
	void withdrawalUser(String id);
	
	String idCheck(String id);
	
	UserVO findUserById(String id);
	
	void grantAuthorization(String id, String authority);
	
	List<AuthorityVO> selectAuthorityByUsername(String username);

	String nickCheck(String nickname);

	String passCheck(String password);

	void updateUser(UserVO userVO);

	void deleteUser(UserVO userVO);
	
	int checkIdAndName(String id, String name);
	
	String updateTempPass(String id);

	void updateUserPassword(String id, String password);
}
