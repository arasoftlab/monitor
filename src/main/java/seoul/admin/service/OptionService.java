package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.OptionVO;

public interface OptionService {

	List<OptionVO> getOptionList(OptionVO optionVO);
	
	OptionVO getOption(OptionVO optionVO);
	
	int insertOption(OptionVO optionVO);
	
	int updateOption(OptionVO optionVO);
	
	int deleteOption(OptionVO optionVO);
	
	int moveOption(OptionVO optionVO);
	
	int clearOption(OptionVO optionVO);
}
