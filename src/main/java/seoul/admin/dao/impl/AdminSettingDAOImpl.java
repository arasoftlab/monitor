package seoul.admin.dao.impl;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.AdminSettingDAO;
import seoul.admin.vo.AdminSettingVO;

public class AdminSettingDAOImpl extends SqlSessionDaoSupport implements AdminSettingDAO{

	@Override
	public AdminSettingVO getAdminSetting(AdminSettingVO adminSettingVO) {
		return getSqlSession().selectOne("admin_setting.getAdminSetting", adminSettingVO);
	}
		
	@Override
	public int updateAdminSetting(AdminSettingVO adminSettingVO) {
		return getSqlSession().update("admin_setting.updateAdminSetting", adminSettingVO);
	}	
}
