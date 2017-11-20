package seoul.front.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.SessionContants;
import seoul.admin.service.NoticeService;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;
import util.SessionUtil;

@Controller
@RequestMapping("/front/member")
public class FrontMemberController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("/login/login.do")
	public String login(Model model, @ModelAttribute NoticeVO noticeVO) throws Exception{

		return "front/member/login.default";
	}
	
	@RequestMapping("logout.do")
	public String logout() throws Exception{
		
		return "redirect:/front/main.do";
	}
	
	
}
