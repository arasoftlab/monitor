package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public interface MonitorApplyDAO {
	List<MonitorApplyVO> getMonitorApplyList(MonitorApplyVO monitorApplyVO);

	MonitorApplyVO getMonitorApply(MonitorApplyVO monitorApplyVO);
		
	int insertMonitorApply(MonitorApplyVO monitorApplyVO);
		
	int updateMonitorApply(MonitorApplyVO monitorApplyVO);
	
	int getMonitorApplyCnt(MonitorApplyVO monitorApplyVO);
	
}
