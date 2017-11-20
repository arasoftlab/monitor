package seoul.admin.service.impl;

import java.util.List;

import file.dao.FileDAO;
import seoul.admin.dao.OptionDAO;
import seoul.admin.service.OptionService;
import seoul.admin.vo.OptionVO;
import file.vo.*;
import util.BaseUtil;

public class OptionServiceImpl implements OptionService{
	private OptionDAO optionDAO;
	private FileDAO fileDAO;
	public void setOptionDAO(OptionDAO optionDAO) {
		this.optionDAO = optionDAO;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	@Override
	public List<OptionVO> getOptionList(OptionVO optionVO) {
		return optionDAO.getOptionList(optionVO);
	}
	@Override
	public OptionVO getOption(OptionVO optionVO) {

		optionVO = optionDAO.getOption(optionVO);
		if (optionVO.getCont_uuid() != null&& optionVO.getCont_uuid()!="") 
			optionVO.setFileList(fileDAO.getFileList(new FileMappingVO(optionVO.getCont_uuid(), null)));
		
		return optionVO;
	}
	@Override
	public int insertOption(OptionVO optionVO) {
		//optionVO.setOptions_id(BaseUtil.uuid());
		optionVO.setCont_uuid(BaseUtil.uuid());
		
		optionVO.setOptions_id(String.valueOf(optionDAO.getOptionNextval()));
		
		return optionDAO.insertOption(optionVO);
	}
	@Override
	public int updateOption(OptionVO optionVO) {
		return optionDAO.updateOption(optionVO);
	}
	@Override
	public int deleteOption(OptionVO optionVO) {
		int effectRows = updateOptionNum(optionDAO.getOption(optionVO), -1);
		effectRows += optionDAO.deleteOption(optionVO);
		return effectRows;
	}
	
	// 과제하나를 지웠을 시 해당 과제에 등록된 옵션을 전부 지운다.
	// by JINX 
	@Override
	public int clearOption(OptionVO optionVO) {
		return optionDAO.clearOption(optionVO);
	}
	
	@Override
	public int moveOption(OptionVO optionVO) {
		int effectRows = 0;
		if(optionVO.getOptions_num() > optionVO.getTo_num()){
			effectRows = updateOptionNum(optionVO, 1);
		}else if(optionVO.getOptions_num() < optionVO.getTo_num()){
			effectRows = updateOptionNum(optionVO, -1);
		}
		return effectRows;
	}
	private int updateOptionNum(OptionVO optionVO, int i) {
		int effectRows = 0;
		if(i > 0){
			effectRows = optionDAO.incOptionNum(optionVO);
		}else{
			effectRows = optionDAO.decOptionNum(optionVO);
		}
		
		if(effectRows > 0){
			effectRows += optionDAO.updateOptionNum(optionVO);
		}
		return effectRows;
	}
}
