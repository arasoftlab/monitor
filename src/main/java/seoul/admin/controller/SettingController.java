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

import common.AES256Cipher;
import seoul.admin.service.AdminSettingService;
import seoul.admin.vo.AdminMemberVO;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.SubjectVO;
import seoul.member.MemberService;
import seoul.member.MemberVO;


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
				
		AdminMemberVO memberVO = new AdminMemberVO();
		
		List<AdminMemberVO> list = adminSettingService.getAdminList(memberVO);
		
		System.out.println("관리자 정보 확인 : " + list.toString());
		
		model.addAttribute("list", list);
		model.addAttribute("vo", memberVO);
		model.addAttribute("page", memberVO.getPagingVO());
		
		return "admin/setting/info.admin";
	}
	
	@RequestMapping("detail.do")
	public String detail(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
				
		AdminMemberVO memberVO = new AdminMemberVO();
		
		AdminMemberVO list = adminSettingService.getAdminMember(memberVO);
		
		model.addAttribute("admin", list);
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

	@RequestMapping("adminModify.do")
	public String adminModify(Model model, @ModelAttribute AdminMemberVO aVO ) throws Exception{
		
		System.out.println(" 작업전 관리자 정보 : " + aVO);
		
		if(aVO.getId() != "") {
			aVO = adminSettingService.getAdminMember(aVO);
		}
		model.addAttribute("vo", aVO);
		
		return "admin/setting/modify.ajax";
	}
	
	@RequestMapping("createAdmin.do")
	public @ResponseBody Map<String, Object> createAdmin(Model model, @ModelAttribute AdminMemberVO aVO) throws Exception{
		
		System.out.println(aVO.toString());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String pswd = AES256Cipher.AES_Encode(aVO.getPassword());
		aVO.setPassword(pswd);
		
		System.out.println(aVO.toString());
		
		if (!(adminSettingService.createAdminMember(aVO) > 0))
		{
			resultMap.put("result", "fail");
		}else{
			resultMap.put("result", "success");
		}
		
		return resultMap;
	}

	@RequestMapping("updateAdmin.do")
	public @ResponseBody Map<String, Object> updateAdmin(Model model, @ModelAttribute AdminMemberVO aVO) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String pswd = AES256Cipher.AES_Encode(aVO.getPassword());
		aVO.setPassword(pswd);
		
		if (!(adminSettingService.updateAdminMember(aVO) > 0))
		{
			resultMap.put("result", "fail");
		}else{
			resultMap.put("result", "success");
		}
		
		return resultMap;
	}
	
	@RequestMapping("deleteAdmin.do")
	public @ResponseBody Map<String, Object> deleteAdmin(Model model,
			@RequestParam(value="id[]") List<String> ids
			) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (int i = 0 ; i < ids.size() ; i++)
		{
			AdminMemberVO aVO = new AdminMemberVO();
			
			String pam[] = ids.get(i).split("_");
			
			aVO.setId(pam[0]);
			
			if (!(adminSettingService.deleteAdminMember(aVO) > 0))
			{
				resultMap.put("result", "fail");
			}else{
				resultMap.put("result", "success");
			}
			
		}
		
		return resultMap;
	}
	
	
}
