package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.MonitorApplyDAO;
import seoul.admin.vo.MonitorApplyVO;

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
	
	public int deleteMonitorApply(MonitorApplyVO monitorApplyVO) {
		return getSqlSession().delete("monitor_apply.deleteMonitorApply", monitorApplyVO);
	}
}
