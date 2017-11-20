package seoul.admin.dao;

import seoul.admin.vo.SubjectVO;

public interface SubjectInfoDAO {
	SubjectVO getSubject(SubjectVO subjectVO);
	

	int insertSubject(SubjectVO subjectVO);

	int updateSubject(SubjectVO subjectVO);

	int deleteSubject(SubjectVO subjectVO);

}
