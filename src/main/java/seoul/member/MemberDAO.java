package seoul.member;

import java.util.List;

import seoul.admin.vo.MemberManagerVO;



public interface MemberDAO {
	
	MemberVO getMember(MemberVO memberVO);
	
	int getMemberCnt(MemberVO memberVO);
	
	List<MemberVO> getMemberList(MemberVO memberVO);
	
	MemberVO checkMember(MemberVO memberVO);

	MemberVO checkAdminMember(MemberVO memberVO);
	
	MemberVO getBackEndMember(MemberVO memberVO);
	
	int updateMember(MemberVO memberVO);

	int updateMemberETC(MemberVO memberVO);	
	
	int checkId(MemberVO memberVO);

	int insertMember(MemberVO memberVO);

	int insertJoinMember(MemberVO memberVO);
	
	int updatejoinMember(MemberVO memberVO);
	
	int deleteMember(MemberVO memberVO);
	
	
	List<MemberManagerVO> getMemberManagerlist(MemberManagerVO memberManagerVO);
	
	int getMemberManagerCnt(MemberManagerVO memberManagerVO);
	
	
	int updateMemberState(MemberVO memberVO);
	
	MemberVO getMemberAct(MemberVO memberVO);
	
	List<MemberVO> getMemberManagerPlaceCnt(MemberVO memberVO);

	List<MemberVO> getM001_secession(MemberVO memberVO);
	
	
	
	List<MemberManagerVO> getMemberManagerlist_secession(MemberManagerVO memberManagerVO);
}
