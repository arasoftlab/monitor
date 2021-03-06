package seoul.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import seoul.admin.service.AdminSettingService;
import seoul.admin.service.MonitorsService;
//import seoul.admin.service.SubjectService;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.MemberManagerVO;
import seoul.admin.vo.MonitorsMemberVO;
import seoul.member.MemberService;
import seoul.member.MemberVO;

@Controller
@RequestMapping("/admin/monitor/")
public class MonitorController {
	
	//@Autowired
	//private SubjectService subjectService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AdminSettingService adminSettingService;
		
	@Autowired
	private MonitorsService monitorsService;
	
	
	@RequestMapping("grade_apply.do")
	public @ResponseBody Map<String, Object> grade_apply(Model model, 
			@RequestParam(value="select_arr[]") List<String> arrayParams,
			@RequestParam(value="grade") String grade ) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (int i = 0 ; i < arrayParams.size() ; i++)
		{
			MemberVO memberVO = new MemberVO();
			
			memberVO.setId(arrayParams.get(i));
			
			memberVO.setGrade(grade);
			if(!(memberService.updateMemberState(memberVO) > 0)){
				 
				resultMap.put("result", "fail");
				return resultMap;			
			}		
		}
		
	
		resultMap.put("result", "success");
		return resultMap;
		
	}	
	
	@RequestMapping("apply.do")
	public @ResponseBody Map<String, Object> apply(Model model, 
			@RequestParam(value="select_arr[]") List<String> arrayParams,
			@RequestParam(value="secession_disc") String secession_disc ) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (int i = 0 ; i < arrayParams.size() ; i++)
		{
			MemberVO memberVO = new MemberVO();
			
			memberVO.setId(arrayParams.get(i));
			memberVO.setSecession_disc(secession_disc);
			
			memberVO.setGrade("secession");
			if(!(memberService.updateMemberState(memberVO) > 0)){
				 
				resultMap.put("result", "fail");
				return resultMap;			
			}		
		}
		
		resultMap.put("result", "success");
		return resultMap;
		
	}

	
	@RequestMapping("memo.do")
	public @ResponseBody Map<String, Object> memo(Model model, 
			@RequestParam(value="memo") String memo,
			@RequestParam(value="id") String id) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(!ObjectUtils.isEmpty(id)) {
			MemberVO memberVO = new MemberVO();			
			memberVO.setQuery("id='"+ id +"'");
			memberVO = memberService.getMember(memberVO);
			memberVO.setMemo(memo);
			
			if(!(memberService.updateMemberETC(memberVO) > 0)){
				 
				resultMap.put("result", "fail");
				return resultMap;			
			}		
		}
		
		resultMap.put("result", "success");
		return resultMap;
		
	}
	
	/***
	 * EXCEL 다운로드를 위해 vo인자에서 특정 프로퍼티 설정
	 * @param model
	 * @param memberManagerVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute MemberManagerVO memberManagerVO) throws Exception{
		
		AdminSettingVO adminSettingVO = new AdminSettingVO();
		adminSettingVO = adminSettingService.getAdminSetting(adminSettingVO);		
		model.addAttribute("a_vo", adminSettingVO);
		
		memberManagerVO.setPageSize(15);
		//memberManagerVO.setQuery("grade='secession'");
		System.out.println(" 멤버관리 : " + memberManagerVO.toString());		
		/*
		MemberVO memberVO = new MemberVO();
		model.addAttribute("sido_cnt", memberService.getMemberManagerPlaceCnt(memberVO)); 
		*/
		//기수정보가 들어오지 않을때 최초 접근시 기존 값을 기수 어드민 기수 설정값으로 적용
		if(ObjectUtils.isEmpty(memberManagerVO.getPoll_num())) {
			memberManagerVO.setPoll_num(adminSettingVO.getPoll_num());
		}
			
		/*model.addAttribute("sido_cnt", memberService.getMemberManagerCnt(memberManagerVO));
		*/
		model.addAttribute("list", memberService.getMemberManagerlist(memberManagerVO));
		model.addAttribute("vo", memberManagerVO);
				
		System.out.println(" 멤버 페이지  : " + memberManagerVO.toString());
		model.addAttribute("page", memberManagerVO.getPagingVO());
		
		System.out.println(" 멤버 페이지 결과 :" + memberManagerVO.getPagingVO());
		
		return "admin/monitor/list.admin";
	}

	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute MemberManagerVO memberManagerVO) throws Exception{
		
		AdminSettingVO adminSettingVO = new AdminSettingVO();
		adminSettingVO = adminSettingService.getAdminSetting(adminSettingVO);		
		model.addAttribute("a_vo", adminSettingVO);
		
		 
		memberManagerVO.setGrade("secession");
				
		//model.addAttribute("list", memberService.getMemberManagerlist(memberManagerVO));
		List<MemberManagerVO> mVO = memberService.getMemberManagerlist_secession(memberManagerVO);
		
		model.addAttribute("list", mVO);
		
		model.addAttribute("vo", memberManagerVO);				
		model.addAttribute("page", memberManagerVO.getPagingVO());

		return "admin/monitor/view.admin";
	}
	
	
	@RequestMapping("member_view.do")
	public String team_view(Model model, @ModelAttribute MemberVO memberVO) throws Exception{
		
		MemberVO member_get = new MemberVO();
		
		member_get.setQuery("id='"+memberVO.getId()+"'");
		
		model.addAttribute("mem" , memberService.getMember(member_get));
		model.addAttribute("act" , memberService.getMemberAct(memberVO));
		
		memberVO = memberService.getBackEndMember(memberVO);		
		model.addAttribute("vo", memberVO);
		
		return "admin/monitor/member_view.ajax";
	}	
	
	@RequestMapping("info.do")
	public String info(Model model, @ModelAttribute MonitorsMemberVO monitorsVO) throws Exception{
				
		List<MonitorsMemberVO> list;
	
		
		
		monitorsVO.setMember_id(monitorsVO.getMember_id());
		
		monitorsVO.setPoll_num(monitorsVO.getPoll_num());

		MemberVO member_get = new MemberVO();
		
		member_get.setId(monitorsVO.getMember_id());
		member_get.setPoll_num(monitorsVO.getPoll_num());
		member_get.setSubject_id(monitorsVO.getSubject_id());
		
		member_get.setQuery("id='"+monitorsVO.getMember_id()+"'");
		
		model.addAttribute("mem" , memberService.getMember(member_get));
		model.addAttribute("act" , memberService.getMemberAct(member_get));
		
		list = monitorsService.getMonitorsAnE_list(monitorsVO);
		
		monitorsVO.setPageSize(15);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", monitorsVO);				
		model.addAttribute("page", monitorsVO.getPagingVO());
			
		return "admin/monitor/member_monitors.ajax";
	}
}
