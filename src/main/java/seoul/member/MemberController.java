package seoul.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.AES256Cipher;
import common.SessionContants;
import util.BaseUtil;
import util.SessionUtil;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("adminlogin.do")
	public String loginView(){
		return "member/loginView.login";
	}

	@RequestMapping("checkAdminMember.do")
	public @ResponseBody Map<String, Object> checkAdminMember(@ModelAttribute MemberVO memberVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String pswd = AES256Cipher.AES_Encode(memberVO.getPassword());
		memberVO.setPassword(pswd);
		
		System.out.println(memberVO.toString());
		memberVO = memberService.checkAdminMember(memberVO);
				
		if(BaseUtil.isEmpty(memberVO)){
			resultMap.put("result", "fail");
		}else{						
			SessionUtil.setAttribute(SessionContants.ADMIN, memberVO);
			resultMap.put("result", "success");
		}
		return resultMap;
	}
	
	@RequestMapping("adminLogout.do")
	public String adminLogout(@ModelAttribute MemberVO memberVO) throws Exception{
						
		if ( SessionUtil.isAlive() ) 
		{	
			SessionUtil.removeAttribute(SessionContants.ADMIN);
		}
		return "redirect:/member/adminlogin.do";
	}
	
	@RequestMapping("checkMember.do")
	public @ResponseBody Map<String, Object> checkMember(@ModelAttribute MemberVO memberVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		System.out.println("로그인시도 : " + memberVO.getId());
		if(!ObjectUtils.isEmpty(memberVO.getId())) { //id로 통합회원검색
			memberVO = memberService.checkMember(memberVO);
			if(!ObjectUtils.isEmpty(memberVO)) { //검색된 정보로 꼼꼼패널검색
				MemberVO backendData = memberService.getBackEndMember(memberVO);
				memberVO.setName(backendData.getName());
			}
		}
		
		if(BaseUtil.isEmpty(memberVO)){
			resultMap.put("result", "fail");
			
			//내용이 없을때는 세션을 초기화 해준다.
			SessionUtil.setAttribute(SessionContants.MEMBER, null);
			SessionUtil.setAttribute("grade",  null);
			
		}else{		
			
			MemberVO login_mem = new MemberVO();
			login_mem.setId(memberVO.getId());
			memberService.updateMemberState(login_mem);
			
			SessionUtil.setAttribute(SessionContants.MEMBER, memberVO);
			SessionUtil.setAttribute("grade", memberVO.getGrade());
			
			resultMap.put("result", "success");
			resultMap.put("grade", memberVO.getGrade());			
		}
		return resultMap;
	}
	
	@RequestMapping("checkSession.do")
	public @ResponseBody Map<String, Object> checkSession() throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
			
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );
		MemberVO mem = (MemberVO)ret;		
		
		String chk = ObjectUtils.isEmpty(mem) ? "비었음 " : mem.toString();
		
		//SessionUtil.
		System.out.println("세션정보 : " + ret );
		System.out.println("멤버확인 : " + chk );
		
		if(!SessionUtil.isAlive()){
			resultMap.put("result", "fail");
		}else{
			resultMap.put("result", "success");
			resultMap.put("account", ret);
			resultMap.put("grade", mem.getGrade());
		}
				
		return resultMap;
	}
	
	@RequestMapping("checkAdminSession.do")
	public @ResponseBody Map<String, Object> checkAdminSession() throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
			
		Object ret = SessionUtil.getAttribute(SessionContants.ADMIN );
		MemberVO mem = (MemberVO)ret;		

		//SessionUtil.
		
		if(!SessionUtil.isAlive_admin()){
			resultMap.put("result", "fail");
		}else{
			resultMap.put("result", "success");
			resultMap.put("account", ret);
			resultMap.put("grade", mem.getGrade());
		}
				
		return resultMap;
	}
	
	@RequestMapping("logout.do")
	public String logout() throws Exception{
		
		if ( SessionUtil.isAlive() ) 
		{	
			SessionUtil.removeAttribute(SessionContants.MEMBER);
		}
		return "redirect:/front/member/login/login.do";
	}
	
	@RequestMapping("profile.do")
	public String profile(){
		return "member/profile.login";
	}
	
	@RequestMapping("checkId.do")
	public @ResponseBody Map<String, Object> checkId(@ModelAttribute MemberVO memberVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int cnt = memberService.checkId(memberVO);
		
		if(cnt > 0){
			resultMap.put("result", "fail");
		}else{
			resultMap.put("result", "success");
		}
		return resultMap;
	}
	
	@RequestMapping("updateMember.do")
	public @ResponseBody Map<String, Object> updateMember(@ModelAttribute MemberVO memberVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int effectRows = memberService.updateMember(memberVO);
		
		if(effectRows > 0){
			SessionUtil.setAttribute(SessionContants.MEMBER, memberVO);
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}


