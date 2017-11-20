package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.AnswersDAO;
import seoul.admin.dao.MonitorApplyDAO;
import seoul.admin.dao.MonitorsDAO;
import seoul.admin.dao.NoticeDAO;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public class MonitorApplyDAOImpl extends SqlSessionDaoSupport implements MonitorApplyDAO{

	@Override
	public MonitorApplyVO getMonitorApply(MonitorApplyVO monitorApplyVO) {
		return getSqlSession().selectOne("monitor_apply.getMonitorApply", monitorApplyVO);
	}
	
	@Override
	public List<MonitorApplyVO> getMonitorApplyList(MonitorApplyVO monitorApplyVO) {
		return getSqlSession().selectList("monitor_apply.getMonitorApplyList", monitorApplyVO);
	}
		
	@Override
	public int insertMonitorApply(MonitorApplyVO monitorApplyVO) {
		return getSqlSession().insert("monitor_apply.insertMonitorApply", monitorApplyVO);
	}
	
	@Override
	public int updateMonitorApply(MonitorApplyVO monitorApplyVO) {
		return getSqlSession().insert("monitor_apply.updateMonitorApply", monitorApplyVO);
	}
	@Override
	public int getMonitorApplyCnt(MonitorApplyVO monitorApplyVO){
		return getSqlSession().selectOne("monitor_apply.getMonitorApplyCnt", monitorApplyVO);		
	}
}
