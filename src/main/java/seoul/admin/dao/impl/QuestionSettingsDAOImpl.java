package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.OptionDAO;
import seoul.admin.dao.QuestionSettingsDAO;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionSettingsVO;

public class QuestionSettingsDAOImpl extends SqlSessionDaoSupport implements QuestionSettingsDAO{

	@Override
	public List<QuestionSettingsVO> getQuestionSettingsList(QuestionSettingsVO questionSettingsVO) {
		
		if (questionSettingsVO.getType()!=null) 
			return getSqlSession().selectList("questionsettigs.getQuestionSettingsTypeList", questionSettingsVO);
		else
			return getSqlSession().selectList("questionsettigs.getQuestionSettingsList", questionSettingsVO);
	}

	@Override
	public QuestionSettingsVO getQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		return getSqlSession().selectOne("questionsettigs.getQuestionSettings", questionSettingsVO);
	}

	@Override
	public int insertQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		return getSqlSession().insert("questionsettigs.insertQuestionSettings", questionSettingsVO); 
	}

	@Override
	public int updateQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		return getSqlSession().update("questionsettigs.updateQuestionSettings", questionSettingsVO);
	}

	@Override
	public int deleteQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		return getSqlSession().delete("questionsettigs.deleteQuestionSettings", questionSettingsVO);
	}

	@Override
	public int clearQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		return getSqlSession().delete("questionsettigs.clearQuestionSettings", questionSettingsVO);
	}
	
	@Override
	public int incQuestionSettingsNum(QuestionSettingsVO questionSettingsVO) {
		return getSqlSession().update("questionsettigs.incQuestionSettingsNum", questionSettingsVO);
	}

	@Override
	public int decQuestionSettingsNum(QuestionSettingsVO questionSettingsVO) {
		return getSqlSession().update("questionsettigs.decQuestionSettingsNum", questionSettingsVO);
	}

	@Override
	public int updateQuestionSettingsNum(QuestionSettingsVO questionSettingsVO) {
		return getSqlSession().update("questionsettigs.updateQuestionSettingsNum", questionSettingsVO);
	}

	@Override
	public int getQuestionSettingsNextval() {
		return getSqlSession().selectOne("questionsettigs.getQuestionSettingsNextval");
	}
	

}
