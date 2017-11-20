package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.QuestionVO;

public interface QuestionDAO {

	List<QuestionVO> getQuestionList(QuestionVO questionVO);

	QuestionVO getQuestion(QuestionVO questionVO);
	
	QuestionVO getNextQuestion(QuestionVO questionVO);
	
	int insertQuestion(QuestionVO questionVO);

	int updateQuestion(QuestionVO questionVO);

	int deleteQuestion(QuestionVO questionVO);

	int incQuestionNum(QuestionVO questionVO);

	int decQuestionNum(QuestionVO questionVO);

	int updateQuestionNum(QuestionVO questionVO);

	List<QuestionVO> getPrevSQuestionList(QuestionVO questionVO);
	
	int getQuestionNextval();

}
