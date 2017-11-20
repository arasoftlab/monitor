package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.CommentVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public interface CommentDAO {

	List<CommentVO> getCommentList(CommentVO commentVO);
	
	int getCommentCnt(CommentVO commentVO);

	CommentVO getComment(CommentVO commentVO);
	
	int updateCommentHit(CommentVO commentVO);

	int insertComment(CommentVO commentVO);

	int updateComment(CommentVO commentVO);

	int deleteComment(CommentVO commentVO);

}
