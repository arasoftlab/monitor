package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.AnswersVO;
//import seoul.admin.vo.NoticeVO;
//import seoul.admin.vo.SubjectVO;

public interface AnswersDAO {
	AnswersVO getAnswers(AnswersVO answersVO) ;

	List<AnswersVO> getAnswerList(AnswersVO answersVO);
	
	int insertAnswers(AnswersVO answersVO);

	int updateAnswers(AnswersVO answersVO);
	
	int deleteAnswers(AnswersVO answersVO);
	
	int getAnswersCnt(AnswersVO answersVO);
	
	int getNoAnswersCnt(AnswersVO answersVO);
	
	List<AnswersVO> getNoAnswerList(AnswersVO answersVO);
}
