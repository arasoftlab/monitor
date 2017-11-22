package seoul.member;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import seoul.admin.vo.MemberManagerVO;



public class MemberDAOImpl extends SqlSessionDaoSupport implements MemberDAO{
	
	@Override
	public MemberVO getMember(MemberVO memberVO) {
		return getSqlSession().selectOne("member.getMember", memberVO);
	}
	
	@Override	
	public int getMemberCnt(MemberVO memberVO)
	{
		return getSqlSession().selectOne("member.getMemberCnt", memberVO);
	}	
	
	@Override
	public List<MemberVO> getMemberList(MemberVO memberVO) {
		return getSqlSession().selectList("member.getMemberList", memberVO);
	}
	
	@Override
	public MemberVO checkMember(MemberVO memberVO) {
		return getSqlSession().selectOne("member.checkMember", memberVO);
	}
	@Override
	public MemberVO checkAdminMember(MemberVO memberVO){
		return getSqlSession().selectOne("member.checkAdminMember", memberVO);
	}
	
	
	@Override
	public int updateMember(MemberVO memberVO) {
		return getSqlSession().update("member.updateMember", memberVO);
	}

	@Override
	public int updateMemberETC(MemberVO memberVO) {
		return getSqlSession().update("member.updateMemberETC", memberVO);
	}
	
	
	@Override
	public int checkId(MemberVO memberVO) {
		return getSqlSession().selectOne("member.checkId", memberVO);
	}
	
	@Override
	public int insertMember(MemberVO memberVO) {
		return getSqlSession().insert("member.insertMember", memberVO);
	}	

	@Override
	public int insertJoinMember(MemberVO memberVO) {
		return getSqlSession().insert("member.insertJoinMember", memberVO);
	}	
	
	@Override	
	public int updatejoinMember(MemberVO memberVO){
		return getSqlSession().update("member.updatejoinMember", memberVO);
	}
	
	@Override
	public int deleteMember(MemberVO memberVO) {
		return getSqlSession().delete("member.deleteMember", memberVO);
	}	
	
	@Override	
	public MemberVO getBackEndMember(MemberVO memberVO){
		return getSqlSession().selectOne("member.getBackEndMember", memberVO);
	}
	
	
	@Override	
	public List<MemberManagerVO> getMemberManagerlist(MemberManagerVO memberManagerVO){
		return getSqlSession().selectList("member.getMemberManagerlist" , memberManagerVO);	
	}
	
	@Override	
	public List<MemberManagerVO> getMemberManagerlist_secession(MemberManagerVO memberManagerVO){
		return getSqlSession().selectList("member.getMemberManagerlist_secession" , memberManagerVO);	
	}	
	
	
	@Override	
	public int getMemberManagerCnt(MemberManagerVO memberManagerVO){
		return getSqlSession().selectOne("member.getMemberManagerCnt" , memberManagerVO); 
	}
	

	@Override	
	public int updateMemberState(MemberVO memberVO){
		return getSqlSession().update("member.updateMemberState" , memberVO); 
	}
	
	
	@Override	
	public MemberVO getMemberAct(MemberVO memberVO){
		return getSqlSession().selectOne("member.getMemberAct" , memberVO);
	}
	
	
	
	@Override	
	public List<MemberVO> getMemberManagerPlaceCnt(MemberVO memberVO){
		return getSqlSession().selectList("member.getMemberManagerPlaceCnt" , memberVO);
	}
	
 
	@Override	
	public	List<MemberVO> getM001_secession(MemberVO memberVO){
		return getSqlSession().selectList("member.getM001_secession" , memberVO);		
	}
	
}
