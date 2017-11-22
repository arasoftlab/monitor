package seoul.admin.service;

import java.util.List;

import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;

public interface NoticeService {

	List<NoticeVO> getNoticeList(NoticeVO noticeVO);

	List<NoticeVO> getNoticeListSubjectOnly(NoticeVO noticeVO);
	
	NoticeVO getNotice(NoticeVO noticeVO, boolean updateHit);

	int saveNotice(NoticeVO noticeVO);

	int deleteNotice(NoticeVO noticeVO);

	List<SubjectVO> getUnLinkedSubjectList(NoticeVO noticeVO);

}
