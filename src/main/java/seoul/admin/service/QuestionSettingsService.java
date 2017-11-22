package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.QuestionSettingsVO;

public interface QuestionSettingsService {

	List<QuestionSettingsVO> getQuestionSettingsList(QuestionSettingsVO questionSettingsVO);
	
	QuestionSettingsVO getQuestionSettings(QuestionSettingsVO questionSettingsVO);
	
	int insertQuestionSettings(QuestionSettingsVO questionSettingsVO);
	
	int updateQuestionSettings(QuestionSettingsVO questionSettingsVO);
	
	int deleteQuestionSettings(QuestionSettingsVO questionSettingsVO);
	
	int moveQuestionSettings(QuestionSettingsVO questionSettingsVO);
	
	int clearQuestionSettings(QuestionSettingsVO questionSettingsVO);
}
