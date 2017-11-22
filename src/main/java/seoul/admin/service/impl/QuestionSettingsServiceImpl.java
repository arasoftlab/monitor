package seoul.admin.service.impl;

import java.util.List;

import file.dao.FileDAO;
import file.vo.FileMappingVO;
import seoul.admin.dao.QuestionSettingsDAO;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.vo.QuestionSettingsVO;
import util.BaseUtil;

public class QuestionSettingsServiceImpl implements QuestionSettingsService{
	
	private QuestionSettingsDAO questionSettingsDAO;
	private FileDAO fileDAO;
	
	public void setQuestionSettingsDAO(QuestionSettingsDAO questionSettingsDAO) {
		this.questionSettingsDAO = questionSettingsDAO;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	@Override
	public List<QuestionSettingsVO> getQuestionSettingsList(QuestionSettingsVO questionSettingsVO) {
		
		return questionSettingsDAO.getQuestionSettingsList(questionSettingsVO);

	}
	
	@Override
	public QuestionSettingsVO getQuestionSettings(QuestionSettingsVO questionSettingsVO) {

		questionSettingsVO = questionSettingsDAO.getQuestionSettings(questionSettingsVO);
		if (questionSettingsVO.getCont_uuid() != null&& questionSettingsVO.getCont_uuid()!="") 
			questionSettingsVO.setFileList(fileDAO.getFileList(new FileMappingVO(questionSettingsVO.getCont_uuid(), null)));
		
		return questionSettingsVO;
	}
	@Override
	public int insertQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		//optionVO.setOptions_id(BaseUtil.uuid());
		questionSettingsVO.setCont_uuid(BaseUtil.uuid());
		
		questionSettingsVO.setIdx(String.valueOf(questionSettingsDAO.getQuestionSettingsNextval()));
		
		return questionSettingsDAO.insertQuestionSettings(questionSettingsVO);
	}
	@Override
	public int updateQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		return questionSettingsDAO.updateQuestionSettings(questionSettingsVO);
	}
	@Override
	public int deleteQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		int effectRows = updateQuestionSettingsNum(questionSettingsDAO.getQuestionSettings(questionSettingsVO), -1);
		effectRows += questionSettingsDAO.deleteQuestionSettings(questionSettingsVO);
		return effectRows;
	}
	
	// 과제하나를 지웠을 시 해당 과제에 등록된 옵션을 전부 지운다.
	// by JINX 
	@Override
	public int clearQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		return questionSettingsDAO.clearQuestionSettings(questionSettingsVO);
	}
	
	@Override
	public int moveQuestionSettings(QuestionSettingsVO questionSettingsVO) {
		int effectRows = 0;
		if(questionSettingsVO.getSettings_num() > questionSettingsVO.getTo_num()){
			effectRows = updateQuestionSettingsNum(questionSettingsVO, 1);
		}else if(questionSettingsVO.getSettings_num() < questionSettingsVO.getTo_num()){
			effectRows = updateQuestionSettingsNum(questionSettingsVO, -1);
		}
		return effectRows;
	}
	private int updateQuestionSettingsNum(QuestionSettingsVO questionSettingsVO, int i) {
		int effectRows = 0;
		if(i > 0){
			effectRows = questionSettingsDAO.incQuestionSettingsNum(questionSettingsVO);
		}else{
			effectRows = questionSettingsDAO.decQuestionSettingsNum(questionSettingsVO);
		}
		
		if(effectRows > 0){
			effectRows += questionSettingsDAO.updateQuestionSettingsNum(questionSettingsVO);
		}
		return effectRows;
	}
}
