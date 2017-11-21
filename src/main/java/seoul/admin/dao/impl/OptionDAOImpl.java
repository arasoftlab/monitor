package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.OptionDAO;
import seoul.admin.vo.OptionVO;

public class OptionDAOImpl extends SqlSessionDaoSupport implements OptionDAO{

	@Override
	public List<OptionVO> getOptionList(OptionVO optionVO) {
		return getSqlSession().selectList("option.getOptionList", optionVO);
	}

	@Override
	public OptionVO getOption(OptionVO optionVO) {
		return getSqlSession().selectOne("option.getOption", optionVO);
	}

	@Override
	public int insertOption(OptionVO optionVO) {
		return getSqlSession().insert("option.insertOption", optionVO); 
	}

	@Override
	public int updateOption(OptionVO optionVO) {
		return getSqlSession().update("option.updateOption", optionVO);
	}

	@Override
	public int deleteOption(OptionVO optionVO) {
		return getSqlSession().delete("option.deleteOption", optionVO);
	}

	@Override
	public int clearOption(OptionVO optionVO) {
		return getSqlSession().delete("option.clearOption", optionVO);
	}
	
	@Override
	public int incOptionNum(OptionVO optionVO) {
		return getSqlSession().update("option.incOptionNum", optionVO);
	}

	@Override
	public int decOptionNum(OptionVO optionVO) {
		return getSqlSession().update("option.decOptionNum", optionVO);
	}

	@Override
	public int updateOptionNum(OptionVO optionVO) {
		return getSqlSession().update("option.updateOptionNum", optionVO);
	}

	
	
	@Override
	public int getOptionNextval() {
		return getSqlSession().selectOne("option.getOptionNextval");
	}
	

}
