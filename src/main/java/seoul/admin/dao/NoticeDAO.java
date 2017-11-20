package seoul.admin.dao;

import java.util.List;

import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public interface NoticeDAO {

	List<NoticeVO> getNoticeList(NoticeVO noticeVO);

	List<NoticeVO> getNoticeListSubjectOnly(NoticeVO noticeVO);
	
	int getNoticeCnt(NoticeVO noticeVO);

	NoticeVO getNotice(NoticeVO noticeVO);
	
	int updateNoticeHit(NoticeVO noticeVO);

	int insertNotice(NoticeVO noticeVO);

	int updateNotice(NoticeVO noticeVO);

	int deleteNotice(NoticeVO noticeVO);

	List<SubjectVO> getUnLinkedSubjectList(NoticeVO noticeVO);

}
