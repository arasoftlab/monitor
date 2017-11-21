package seoul.admin.service.impl;

import java.util.List;

import common.vo.PagingVO;
import seoul.admin.dao.MonitorsDAO;
import seoul.admin.service.MonitorsService;
import seoul.admin.vo.MonitorsMemberVO;
import seoul.admin.vo.MonitorsVO;

public class MonitorsServiceImpl implements MonitorsService{
	
	private MonitorsDAO monitorsDAO;
	
	
	public void setMonitorsDAO(MonitorsDAO monitorsDAO) {
		this.monitorsDAO = monitorsDAO;
	}
	
	
	public MonitorsVO getMonitors(MonitorsVO monitorsVO) {		
		monitorsVO = monitorsDAO.getMonitors(monitorsVO);	
		return monitorsVO;
	}
	
	@Override
	public List<MonitorsVO> getMonitorsList(MonitorsVO monitorsVO) {		

		monitorsVO.setPagingVO(new PagingVO(monitorsVO.getPageNum() , monitorsDAO.getMonitorsCnt(monitorsVO)));
		return monitorsDAO.getMonitorsList(monitorsVO);
	}

	@Override
	public List<MonitorsVO> getMonitorsApplyList(MonitorsVO monitorsVO) {		
		monitorsVO.setPagingVO(new PagingVO(monitorsVO.getPageNum() , monitorsDAO.getMonitorsCnt(monitorsVO)));
		return monitorsDAO.getMonitorsApplyList(monitorsVO);
	}
	
	
	
	@Override
	public int insertMonitors(MonitorsVO monitorsVO) {
				
		int effectRows = 0;
//		if(BaseUtil.isEmpty(monitorsVO.get())|| monitorsVO.getAnswers_id().equals("0")){
			effectRows = monitorsDAO.insertMonitors(monitorsVO);			
			/*
			if(!BaseUtil.isEmpty(subjectVO.getFileListId())){
				for(String file_id : subjectVO.getFileListId()){
					effectRows += fileDAO.insertFileMapping(new FileMappingVO(subjectVO.getCont_uuid(), file_id));
				}
			}*/
	//	}
		return effectRows;
	}
	

	@Override
	public int updateMonitors(MonitorsVO monitorsVO) {
		return monitorsDAO.updateMonitors(monitorsVO);		
	}

	@Override
	public int deleteMonitors(MonitorsVO monitorsVO) {
		return monitorsDAO.deleteMonitors(monitorsVO);		
	}
	
	@Override	
	public int getMonitorsCnt(MonitorsVO monitorsVO)
	{
		return monitorsDAO.getMonitorsCnt(monitorsVO);
	}
	
	@Override
	public int updateMonitorsApply(MonitorsVO monitorsVO)
	{
		return monitorsDAO.updateMonitorsApply(monitorsVO);
	}
	
	
	public 	List<MonitorsMemberVO> getMonitorsMember(MonitorsMemberVO monitorsVO) {			
		monitorsVO.setPagingVO(new PagingVO(monitorsVO.getPageNum() , monitorsDAO.getMonitorsMemberCnt(monitorsVO)));
		return monitorsDAO.getMonitorsMember(monitorsVO);		
	}
	

}
