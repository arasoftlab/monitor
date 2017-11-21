package seoul.admin.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.SubjectInfoDAO;
import seoul.admin.vo.SubjectVO;

public class SubjectInfoDAOImpl extends SqlSessionDaoSupport implements SubjectInfoDAO{
	@Override
	public SubjectVO getSubject(SubjectVO subjectVO) {
		return getSqlSession().selectOne("subjectinfo.getSubject", subjectVO);
	}
	
	@Override
	public int insertSubject(SubjectVO subjectVO) {
		return getSqlSession().insert("subjectinfo.insertSubject", subjectVO);
	}

	@Override
	public int updateSubject(SubjectVO subjectVO) {
		return getSqlSession().update("subjectinfo.updateSubject", subjectVO);
	}

	@Override
	public int deleteSubject(SubjectVO subjectVO) {
		return getSqlSession().delete("subjectinfo.deleteSubject", subjectVO);
	}

}
