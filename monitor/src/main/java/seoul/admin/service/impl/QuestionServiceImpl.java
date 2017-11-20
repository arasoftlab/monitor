package seoul.admin.service.impl;

import java.util.List;

import file.dao.FileDAO;
import file.vo.FileMappingVO;
import seoul.admin.dao.QuestionDAO;
import seoul.admin.service.QuestionService;
import seoul.admin.vo.QuestionVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

public class QuestionServiceImpl implements QuestionService{
	private QuestionDAO questionDAO;
	private FileDAO fileDAO;
	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	@Override
	public List<QuestionVO> getQuestionList(QuestionVO questionVO) {
		return questionDAO.getQuestionList(questionVO);
	}
	
	@Override
	public QuestionVO getQuestion(QuestionVO questionVO) {
		questionVO = questionDAO.getQuestion(questionVO);
		if (questionVO.getCont_uuid() != null&& questionVO.getCont_uuid()!="") 
		questionVO.setFileList(fileDAO.getFileList(new FileMappingVO(questionVO.getCont_uuid(), null)));
		
		return questionVO;
	}
	
	@Override
	public QuestionVO getNextQuestion(QuestionVO questionVO) {
		return questionDAO.getNextQuestion(questionVO);
	}
	
	@Override
	public int insertQuestion(QuestionVO questionVO) {
		
		questionVO.setCont_uuid(BaseUtil.uuid());

//		questionVO.setCont_type("");
		
		// description 체크 ( 복사 인서트시 값을 들고 오므로 없을시 "" 값 처리 )
		if ( questionVO.getDescription()==null || questionVO.getDescription()=="" )
			questionVO.setDescription("");
		// title 체크 
		if ( questionVO.getTitle()==null || questionVO.getTitle()=="" )
			questionVO.setTitle("");

		// 옵션  선택 체크 
		if ( questionVO.getCont_type()==null || questionVO.getCont_type()=="" )
			questionVO.setCont_type("");		
		
		questionVO.setQuestion_id(String.valueOf(questionDAO.getQuestionNextval()));
			
		return questionDAO.insertQuestion(questionVO);
	}
	@Override
	public int updateQuestion(QuestionVO questionVO) {
		return questionDAO.updateQuestion(questionVO);
	}
	@Override
	public int deleteQuestion(QuestionVO questionVO) {
		int effectRows = updateQuestionNum(questionVO, -1);
		effectRows += questionDAO.deleteQuestion(questionVO);
		return effectRows;
	}
	@Override
	public int moveQuestion(QuestionVO questionVO) {
		int effectRows = 0;
		if(questionVO.getQuestion_num() > questionVO.getTo_num()){
			effectRows = updateQuestionNum(questionVO, 1);
		}else if(questionVO.getQuestion_num() < questionVO.getTo_num()){
			effectRows = updateQuestionNum(questionVO, -1);
		}
		return effectRows;
	}
	private int updateQuestionNum(QuestionVO questionVO, int i) {
		int effectRows = 0;
				
		if(i > 0){
			effectRows = questionDAO.incQuestionNum(questionVO);
		}else{
			effectRows = questionDAO.decQuestionNum(questionVO);
		}
		
		if(effectRows > 0){
			effectRows += questionDAO.updateQuestionNum(questionVO);
		}
		return effectRows;
	}
	@Override
	public List<QuestionVO> getPrevSQuestionList(QuestionVO questionVO) {
		return questionDAO.getPrevSQuestionList(questionVO);
	}
}
