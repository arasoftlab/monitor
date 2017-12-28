package seoul.admin.service.impl;

import seoul.admin.dao.AdminSettingDAO;
import seoul.admin.service.AdminSettingService;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.AdminMemberVO;
import java.util.List;

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

	public List<AdminMemberVO> getAdminList(AdminMemberVO aVO) {
		return adminSettingDAO.getAdminList(aVO);
	}
	
	public AdminMemberVO getAdminMember(AdminMemberVO aVO) {
		return adminSettingDAO.getAdminMember(aVO);
	}
	
	public int createAdminMember(AdminMemberVO aVO) {
		return adminSettingDAO.createAdminMember(aVO);
	}
	
	public int updateAdminMember(AdminMemberVO aVO) {
		return adminSettingDAO.updateAdminMember(aVO);
	}
	
	public int deleteAdminMember(AdminMemberVO aVO) {
		return adminSettingDAO.deleteAdminMember(aVO);
	}
	
	
	
}


