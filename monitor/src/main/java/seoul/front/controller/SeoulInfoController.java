package seoul.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import seoul.admin.service.AdminSettingService;
import seoul.admin.vo.AdminSettingVO;
import seoul.admin.vo.NoticeVO;

@Controller
@RequestMapping("/front/info")
public class SeoulInfoController {
	
	//@Autowired
	//private NoticeService noticeService;
	
	@Autowired
	private AdminSettingService adminSettingService;
	
	
	@RequestMapping("/join/join_list.do")
	public String join_list(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		return "front/info/join/join_list.default";
	}
	@RequestMapping("/join/join_view.do")
	public String join_view(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		AdminSettingVO adminSettingVO = new AdminSettingVO();
		
		adminSettingVO = adminSettingService.getAdminSetting(adminSettingVO);
		
		model.addAttribute("vo", adminSettingVO);
		
		return "front/info/join/join_view.default";
	}
	
	@RequestMapping("/join/info_list.do")
	public String info_list(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		return "front/info/join/info_list.default";
	}
	
	@RequestMapping("/institution/view.do")
	public String institution(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		return "front/info/view/institution.default";
	}
	
	@RequestMapping("/monitor_role/view.do")
	public String monitor_role(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		return "front/info/view/monitor_role.default";
	}
	@RequestMapping("/monitor_activity/view.do")
	public String monitor_activity(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		return "front/info/view/monitor_activity.default";
	}
	@RequestMapping("/notice/view.do")
	public String notice(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{
		return "front/info/view/notice.default";
	}
	
	
}
