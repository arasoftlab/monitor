package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.SubjectVO;

public interface SubjectDAO {

	List<SubjectVO> getSubjectList(SubjectVO subjectVO);

	int getSubjectCnt(SubjectVO subjectVO);

	List<SubjectVO> getSubjectMoneyList(SubjectVO subjectVO);
}
