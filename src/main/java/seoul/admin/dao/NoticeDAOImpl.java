package seoul.admin.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.dao.NoticeDAO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public class NoticeDAOImpl extends SqlSessionDaoSupport implements NoticeDAO{

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO) {
		return getSqlSession().selectList("notice.getNoticeList", noticeVO);
	}

	@Override
	public List<NoticeVO> getNoticeListSubjectOnly(NoticeVO noticeVO) {
		return getSqlSession().selectList("notice.getNoticeListSubjectOnly", noticeVO);
	}
		
	@Override
	public int getNoticeCnt(NoticeVO noticeVO) {
		return getSqlSession().selectOne("notice.getNoticeCnt", noticeVO);
	}

	@Override
	public NoticeVO getNotice(NoticeVO noticeVO) {
		return getSqlSession().selectOne("notice.getNotice", noticeVO);
	}
	
	@Override
	public int updateNoticeHit(NoticeVO noticeVO) {
		return getSqlSession().update("notice.updateNoticeHit", noticeVO);
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		return getSqlSession().insert("notice.insertNotice", noticeVO);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return getSqlSession().update("notice.updateNotice", noticeVO);
	}

	@Override
	public int deleteNotice(NoticeVO noticeVO) {
		return getSqlSession().delete("notice.deleteNotice", noticeVO);
	}

	@Override
	public List<SubjectVO> getUnLinkedSubjectList(NoticeVO noticeVO) {
		return getSqlSession().selectList("notice.getUnLinkedSubjectList", noticeVO);
	}

}
