package com.beans.roaststars.model.service;

import java.util.List;

import com.beans.roaststars.model.vo.AdminListVO;
import com.beans.roaststars.model.vo.AuthorityVO;


public interface AdminService {

	List<AuthorityVO> getAllWaitingForUpgradeUserList();

	List<String> getUserAuthorityList();

	AdminListVO findMemberByAuthority();

	AdminListVO findMemberByAuthority(String pageNo);

	int getTotalCountByWaitingMember();

	int grantAuthority(String id, String authority);
}
