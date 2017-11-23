package seoul.front.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import common.SessionContants;
import seoul.admin.service.MonitorsService;
import seoul.admin.vo.MonitorsMemberVO;
import seoul.member.MemberVO;
import util.SessionUtil;

@Controller
@RequestMapping("/front/mypage")
public class MypageHistoryController {
	
	//@Autowired
	//private NoticeService noticeService;
	
	//@Autowired
	//private	SubjectService subjectService;
	
	@Autowired
	private	MonitorsService monitorsService;
	
	@RequestMapping("/history/list.do")
	public String list(Model model, @ModelAttribute MonitorsMemberVO monitorsVO) throws Exception{
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		List<MonitorsMemberVO> list;
		
		if (mem != null)
		{			
			monitorsVO.setMember_id(mem.getId());
		
			monitorsVO.setPoll_num(mem.getPoll_num());
			
			list = monitorsService.getMonitorsMember(monitorsVO);
			
			model.addAttribute("list", list);
		}
				
		model.addAttribute("vo", monitorsVO);
		model.addAttribute("page", monitorsVO.getPagingVO());
		return "front/mypage/history/list.default";
	}
	

	
}
