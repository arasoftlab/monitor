package seoul.front.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import seoul.admin.vo.NoticeVO;

@Controller
@RequestMapping("/front/member")
public class FrontMemberController {
	
	//@Autowired
	//private NoticeService noticeService;
	
	@RequestMapping("/login/login.do")
	public String login(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{

		return "front/member/login.default";
	}
	
	@RequestMapping("logout.do")
	public String logout() throws Exception{
		
		return "redirect:/front/main.do";
	}
	
	
}
