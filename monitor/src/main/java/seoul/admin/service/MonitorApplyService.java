package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public interface MonitorApplyService {
	
	List<MonitorApplyVO> getMonitorApplyList(MonitorApplyVO monitorApplyVO);

	MonitorApplyVO getMonitorApply(MonitorApplyVO monitorApplyVO);
		
	int saveMonitorApply(MonitorApplyVO monitorApplyVO);
		
	int updateMonitorApply(MonitorApplyVO monitorApplyVO);
	
}
