package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.BBSVO;

public interface BBSService {

	List<BBSVO> getBBSList(BBSVO bbsVO);
	
	BBSVO getBBS(BBSVO bbsVO, boolean updateHit);

	int saveBBS(BBSVO bbsVO);

	int deleteBBS(BBSVO bbsVO);
	
	BBSVO checkPasswordBBS(BBSVO bbsVO);
}
