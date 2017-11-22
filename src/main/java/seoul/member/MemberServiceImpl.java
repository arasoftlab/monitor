package seoul.member;

import java.util.List;

import common.vo.PagingVO;
import seoul.admin.vo.MemberManagerVO;



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
	public MemberVO checkAdminMember(MemberVO memberVO){
		return memberDAO.checkAdminMember(memberVO);
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
		
		MemberVO id_tempVO = new MemberVO();
		
		id_tempVO.setId(memberVO.getId());
		
		id_tempVO = memberDAO.checkMember(id_tempVO);
				
		if (id_tempVO == null) 
			return memberDAO.insertJoinMember(memberVO);
		else
			return memberDAO.updatejoinMember(memberVO);
	}
	
	@Override
	public int deleteMember(MemberVO memberVO){
		return memberDAO.deleteMember(memberVO);
	}
	
	@Override
	public MemberVO getBackEndMember(MemberVO memberVO){		
		return memberDAO.getBackEndMember(memberVO);
	}
	
	
	
	@Override
	public List<MemberManagerVO> getMemberManagerlist(MemberManagerVO memberManagerVO){
		memberManagerVO.setPagingVO(new PagingVO(memberManagerVO.getPageSize() , memberManagerVO.getPageNum(), memberDAO.getMemberManagerCnt(memberManagerVO) ));
		return memberDAO.getMemberManagerlist(memberManagerVO);		
	}
	
	@Override
	public List<MemberManagerVO> getMemberManagerlist_secession(MemberManagerVO memberManagerVO){
		memberManagerVO.setPagingVO(new PagingVO(memberManagerVO.getPageSize() , memberManagerVO.getPageNum(), memberDAO.getMemberManagerCnt(memberManagerVO) ));
		return memberDAO.getMemberManagerlist_secession(memberManagerVO);		
	}
		
	@Override
	public int getMemberManagerCnt(MemberManagerVO memberManagerVO){
		return memberDAO.getMemberManagerCnt(memberManagerVO);		
	}
	
	@Override
	public int updateMemberState(MemberVO memberVO){
		return memberDAO.updateMemberState(memberVO);
	}
	
	@Override
	public MemberVO getMemberAct(MemberVO memberVO){
		return memberDAO.getMemberAct(memberVO);
	}
	
	
	
	@Override
	public List<MemberVO> getMemberManagerPlaceCnt(MemberVO memberVO){
		return memberDAO.getMemberManagerPlaceCnt(memberVO);
	}
	
	@Override
	public	List<MemberVO> getM001_secession(MemberVO memberVO){
		return memberDAO.getM001_secession(memberVO);
	}
}
