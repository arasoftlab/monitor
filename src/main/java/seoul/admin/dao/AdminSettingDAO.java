package seoul.admin.dao;

import seoul.admin.vo.AdminSettingVO;

public interface AdminSettingDAO {

	AdminSettingVO getAdminSetting(AdminSettingVO adminSettingVO) ;

	int updateAdminSetting(AdminSettingVO adminSettingVO);
	
}
