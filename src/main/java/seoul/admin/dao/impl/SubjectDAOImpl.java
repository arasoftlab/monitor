package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.SubjectDAO;
import seoul.admin.vo.SubjectVO;

public class SubjectDAOImpl extends SqlSessionDaoSupport implements SubjectDAO{

	@Override
	public List<SubjectVO> getSubjectList(SubjectVO subjectVO) {
		return getSqlSession().selectList("subject.getSubjectList", subjectVO);
	}

	@Override
	public int getSubjectCnt(SubjectVO subjectVO) {
		return getSqlSession().selectOne("subject.getSubjectCnt", subjectVO);
	}
	
	@Override
	public List<SubjectVO> getSubjectMoneyList(SubjectVO subjectVO) {
		return getSqlSession().selectList("subject.getSubjectMoneyList", subjectVO);
	}

}
