package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.QuestionDAO;
import seoul.admin.vo.QuestionVO;

public class QuestionDAOImpl extends SqlSessionDaoSupport implements QuestionDAO{

	@Override
	public List<QuestionVO> getQuestionList(QuestionVO questionVO) {
		return getSqlSession().selectList("question.getQuestionList", questionVO);
	}

	@Override
	public QuestionVO getQuestion(QuestionVO questionVO) {
		return getSqlSession().selectOne("question.getQuestion", questionVO);
	}

	@Override
	public QuestionVO getNextQuestion(QuestionVO questionVO) {
		return getSqlSession().selectOne("question.getNextQuestion", questionVO);
	}

	
	@Override
	public int insertQuestion(QuestionVO questionVO) {
		return getSqlSession().insert("question.insertQuestion", questionVO);
	}

	@Override
	public int updateQuestion(QuestionVO questionVO) {
		return getSqlSession().update("question.updateQuestion", questionVO);
	}

	@Override
	public int deleteQuestion(QuestionVO questionVO) {
		return getSqlSession().delete("question.deleteQuestion", questionVO);
	}

	@Override
	public int incQuestionNum(QuestionVO questionVO) {
		return getSqlSession().update("question.incQuestionNum", questionVO);
	}

	@Override
	public int decQuestionNum(QuestionVO questionVO) {
		return getSqlSession().update("question.decQuestionNum", questionVO);
	}

	@Override
	public int updateQuestionNum(QuestionVO questionVO) {
		return getSqlSession().update("question.updateQuestionNum", questionVO);
	}

	@Override
	public List<QuestionVO> getPrevSQuestionList(QuestionVO questionVO) {
		return getSqlSession().selectList("question.getPrevSQuestionList", questionVO);
	}
	
	
	@Override
	public int getQuestionNextval() {
		return getSqlSession().selectOne("question.getQuestionNextval");
	}
	
}
