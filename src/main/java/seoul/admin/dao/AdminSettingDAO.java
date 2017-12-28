package seoul.admin.dao;

import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.AdminMemberVO;

import java.util.List;


public interface AdminSettingDAO {

	AdminSettingVO getAdminSetting(AdminSettingVO adminSettingVO) ;

	int updateAdminSetting(AdminSettingVO adminSettingVO);
	
	List<AdminMemberVO> getAdminList(AdminMemberVO aVO);
	
	AdminMemberVO getAdminMember(AdminMemberVO aVO);
	
	int createAdminMember(AdminMemberVO aVO);
	
	int updateAdminMember(AdminMemberVO aVO);
	
	int deleteAdminMember(AdminMemberVO aVO);
	
}
