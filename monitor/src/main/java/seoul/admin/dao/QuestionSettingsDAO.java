package seoul.admin.dao;

import java.util.List;

//import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionSettingsVO;

public interface QuestionSettingsDAO {

	List<QuestionSettingsVO> getQuestionSettingsList(QuestionSettingsVO questionSettingsVO);

	QuestionSettingsVO getQuestionSettings(QuestionSettingsVO questionSettingsVO);

	int insertQuestionSettings(QuestionSettingsVO questionSettingsVO);

	int updateQuestionSettings(QuestionSettingsVO questionSettingsVO);

	int deleteQuestionSettings(QuestionSettingsVO questionSettingsVO);

	int incQuestionSettingsNum(QuestionSettingsVO questionSettingsVO);

	int decQuestionSettingsNum(QuestionSettingsVO questionSettingsVO);

	int updateQuestionSettingsNum(QuestionSettingsVO questionSettingsVO);
	
	int clearQuestionSettings(QuestionSettingsVO questionSettingsVO);
	
	
	int getQuestionSettingsNextval();
}
