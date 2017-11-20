package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.AdminSettingDAO;
import seoul.admin.dao.AnswersDAO;
import seoul.admin.dao.NoticeDAO;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

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
