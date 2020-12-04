package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.AdminListVO;
import com.beans.roaststars.model.vo.UserVO;


public interface AdminService {

	List<UserVO> getAllWaitingForUpgradeUserList();

	List<String> getUserAuthorityList();

	AdminListVO findMemberByAuthority();

	AdminListVO findMemberByAuthority(String pageNo);

	int getTotalCountByWaitingMember();

	
}
