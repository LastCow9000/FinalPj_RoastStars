package com.beans.roaststars.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.beans.roaststars.model.mapper.UserMapper;
import com.beans.roaststars.model.vo.AuthorityVO;
import com.beans.roaststars.model.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserMapper userMapper;
	/*
	 *  비밀번호 암호화처리를 위한 객체를 주입받는다
	 *  spring-security.xml 에서 bean 설정이 되어 있음 	
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public void registerUser(UserVO userVO) {
	}
	@Override
	public void withdrawalUser(String id) {
	}
	@Override
	public String idCheck(String id) {
		return null;
	}
	@Override
	public UserVO findUserById(String id) {
		return userMapper.findUserById(id);
	}
	@Override
	public String nicknameCheck(String nickname) {
		return null;
	}
	@Override
	public void grantAuthorization(String id, String authority) {
	}
	@Override
	public List<AuthorityVO> selectAuthorityByUsername(String username) {
		return userMapper.selectAuthorityByUsername(username);
	}
}
