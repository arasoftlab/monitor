package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.AdminSettingDAO;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.AdminMemberVO;



public class AdminSettingDAOImpl extends SqlSessionDaoSupport implements AdminSettingDAO{

	@Override
	public AdminSettingVO getAdminSetting(AdminSettingVO adminSettingVO) {
		return getSqlSession().selectOne("admin_setting.getAdminSetting", adminSettingVO);
	}
		
	@Override
	public int updateAdminSetting(AdminSettingVO adminSettingVO) {
		return getSqlSession().update("admin_setting.updateAdminSetting", adminSettingVO);
	}	

	public List<AdminMemberVO> getAdminList(AdminMemberVO aVO) {
		return getSqlSession().selectList("admin_setting.getAdminList", aVO);
	}
	
	public AdminMemberVO getAdminMember(AdminMemberVO aVO) {
		return getSqlSession().selectOne("admin_setting.getAdminMember", aVO);
	}
	
	public int createAdminMember(AdminMemberVO aVO) {
		return getSqlSession().insert("admin_setting.insertAdminMember", aVO);
	}
	
	public int updateAdminMember(AdminMemberVO aVO) {
		return getSqlSession().update("admin_setting.updateAdminMember", aVO);
	}
	
	public int deleteAdminMember(AdminMemberVO aVO) {
		return getSqlSession().delete("admin_setting.deleteAdminMember", aVO);
	}
}
