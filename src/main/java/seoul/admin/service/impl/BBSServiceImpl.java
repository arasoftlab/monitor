package seoul.admin.service.impl;

import java.util.List;

import common.vo.PagingVO;
import file.dao.FileDAO;
import file.vo.FileMappingVO;
import seoul.admin.dao.BBSDAO;
import seoul.admin.service.BBSService;
import seoul.admin.vo.BBSVO;
import util.BaseUtil;

public class BBSServiceImpl implements BBSService{

	private BBSDAO bbsDAO;
	private FileDAO fileDAO;

	
	public void setBbsDAO(BBSDAO bbsDAO) {
		this.bbsDAO = bbsDAO;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	
	
	@Override
	public List<BBSVO> getBBSList(BBSVO bbsVO) {
		bbsVO.setPagingVO(new PagingVO(bbsVO.getPageSize(), bbsVO.getPageNum(), bbsDAO.getBBSCnt(bbsVO)));
		return bbsDAO.getBBSList(bbsVO);
	}

	@Override
	public BBSVO getBBS(BBSVO bbsVO, boolean updateHit) {

		if(updateHit) bbsDAO.updateBBSHit(bbsVO);
		bbsVO = bbsDAO.getBBS(bbsVO);
		if(!BaseUtil.isEmpty(bbsVO.getBbs_id())) 
			bbsVO.setFileList(fileDAO.getFileList(new FileMappingVO(bbsVO.getCont_uuid(), null)));
		
		return bbsVO;
	}
	@Override
	public int saveBBS(BBSVO bbsVO) {
		int effectRows = 0;
		if(BaseUtil.isEmpty(bbsVO.getCont_uuid())  ){
			//noticeVO.setNotice_id(BaseUtil.uuid());
			bbsVO.setCont_uuid(BaseUtil.uuid());
			
			effectRows = bbsDAO.insertBBS(bbsVO);
			if(!BaseUtil.isEmpty(bbsVO.getFileListId())){
				for(String file_id : bbsVO.getFileListId()){
					effectRows += fileDAO.insertFileMapping(new FileMappingVO(bbsVO.getCont_uuid(), file_id));
				}
			}
		}else{
			effectRows = bbsDAO.updateBBS(bbsVO);
		}
		return effectRows;
	}
	@Override
	public int deleteBBS(BBSVO bbsVO) {
		return bbsDAO.deleteBBS(bbsVO);
	}
	
	@Override	
	public BBSVO checkPasswordBBS(BBSVO bbsVO){		
		return bbsDAO.checkPasswordBBS(bbsVO);
	}
	
}
