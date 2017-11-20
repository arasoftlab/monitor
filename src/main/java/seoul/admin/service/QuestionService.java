package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.QuestionVO;

public interface QuestionService {

	List<QuestionVO> getQuestionList(QuestionVO questionVO);

	QuestionVO getQuestion(QuestionVO questionVO);
	
	QuestionVO getNextQuestion(QuestionVO questionVO);
	
	int insertQuestion(QuestionVO questionVO);

	int updateQuestion(QuestionVO questionVO);

	int deleteQuestion(QuestionVO questionVO);

	int moveQuestion(QuestionVO questionVO);

	List<QuestionVO> getPrevSQuestionList(QuestionVO questionVO);

}
