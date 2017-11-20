package seoul.admin.service.impl;

import java.util.List;

import common.vo.PagingVO;
import file.dao.FileDAO;
import file.vo.FileMappingVO;
import seoul.admin.dao.AdminSettingDAO;
import seoul.admin.dao.AnswersDAO;
import seoul.admin.dao.NoticeDAO;
import seoul.admin.dao.SubjectDAO;
import seoul.admin.dao.SubjectInfoDAO;
import seoul.admin.service.AdminSettingService;
import seoul.admin.service.AnswersService;
import seoul.admin.service.NoticeService;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

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


