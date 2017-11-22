package seoul.admin.service;

import seoul.admin.vo.SubjectVO;

public interface SubjectInfoService {
	
	SubjectVO getSubject(SubjectVO subjectVO);

	int saveSubject(SubjectVO subjectVO);

	int deleteSubject(SubjectVO subjectVO);

}
