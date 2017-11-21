package seoul.member;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;



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
	public int deleteMember(MemberVO memberVO) {
		return getSqlSession().delete("member.deleteMember", memberVO);
	}	
	
	
}
