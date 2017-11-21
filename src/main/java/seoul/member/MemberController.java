package seoul.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;





import util.BaseUtil;
import util.SessionUtil;
import common.SessionContants;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("loginView.do")
	public String loginView(){
		return "member/loginView.login";
	}
	
	@RequestMapping("checkMember.do")
	public @ResponseBody Map<String, Object> checkMember(@ModelAttribute MemberVO memberVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		memberVO = memberService.checkMember(memberVO);
				
		if(BaseUtil.isEmpty(memberVO)){
			resultMap.put("result", "fail");
		}else{
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

		//SessionUtil.
		
		if(!SessionUtil.isAlive()){
			resultMap.put("result", "fail");
		}else{
			resultMap.put("result", "success");
			resultMap.put("account", ret);
			resultMap.put("grade", mem.getGrade());
		}
				
		return resultMap;
	}
	
	@RequestMapping("checkAdminMember.do")
	public @ResponseBody Map<String, Object> checkAdminMember(@ModelAttribute MemberVO memberVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
//		memberVO = memberService.checkAdminMember(memberVO);
				
		if(BaseUtil.isEmpty(memberVO)){
			resultMap.put("result", "fail");
		}else{
			SessionUtil.setAttribute(SessionContants.ADMIN, memberVO);
			SessionUtil.setAttribute("grade", memberVO.getGrade());
			
			resultMap.put("result", "success");
			resultMap.put("grade", memberVO.getGrade());
		}
		return resultMap;
	}
	
	@RequestMapping("checkAdminSession.do")
	public @ResponseBody Map<String, Object> checkAdminSession() throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
			
		Object ret = SessionUtil.getAttribute(SessionContants.ADMIN );
		MemberVO mem = (MemberVO)ret;		
		
		if(!SessionUtil.isAlive()){
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
