package seoul.admin.service.impl;

import java.util.List;

import common.vo.PagingVO;
import file.dao.FileDAO;
import seoul.admin.dao.SubjectDAO;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.SubjectVO;

public class SubjectServiceImpl implements SubjectService{
	private SubjectDAO subjectDAO;
	private FileDAO fileDAO;

	public void setSubjectDAO(SubjectDAO subjectDAO) {
		this.subjectDAO = subjectDAO;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	
	
	@Override
	public List<SubjectVO> getSubjectList(SubjectVO subjectVO) {
		subjectVO.setPagingVO(new PagingVO(subjectVO.getPageSize() , subjectVO.getPageNum(), subjectDAO.getSubjectCnt(subjectVO) ));
		return subjectDAO.getSubjectList(subjectVO);
	}
	
	
	@Override
	public List<SubjectVO> getSubjectMoneyList(SubjectVO subjectVO) {
		subjectVO.setQuery("pay_yn = 'Y' ");
		subjectVO.setPagingVO(new PagingVO(subjectVO.getPageNum(), subjectDAO.getSubjectCnt(subjectVO)));
		return subjectDAO.getSubjectMoneyList(subjectVO);
	}	
	
}
