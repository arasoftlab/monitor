package seoul.admin.service.impl;

import java.util.List;

import common.vo.PagingVO;
import seoul.admin.dao.AnswersDAO;
import seoul.admin.service.AnswersService;
import seoul.admin.vo.AnswersVO;
import util.BaseUtil;

public class AnswersServiceImpl implements AnswersService{
	
	private AnswersDAO answersDAO;
	
	
	public void setAnswersDAO(AnswersDAO answersDAO) {
		this.answersDAO = answersDAO;
	}
	
	
	public AnswersVO getAnswers(AnswersVO answersVO) {		
		answersVO = answersDAO.getAnswers(answersVO);	
		return answersVO ;
	}
	
	@Override
	public List<AnswersVO> getAnswerList(AnswersVO answersVO) {		
		answersVO.setPagingVO(new PagingVO(answersVO.getPageSize(), answersVO.getPageNum(), answersDAO.getAnswersCnt(answersVO)));
		return answersDAO.getAnswerList(answersVO);
	}
	
	@Override
	public List<AnswersVO> getNoAnswerList(AnswersVO answersVO){
		answersVO.setPagingVO(new PagingVO(answersVO.getPageSize(), answersVO.getPageNum(), answersDAO.getNoAnswersCnt(answersVO)));
		return answersDAO.getNoAnswerList(answersVO);
	}
	
	@Override
	public int insertAnswers(AnswersVO answersVO) {
				
		int effectRows = 0;
		if(BaseUtil.isEmpty(answersVO.getAnswers_id())|| answersVO.getAnswers_id().equals("0")){
			effectRows = answersDAO.insertAnswers(answersVO);			
			/*
			if(!BaseUtil.isEmpty(subjectVO.getFileListId())){
				for(String file_id : subjectVO.getFileListId()){
					effectRows += fileDAO.insertFileMapping(new FileMappingVO(subjectVO.getCont_uuid(), file_id));
				}
			}*/
		}
		return effectRows;
	}
	
	@Override
	public int getAnswersCnt(AnswersVO answersVO) {
		return answersDAO.getAnswersCnt(answersVO);
	}
	
	@Override
	public int getNoAnswersCnt(AnswersVO answersVO) {
		return answersDAO.getNoAnswersCnt(answersVO);
	}
	
	@Override
	public int updateAnswers(AnswersVO answersVO) {
		return answersDAO.updateAnswers(answersVO);		
	}
	
	
	@Override
	public int deleteAnswers(AnswersVO answersVO) {
		return answersDAO.deleteAnswers(answersVO);
	}
}
