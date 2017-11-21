package seoul.admin.dao.impl;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.BBSDAO;
import seoul.admin.dao.CommentDAO;
import seoul.admin.dao.NoticeDAO;
import seoul.admin.vo.BBSVO;
import seoul.admin.vo.CommentVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public class CommentDAOImpl extends SqlSessionDaoSupport implements CommentDAO{

	@Override
	public List<CommentVO> getCommentList(CommentVO commentVO) {
		return getSqlSession().selectList("comment.getCommentList", commentVO);
	}
		
	@Override
	public 	int getCommentCnt(CommentVO commentVO) {
		return getSqlSession().selectOne("comment.getCommentCnt", commentVO);
	}

	@Override
	public CommentVO getComment(CommentVO commentVO) {
		return getSqlSession().selectOne("comment.getComment", commentVO);
	}
	
	@Override
	public int updateCommentHit(CommentVO commentVO) {
		return getSqlSession().update("comment.updateCommentHit", commentVO);
	}

	@Override
	public int insertComment(CommentVO commentVO) {
		return getSqlSession().insert("comment.insertComment", commentVO);
	}

	@Override
	public int updateComment(CommentVO commentVO) {
		return getSqlSession().update("comment.updateComment", commentVO);
	}

	@Override
	public int deleteComment(CommentVO commentVO) {
		return getSqlSession().delete("comment.deleteComment", commentVO);
	}


}
