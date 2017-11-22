package seoul.admin.service;

import seoul.admin.vo.AdminSettingVO;

public interface AdminSettingService {
	
	AdminSettingVO getAdminSetting(AdminSettingVO adminSettingVO);
	
	int updateAdminSetting(AdminSettingVO adminSettingVO);
	
}
