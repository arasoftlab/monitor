package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public interface ExcelService {
	
	List<Object> getAllObjects(String target , String subject_id);
	
}
