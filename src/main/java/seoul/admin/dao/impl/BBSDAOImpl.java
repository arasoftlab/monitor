package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.BBSDAO;
import seoul.admin.vo.BBSVO;

public class BBSDAOImpl extends SqlSessionDaoSupport implements BBSDAO{

	@Override
	public List<BBSVO> getBBSList(BBSVO bbsVO) {
		return getSqlSession().selectList("bbs.getBBSList", bbsVO);
	}
		
	@Override
	public int getBBSCnt(BBSVO bbsVO) {
		return getSqlSession().selectOne("bbs.getBBSCnt", bbsVO);
	}

	@Override
	public BBSVO getBBS(BBSVO bbsVO) {
		return getSqlSession().selectOne("bbs.getBBS", bbsVO);
	}
	
	@Override
	public int updateBBSHit(BBSVO bbsVO) {
		return getSqlSession().update("bbs.updateBBSHit", bbsVO);
	}

	@Override
	public int insertBBS(BBSVO bbsVO) {
		return getSqlSession().insert("bbs.insertBBS", bbsVO);
	}

	@Override
	public int updateBBS(BBSVO bbsVO) {
		return getSqlSession().update("bbs.updateBBS", bbsVO);
	}

	@Override
	public int deleteBBS(BBSVO bbsVO) {
		return getSqlSession().delete("bbs.deleteBBS", bbsVO);
	}
	
	@Override
	public BBSVO checkPasswordBBS(BBSVO bbsVO){
		return getSqlSession().selectOne("bbs.checkPasswordBBS", bbsVO);		
	}
}
