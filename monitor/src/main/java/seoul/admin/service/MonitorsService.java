package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorsMemberVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public interface MonitorsService {
	
	List<MonitorsVO> getMonitorsList(MonitorsVO monitorsVO);

	List<MonitorsVO> getMonitorsApplyList(MonitorsVO monitorsVO);
	
	MonitorsVO getMonitors(MonitorsVO monitorsVO);
		
	int insertMonitors(MonitorsVO monitorsVO);
		
	int updateMonitors(MonitorsVO monitorsVO);
	
	int deleteMonitors(MonitorsVO monitorsVO);
	
	int getMonitorsCnt(MonitorsVO monitorsVO);
	
	int updateMonitorsApply(MonitorsVO monitorsVO);
	
	
	List<MonitorsMemberVO> getMonitorsMember(MonitorsMemberVO monitorsVO);
}
