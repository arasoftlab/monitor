package seoul.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import file.dao.FileDAO;
import file.vo.FileMappingVO;
import seoul.admin.dao.SubjectInfoDAO;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

public class SubjectInfoServiceImpl implements SubjectInfoService{
	private SubjectInfoDAO subjectInfoDAO;
	private FileDAO fileDAO;

	public void setSubjectInfoDAO(SubjectInfoDAO subjectInfoDAO) {
		this.subjectInfoDAO = subjectInfoDAO;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	@Override
	public SubjectVO getSubject(SubjectVO subjectVO) {
		subjectVO = subjectInfoDAO.getSubject(subjectVO);
		subjectVO.setFileList(fileDAO.getFileList(new FileMappingVO(subjectVO.getCont_uuid(), null)));
		return subjectVO;
	}
	@Override
	public int saveSubject(SubjectVO subjectVO) {
				
		int effectRows = 0;
		if(BaseUtil.isEmpty(subjectVO.getSubject_id())){
			//subjectVO.setSubject_id(subjectVO.getSubject_id());
			subjectVO.setCont_uuid(BaseUtil.uuid());
			effectRows = subjectInfoDAO.insertSubject(subjectVO);			

			if(!BaseUtil.isEmpty(subjectVO.getFileListId())){
				for(String file_id : subjectVO.getFileListId()){
					effectRows += fileDAO.insertFileMapping(new FileMappingVO(subjectVO.getCont_uuid(), file_id));
				}
			}
		}else{
						
			SubjectVO getCont_idVO = subjectInfoDAO.getSubject(subjectVO);
			
			System.out.println(getCont_idVO.getClose_comment());

			subjectVO.setCont_uuid(getCont_idVO.getCont_uuid());
	
			
			System.out.println(subjectVO.getClose_comment());
			
			effectRows = subjectInfoDAO.updateSubject(subjectVO);
		}
		return effectRows;
	}
	@Override
	public int deleteSubject(SubjectVO subjectVO) {
		return subjectInfoDAO.deleteSubject(subjectVO);
	}
}
