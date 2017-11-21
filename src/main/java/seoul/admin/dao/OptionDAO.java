package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.OptionVO;

public interface OptionDAO {

	List<OptionVO> getOptionList(OptionVO optionVO);

	OptionVO getOption(OptionVO optionVO);

	int insertOption(OptionVO optionVO);

	int updateOption(OptionVO optionVO);

	int deleteOption(OptionVO optionVO);

	int incOptionNum(OptionVO optionVO);

	int decOptionNum(OptionVO optionVO);

	int updateOptionNum(OptionVO optionVO);
	
	int clearOption(OptionVO optionVO);
	
	
	int getOptionNextval();
}
