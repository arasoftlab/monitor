package seoul.admin.service.impl;

import seoul.admin.dao.AdminSettingDAO;
import seoul.admin.service.AdminSettingService;
import seoul.admin.vo.AdminSettingVO;

public class AdminSettingServiceImpl implements AdminSettingService{
	
	private AdminSettingDAO adminSettingDAO;
	
	public void setAdminSettingDAO(AdminSettingDAO adminSettingDAO) {
		this.adminSettingDAO = adminSettingDAO;
	}
	
	
	@Override
	public AdminSettingVO getAdminSetting(AdminSettingVO adminSettingVO)
	{
		return adminSettingDAO.getAdminSetting(adminSettingVO);
	}
	
	@Override	
	public int updateAdminSetting(AdminSettingVO adminSettingVO){
		return adminSettingDAO.updateAdminSetting(adminSettingVO);		
	}
	
}


