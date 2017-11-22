package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.MonitorApplyVO;

public interface MonitorApplyDAO {
	List<MonitorApplyVO> getMonitorApplyList(MonitorApplyVO monitorApplyVO);

	MonitorApplyVO getMonitorApply(MonitorApplyVO monitorApplyVO);
		
	int insertMonitorApply(MonitorApplyVO monitorApplyVO);
		
	int updateMonitorApply(MonitorApplyVO monitorApplyVO);
	
	int getMonitorApplyCnt(MonitorApplyVO monitorApplyVO);
	
}
