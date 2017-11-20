package seoul.member;

import java.util.List;



public interface MemberDAO {
	
	MemberVO getMember(MemberVO memberVO);
	
	int getMemberCnt(MemberVO memberVO);
	
	List<MemberVO> getMemberList(MemberVO memberVO);
	
	MemberVO checkMember(MemberVO memberVO);

	int updateMember(MemberVO memberVO);

	int updateMemberETC(MemberVO memberVO);	
	
	int checkId(MemberVO memberVO);

	int insertMember(MemberVO memberVO);

	int insertJoinMember(MemberVO memberVO);
	
	int deleteMember(MemberVO memberVO);
}
