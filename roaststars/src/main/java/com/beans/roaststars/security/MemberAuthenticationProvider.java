package com.beans.roaststars.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.beans.roaststars.model.service.UserService;
import com.beans.roaststars.model.vo.AuthorityVO;
import com.beans.roaststars.model.vo.UserVO;

/*
 * Spring Security를 이용한 인증로직을 정의한 클래스 
 */

public class MemberAuthenticationProvider implements AuthenticationProvider {
	@Resource
	private UserService userService;
	// 비밀번호 암호화처리를 위한 객체를 주입받는다
	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	/*
	  실제 인증 처리 
	 Authentication 객체를 이용한 인증에 실패하면
	 AuthenticationException 발생시킨다.
	 인증에 성공하면, 인증 정보를 담은 Authentication 객체를 만들어
	 return 한다
	 
	 */
	/**
	 * 사용자가 화면에서 로그인을 하면 아래의 메서드가 실행된다. 
	 * 매개변수
	 * 	 : 인증시 필요한 정보 - Authentication ( 사용자가 입력한 ID , PASSWORD가 저장되어 있음 )
	 * 리턴
	 * 	 : 인증한 정보를 가진 Authentication 매개변수에 전달된
	 * 	   Authentication객체를 받아 인증처리를 한 뒤 인증한 정보를 Authentication에 담아 리턴
	 */
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		if (authentication == null) {
			throw new InternalAuthenticationServiceException("Authentication is null");
		}
		
		// 사용자가 로그인시 입력한 ID 반환
		String id = authentication.getName();

		// 입력받은 id를 이용해 사용자 정보 DB로부터 조회
		UserVO member = userService.findUserById(id);
		if (member == null) {
			throw new UsernameNotFoundException("회원 아이디가 존재하지 않습니다");
		}
		// 사용자가 입력한 패스워드 반환
		String password = (String) authentication.getCredentials();//Credential의 사전적 의미는 증명  
		// 일반적 방식의 패스워드 비교 ( 암호화 사용하지 않을 경우 ) 
		/*
		 * if(!password.equals(member.getPassword())){//패스워드가 틀리면 throw new
		 * BadCredentialsException("패스워드가 틀립니다."); }
		 */
		/*
		   이용자가 로그인 폼에서 입력한 비밀번호와 DB로부터 가져온 암호화된 비밀번호를 비교한다
		  ( 비밀번호 암호화를 이용할 경우 )
		 */
		
		if (passwordEncoder.matches(password, member.getPassword()) == false)
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다");
		// 사용자 권한 조회 ( 회원가입시 권한 부여 , 관리자는 시스템 상에서 권한 부여 )
		List<AuthorityVO> list = userService.selectAuthorityByUsername(id);
		if (list.size() == 0) {
			throw new UsernameNotFoundException("권한이 없습니다.");
		}

		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		for (AuthorityVO au : list) { // ROLE_ 형식의 db 정보가 아니라면 이 시점에 ROLE_ 를 접두어로 추가한다
			authorities.add(new SimpleGrantedAuthority(au.getAuthority()));
		}
		/****************************************
		 * 여기까지 왔으면 인증 완료 - Authentication객체 생성해서 리턴
		 ***************************************/

		Authentication auth = new UsernamePasswordAuthenticationToken(member, password, authorities);
		System.out.println("로그인 인증완료");
		return auth;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// 현재 MemberAuthenticationProvider가 지정된 Authentication 객체를 지원하면 true를 반환한다
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
}
