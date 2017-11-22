package seoul.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import seoul.admin.service.AdminSettingService;
//import seoul.admin.service.SubjectService;
import seoul.admin.vo.AdminSettingVO;
//import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.SubjectVO;
import seoul.member.MemberService;
import seoul.member.MemberVO;
//import util.BaseUtil;

@Controller
@RequestMapping("/admin/setting/")
public class SettingController {
	
	//@Autowired
	//private SubjectService subjectService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private AdminSettingService adminSettingService;
	
	@RequestMapping("admin_setting.do")
	public String admin_setting(Model model) throws Exception{
		
		AdminSettingVO adminSettingVO = new AdminSettingVO();		
		adminSettingVO = adminSettingService.getAdminSetting(adminSettingVO);
		
		model.addAttribute("vo", adminSettingVO);
		
		return "admin/setting/admin_setting.admin";
	}
	
	@RequestMapping("setting_apply.do")
	public @ResponseBody Map<String, Object> setting_apply(Model model,@ModelAttribute AdminSettingVO adminSettingVO ) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if (!(adminSettingService.updateAdminSetting(adminSettingVO) > 0))
		{
			resultMap.put("result", "fail");
		}else{
			resultMap.put("result", "success");
		}
		
		return resultMap;
	}	
	
	
	@RequestMapping("info.do")
	public String info(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
				
		MemberVO memberVO = new MemberVO();
		
		memberVO.setQuery("grade='admin' ");
		
		List<MemberVO> list =  memberService.getMemberList(memberVO);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", subjectVO);
		model.addAttribute("page", subjectVO.getPagingVO());
		
		return "admin/setting/info.admin";
	}
	
	
	@RequestMapping("update.do")
	public @ResponseBody Map<String, Object> update(Model model,@ModelAttribute MemberVO memberVO ) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
			
		if (!(memberService.updateMember(memberVO) > 0))
		{
			resultMap.put("result", "fail");
		}else{
			resultMap.put("result", "success");
		}
		return resultMap;		
	}
	
	@RequestMapping("insert.do")
	public @ResponseBody Map<String, Object> insert(Model model,@ModelAttribute MemberVO memberVO ) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberVO chk = new MemberVO();
		
		chk.setQuery("id='"+memberVO.getId()+"'");
		
		chk = memberService.getMember(chk);
		
		if (chk != null)
		{
			resultMap.put("result", "duplicate");
			return resultMap;		
		}
		
		if (!(memberService.insertMember(memberVO) > 0))
		{
			resultMap.put("result", "fail");
		}else{
			resultMap.put("result", "success");
		}
		
		return resultMap;		
	}

	@RequestMapping("apply.do")
	public String apply(Model model) throws Exception{
		return "admin/setting/insert.ajax";
	}
	
	@RequestMapping("delete.do")
	public @ResponseBody Map<String, Object> delete(Model model, 
			@RequestParam(value="select_arr[]") List<String> arrayParams )throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (int i = 0 ; i < arrayParams.size() ; i++)
		{
			MemberVO memberVO = new MemberVO();
			
			memberVO.setId(arrayParams.get(i));
			
			if (!(memberService.deleteMember(memberVO) > 0))
			{
				// 한번이라도 업데이트가 실패하면 실패를 리턴함.
				resultMap.put("result", "fail");
				return resultMap;
			}
		}
		
		resultMap.put("result", "success");
		return resultMap;
		
	}
	
	@RequestMapping("modify.do")
	public String modify(Model model, @RequestParam(value="member_id") String member_id) throws Exception{
				
		MemberVO memberVO = new MemberVO();
		
		if (member_id != "")
		{
			memberVO.setQuery("id='"+ member_id +"'" );
			memberVO = memberService.getMember(memberVO);
		}
		
		model.addAttribute("vo", memberVO);
		
		return "admin/setting/modify.ajax";
	}
}
