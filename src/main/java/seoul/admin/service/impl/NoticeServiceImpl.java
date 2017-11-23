package seoul.admin.service.impl;

import java.util.List;

import common.vo.PagingVO;
import file.dao.FileDAO;
import file.vo.FileMappingVO;
import seoul.admin.dao.NoticeDAO;
import seoul.admin.dao.SubjectInfoDAO;
import seoul.admin.service.NoticeService;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

public class NoticeServiceImpl implements NoticeService{
	private NoticeDAO noticeDAO;
	private SubjectInfoDAO subjectInfoDAO;
	private FileDAO fileDAO;

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}
	public void setSubjectInfoDAO(SubjectInfoDAO subjectInfoDAO) {
		this.subjectInfoDAO = subjectInfoDAO;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO) {
		noticeVO.setPagingVO(new PagingVO(noticeVO.getPageSize(), noticeVO.getPageNum(), noticeDAO.getNoticeCnt(noticeVO)));
		return noticeDAO.getNoticeList(noticeVO);
	}

	@Override
	public List<NoticeVO> getNoticeListSubjectOnly(NoticeVO noticeVO) {
		noticeVO.setPagingVO(new PagingVO(noticeVO.getPageSize(), noticeVO.getPageNum(), noticeDAO.getNoticeCnt(noticeVO)));
		return noticeDAO.getNoticeListSubjectOnly(noticeVO);
	}
	
	@Override
	public NoticeVO getNotice(NoticeVO noticeVO, boolean updateHit) {
		if(updateHit) noticeDAO.updateNoticeHit(noticeVO);
		
		noticeVO = noticeDAO.getNotice(noticeVO);
		if(!BaseUtil.isEmpty(noticeVO.getSubject_id())) {		
			SubjectVO svo = new SubjectVO(noticeVO.getSubject_id());
			noticeVO.setSubjectVO(subjectInfoDAO.getSubject(svo));
		}else {
			noticeVO.setFileList(fileDAO.getFileList(new FileMappingVO(noticeVO.getCont_uuid(), null)));
		}
		return noticeVO;
	}
	@Override
	public int saveNotice(NoticeVO noticeVO) {
		int effectRows = 0;
		if(BaseUtil.isEmpty(noticeVO.getNotice_id()) || noticeVO.getNotice_id() == 0 ){
			//noticeVO.setNotice_id(BaseUtil.uuid());
			noticeVO.setCont_uuid(BaseUtil.uuid());
			
			effectRows = noticeDAO.insertNotice(noticeVO);
			if(!BaseUtil.isEmpty(noticeVO.getFileListId())){
				for(String file_id : noticeVO.getFileListId()){
					effectRows += fileDAO.insertFileMapping(new FileMappingVO(noticeVO.getCont_uuid(), file_id));
				}
			}
		}else{
			effectRows = noticeDAO.updateNotice(noticeVO);
		}
		return effectRows;
	}
	@Override
	public int deleteNotice(NoticeVO noticeVO) {
		return noticeDAO.deleteNotice(noticeVO);
	}
	@Override
	public List<SubjectVO> getUnLinkedSubjectList(NoticeVO noticeVO) {
		if (noticeVO.getType() == null || noticeVO.getType()=="")
		{
			noticeVO.setType("F");
		}
		return noticeDAO.getUnLinkedSubjectList(noticeVO);
	}
}
