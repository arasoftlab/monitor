package seoul.front.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.SessionContants;
import seoul.admin.service.AdminSettingService;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.NoticeVO;
import seoul.member.MemberService;
import seoul.member.MemberVO;
import util.SessionUtil;

@Controller
@RequestMapping("/front/mypage")
public class MypageController {
	
	//@Autowired
	//private NoticeService noticeService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private AdminSettingService adminSettingService;
	
	@RequestMapping("/info/list.do")
	public String list(Model model, @ModelAttribute MemberVO memberVO) throws Exception{

		AdminSettingVO adminSettingVO = new AdminSettingVO();
		adminSettingVO = adminSettingService.getAdminSetting(adminSettingVO);		
		model.addAttribute("a_vo", adminSettingVO);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		if (mem != null)
		{	
			mem.setQuery("id = '"+mem.getId()+"'");
			
			mem = memberService.getMember(mem);

			model.addAttribute("vo", mem);
			
			memberVO.setId(mem.getId());
			
			model.addAttribute("info", memberService.getBackEndMember(memberVO));	
		}
		
		
		return "front/mypage/info/list.default";
	}
	
	@RequestMapping("/info/member_update.do")
	public @ResponseBody Map<String, Object> member_update(@ModelAttribute MemberVO memberVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(memberService.updateMemberETC(memberVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@RequestMapping("/out/out_list.do")
	public String out_list(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{

		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		if (mem != null)
		{	
			mem.setQuery("id = '"+mem.getId()+"'");
			
			mem = memberService.getMember(mem);

			model.addAttribute("vo", mem);
		}
		
		return "front/mypage/out/out_list.default";
	}
	
	@RequestMapping("/out/member_secession.do")
	public @ResponseBody Map<String, Object> member_secession(@ModelAttribute MemberVO memberVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		memberVO.setGrade("secession");
		if(memberService.updateMemberState(memberVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
}
