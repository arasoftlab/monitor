package seoul.admin.service.impl;

import java.util.List;

import common.vo.PagingVO;
import file.dao.FileDAO;
import file.vo.FileMappingVO;
import seoul.admin.dao.AnswersDAO;
import seoul.admin.dao.MonitorApplyDAO;
import seoul.admin.dao.MonitorsDAO;
import seoul.admin.dao.NoticeDAO;
import seoul.admin.dao.SubjectDAO;
import seoul.admin.dao.SubjectInfoDAO;
import seoul.admin.service.AnswersService;
import seoul.admin.service.MonitorApplyService;
import seoul.admin.service.MonitorsService;
import seoul.admin.service.NoticeService;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.BBSVO;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

public class MonitorApplyServiceImpl implements MonitorApplyService{
	
	private MonitorApplyDAO monitorApplyDAO;
	
	
	public void setMonitorApplyDAO(MonitorApplyDAO monitorApplyDAO) {
		this.monitorApplyDAO = monitorApplyDAO;
	}
	
	@Override
	public List<MonitorApplyVO> getMonitorApplyList(MonitorApplyVO monitorApplyVO) {		
		monitorApplyVO.setPagingVO(new PagingVO(monitorApplyVO.getPageNum() , monitorApplyDAO.getMonitorApplyCnt(monitorApplyVO)));
		return monitorApplyDAO.getMonitorApplyList(monitorApplyVO);
	}

	@Override
	public 	MonitorApplyVO getMonitorApply(MonitorApplyVO monitorApplyVO) {		
		monitorApplyVO = monitorApplyDAO.getMonitorApply(monitorApplyVO);	
		return monitorApplyVO;
	}

	@Override
	public int saveMonitorApply(MonitorApplyVO monitorApplyVO) {

		int effectRows = 0;
		if(BaseUtil.isEmpty(monitorApplyVO.getIdx())){			
			effectRows = monitorApplyDAO.insertMonitorApply(monitorApplyVO);
		}else{
			effectRows = monitorApplyDAO.updateMonitorApply(monitorApplyVO);
		}
		return effectRows;
	}
	

	@Override
	public int updateMonitorApply(MonitorApplyVO monitorApplyVO) {
		return monitorApplyDAO.updateMonitorApply(monitorApplyVO);		
	}
		
}
