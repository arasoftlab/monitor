package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.MonitorsMemberVO;
import seoul.admin.vo.MonitorsVO;

public interface MonitorsDAO {
	MonitorsVO getMonitors(MonitorsVO monitorsVO) ;

	List<MonitorsVO> getMonitorsList(MonitorsVO monitorsVO);
	
	List<MonitorsVO> getMonitorsApplyList(MonitorsVO monitorsVO);
	
	int insertMonitors(MonitorsVO monitorsVO);

	int updateMonitors(MonitorsVO monitorsVO);
	
	int deleteMonitors(MonitorsVO monitorsVO);
	
	int getMonitorsCnt(MonitorsVO monitorsVO);
	
	int updateMonitorsApply(MonitorsVO monitorsVO);
	
	int getMonitorsMemberCnt(MonitorsMemberVO monitorsVO);
	
	List<MonitorsMemberVO> getMonitorsMember(MonitorsMemberVO monitorsVO);
	
	List<MonitorsMemberVO> getMonitorsAnE_list(MonitorsMemberVO monitorsVO);
}
