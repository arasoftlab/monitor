package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.AnswersDAO;
import seoul.admin.dao.MonitorsDAO;
import seoul.admin.dao.NoticeDAO;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorsMemberVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public class MonitorsDAOImpl extends SqlSessionDaoSupport implements MonitorsDAO{

	@Override
	public MonitorsVO getMonitors(MonitorsVO monitorsVO) {
		return getSqlSession().selectOne("monitors.getMonitors", monitorsVO);
	}
	
	@Override
	public List<MonitorsVO> getMonitorsList(MonitorsVO monitorsVO) {
		return getSqlSession().selectList("monitors.getMonitorsList", monitorsVO);
	}
	
	@Override
	public List<MonitorsVO> getMonitorsApplyList(MonitorsVO monitorsVO) {
		return getSqlSession().selectList("monitors.getMonitorsApplyList", monitorsVO);
	}
		
	@Override
	public int insertMonitors(MonitorsVO monitorsVO) {
		return getSqlSession().insert("monitors.insertMonitors", monitorsVO);
	}
	
	@Override
	public int updateMonitors(MonitorsVO monitorsVO) {
		return getSqlSession().insert("monitors.updateMonitors", monitorsVO);
	}	
	
	@Override
	public int deleteMonitors(MonitorsVO monitorsVO) {
		return getSqlSession().delete("monitors.deleteMonitors", monitorsVO);
	}	
	
	@Override
	public int getMonitorsCnt(MonitorsVO monitorsVO)
	{
		return getSqlSession().selectOne("monitors.getMonitorsCnt", monitorsVO);		
	}

	@Override
	public int updateMonitorsApply(MonitorsVO monitorsVO) {
		return getSqlSession().insert("monitors.updateMonitorsApply", monitorsVO);
	}	
	
	
	
	
	@Override	
	public List<MonitorsMemberVO> getMonitorsMember(MonitorsMemberVO monitorsVO){
		return getSqlSession().selectList("monitors.getMonitorsMember", monitorsVO);
	}
	
	@Override
	public int getMonitorsMemberCnt(MonitorsMemberVO monitorsVO)
	{
		return getSqlSession().selectOne("monitors.getMonitorsMemberCnt", monitorsVO);		
	}
}
