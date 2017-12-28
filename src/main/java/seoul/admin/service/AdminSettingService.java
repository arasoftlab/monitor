package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.AdminMemberVO;
import seoul.admin.vo.AdminSettingVO;

public interface AdminSettingService {
	
	AdminSettingVO getAdminSetting(AdminSettingVO adminSettingVO);
	
	int updateAdminSetting(AdminSettingVO adminSettingVO);
	
	List<AdminMemberVO> getAdminList(AdminMemberVO aVO);
	
	int createAdminMember(AdminMemberVO aVO);
	
	int updateAdminMember(AdminMemberVO aVO);
	
	int deleteAdminMember(AdminMemberVO aVO);
	
	AdminMemberVO getAdminMember(AdminMemberVO aVO);
	
}
