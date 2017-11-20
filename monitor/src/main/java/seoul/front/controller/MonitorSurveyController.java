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
import seoul.admin.service.SubjectService;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.SubjectVO;
import seoul.member.MemberVO;
import util.BaseUtil;
import util.SessionUtil;

@Controller
@RequestMapping("/front/monitoring/survey")
public class MonitorSurveyController {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		subjectVO.setType("V");
		/*
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
				
		if (mem == null)
		{				
			subjectVO.setQuery("pay_yn = 'Y' and sysdate > submit_e_date+7 and pay_date is not null");
		}*/
		
		subjectVO.setQuery("1=1 and NOT sysdate < apply_s_date");
		
		model.addAttribute("list", subjectService.getSubjectList(subjectVO));
		model.addAttribute("vo", subjectVO);
		model.addAttribute("page", subjectVO.getPagingVO());
		
		return "front/monitor/survey/list.default";
	}
	
}
