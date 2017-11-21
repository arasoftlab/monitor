package seoul.admin.dao;

//import java.util.List;

import seoul.admin.vo.AdminSettingVO;
//import seoul.admin.vo.AnswersVO;
//import seoul.admin.vo.NoticeVO;
//import seoul.admin.vo.SubjectVO;

public interface AdminSettingDAO {

	AdminSettingVO getAdminSetting(AdminSettingVO adminSettingVO) ;

	int updateAdminSetting(AdminSettingVO adminSettingVO);
	
}
