package seoul.admin.service.impl;

import java.util.List;

import common.vo.PagingVO;
import seoul.admin.dao.MonitorApplyDAO;
import seoul.admin.service.MonitorApplyService;
import seoul.admin.vo.MonitorApplyVO;
import util.BaseUtil;

public class MonitorApplyServiceImpl implements MonitorApplyService{
	
	private MonitorApplyDAO monitorApplyDAO;
	
	
	public void setMonitorApplyDAO(MonitorApplyDAO monitorApplyDAO) {
		this.monitorApplyDAO = monitorApplyDAO;
	}
	
	@Override
	public List<MonitorApplyVO> getMonitorApplyList(MonitorApplyVO monitorApplyVO) {		
		monitorApplyVO.setPagingVO(new PagingVO(monitorApplyVO.getPageSize() ,monitorApplyVO.getPageNum() , monitorApplyDAO.getMonitorApplyCnt(monitorApplyVO)));
		
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
		
	@Override
	public int deleteMonitorApply(MonitorApplyVO monitorApplyVO) {
		return monitorApplyDAO.deleteMonitorApply(monitorApplyVO);
	}
}
