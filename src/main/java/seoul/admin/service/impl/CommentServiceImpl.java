package seoul.admin.service.impl;

import java.util.List;

import common.vo.PagingVO;
import file.dao.FileDAO;
import file.vo.FileMappingVO;
import seoul.admin.dao.CommentDAO;
import seoul.admin.service.CommentService;
import seoul.admin.vo.CommentVO;
import util.BaseUtil;

public class CommentServiceImpl implements CommentService{

	private CommentDAO commentDAO;
	private FileDAO fileDAO;

	
	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}
	public void setFileDAO(FileDAO fileDAO) {
		this.fileDAO = fileDAO;
	}
	
	
	@Override
	public List<CommentVO> getCommentList(CommentVO commentVO) {
		commentVO.setPagingVO(new PagingVO(commentVO.getPageSize(), commentVO.getPageNum(), commentDAO.getCommentCnt(commentVO)));
		return commentDAO.getCommentList(commentVO);
	}

	@Override
	public CommentVO getComment(CommentVO commentVO) {

		commentVO = commentDAO.getComment(commentVO);
		if(!BaseUtil.isEmpty(commentVO.getComm_id())) 
			commentVO.setFileList(fileDAO.getFileList(new FileMappingVO(commentVO.getCont_uuid(), null)));
		
		return commentVO;
	}
	@Override
	public int saveComment(CommentVO commentVO) {
		
		int effectRows = 0;
		if(BaseUtil.isEmpty(commentVO.getComm_id()) ){
			//noticeVO.setNotice_id(BaseUtil.uuid());
			commentVO.setCont_uuid(BaseUtil.uuid());
			
			effectRows = commentDAO.insertComment(commentVO);
			if(!BaseUtil.isEmpty(commentVO.getFileListId())){
				for(String file_id : commentVO.getFileListId()){
					effectRows += fileDAO.insertFileMapping(new FileMappingVO(commentVO.getCont_uuid(), file_id));
				}
			}
		}else{
			effectRows = commentDAO.updateComment(commentVO);
		}
		return effectRows;
	}
	@Override
	public int deleteComment(CommentVO commentVO) {
		return commentDAO.deleteComment(commentVO);
	}
	
}
