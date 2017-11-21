package seoul.member;

import java.util.List;

import common.vo.PagingVO;



public class MemberServiceImpl implements MemberService{
	private MemberDAO memberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public int getMemberCnt(MemberVO memberVO)
	{
		return memberDAO.getMemberCnt(memberVO);
	}
	
	@Override
	public List<MemberVO> getMemberList(MemberVO memberVO)
	{
		memberVO.setPagingVO(new PagingVO(memberVO.getPageNum() , memberDAO.getMemberCnt(memberVO)));
		return memberDAO.getMemberList(memberVO);
	}

	@Override
	public MemberVO getMember(MemberVO memberVO) {
		return memberDAO.getMember(memberVO);
	}
	
	@Override
	public MemberVO checkMember(MemberVO memberVO) {
		return memberDAO.checkMember(memberVO);
	}

	@Override
	public int updateMember(MemberVO memberVO) {
		return memberDAO.updateMember(memberVO);
	}

	@Override
	public int updateMemberETC(MemberVO memberVO) {
		return memberDAO.updateMemberETC(memberVO);
	}
	
	@Override
	public int checkId(MemberVO memberVO) {
		return memberDAO.checkId(memberVO);
	}
	@Override	
	public int insertMember(MemberVO memberVO) {
		return memberDAO.insertMember(memberVO);
	}

	@Override	
	public int insertJoinMember(MemberVO memberVO) {
		
				
		return memberDAO.insertJoinMember(memberVO);

	}
	
	@Override
	public int deleteMember(MemberVO memberVO){
		return memberDAO.deleteMember(memberVO);
	}
	
	
}
