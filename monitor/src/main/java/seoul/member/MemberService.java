package seoul.member;

import java.util.List;

import seoul.admin.vo.AnswersVO;



public interface MemberService {
	
	int getMemberCnt(MemberVO memberVO);
	
	List<MemberVO> getMemberList(MemberVO memberVO);
	
	MemberVO checkMember(MemberVO memberVO);

	int updateMember(MemberVO memberVO);

	int updateMemberETC(MemberVO memberVO);	
	
	int checkId(MemberVO memberVO);
	
	MemberVO getMember(MemberVO memberVO);
	
	int insertMember(MemberVO memberVO);
	
	int insertJoinMember(MemberVO memberVO);
	
	int deleteMember(MemberVO memberVO);
	
	
}
