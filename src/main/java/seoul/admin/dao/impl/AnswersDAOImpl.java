package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.AnswersDAO;
import seoul.admin.vo.AnswersVO;

public class AnswersDAOImpl extends SqlSessionDaoSupport implements AnswersDAO{

	@Override
	public AnswersVO getAnswers(AnswersVO answersVO) {
		return getSqlSession().selectOne("answers.getAnswer", answersVO);
	}
	
	@Override
	public List<AnswersVO> getAnswerList(AnswersVO answersVO) {
		return getSqlSession().selectList("answers.getAnswerList", answersVO);
	}
	
	@Override
	public int insertAnswers(AnswersVO answersVO) {
		return getSqlSession().insert("answers.insertAnswers", answersVO);
	}
	
	@Override
	public int updateAnswers(AnswersVO answersVO) {
		return getSqlSession().insert("answers.updateAnswers", answersVO);
	}	
	
	@Override
	public int deleteAnswers(AnswersVO answersVO){
		return getSqlSession().insert("answers.deleteAnswers", answersVO);
	}

	@Override
	public int getAnswersCnt(AnswersVO answersVO){
		return getSqlSession().selectOne("answers.getAnswersCnt", answersVO);
	}
	
	
	@Override
	public int getNoAnswersCnt(AnswersVO answersVO){
		return getSqlSession().selectOne("answers.getNoAnswersCnt", answersVO);
	}
	
	@Override
	public List<AnswersVO> getNoAnswerList(AnswersVO answersVO){
		return getSqlSession().selectList("answers.getNoAnswerList", answersVO);
	}
	
}
