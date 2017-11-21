package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.SubjectVO;

public interface SubjectService {

	List<SubjectVO> getSubjectList(SubjectVO subjectVO);
	
	List<SubjectVO> getSubjectMoneyList(SubjectVO subjectVO);
}
