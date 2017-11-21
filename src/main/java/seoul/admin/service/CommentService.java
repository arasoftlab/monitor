package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.BBSVO;
import seoul.admin.vo.CommentVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public interface CommentService {

	List<CommentVO> getCommentList(CommentVO commentVO);
	
	CommentVO getComment(CommentVO commentVO);

	int saveComment(CommentVO commentVO);

	int deleteComment(CommentVO commentVO);

}
