package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.BBSVO;

public interface BBSDAO {

	List<BBSVO> getBBSList(BBSVO bbsVO);
	
	int getBBSCnt(BBSVO bbsVO);

	BBSVO getBBS(BBSVO bbsVO);
	
	int updateBBSHit(BBSVO bbsVO);

	int insertBBS(BBSVO bbsVO);

	int updateBBS(BBSVO bbsVO);

	int deleteBBS(BBSVO bbsVO);

	BBSVO checkPasswordBBS(BBSVO bbsVO);
}
