package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.MonitorApplyVO;

public interface MonitorApplyService {
	
	List<MonitorApplyVO> getMonitorApplyList(MonitorApplyVO monitorApplyVO);

	MonitorApplyVO getMonitorApply(MonitorApplyVO monitorApplyVO);
		
	int saveMonitorApply(MonitorApplyVO monitorApplyVO);
		
	int updateMonitorApply(MonitorApplyVO monitorApplyVO);
	
}
