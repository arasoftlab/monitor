package seoul.front.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import common.SessionContants;
import seoul.admin.service.AnswersService;
import seoul.admin.service.MonitorsService;
import seoul.admin.service.NoticeService;
import seoul.admin.service.QuestionService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.NoticeVO;
import seoul.admin.vo.QuestionVO;
import seoul.admin.vo.SubjectVO;
import seoul.member.MemberVO;
import util.BaseUtil;
import util.SessionUtil;

@Controller
@RequestMapping("/front/monitoring/monitoring")
public class MonitorMonitorController {
	
	@Autowired
	private SubjectService subjectService;

	@Autowired
	private SubjectInfoService subjectInfoService;
	
	@Autowired
	private MonitorsService monitorsService;
	
	@Autowired
	private AnswersService answersService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		subjectVO.setType("F");
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;

		MonitorsVO monitorsVO = new MonitorsVO();
						
		if (mem == null)
		{				
			subjectVO.setQuery("pay_yn = 'Y' and sysdate > submit_e_date+7 and pay_date is not null");
		}else{
			model.addAttribute("member",mem);
			 
			subjectVO.setQuery("1=1 and NOT sysdate < apply_s_date");
		}
			
		model.addAttribute("list", subjectService.getSubjectList(subjectVO));
		model.addAttribute("vo", subjectVO);
		model.addAttribute("page", subjectVO.getPagingVO());
		return "front/monitor/monitor/list.default";
	}
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
				
		model.addAttribute("vo", subjectInfoService.getSubject(subjectVO));
		
		subjectVO = subjectInfoService.getSubject(subjectVO);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );		
		MemberVO mem = (MemberVO)ret;
		
		MonitorsVO monitorsVO = new MonitorsVO();
		
		List<AnswersVO> answers_list;
		
		if (mem != null)
		{
			monitorsVO.setMember_id(mem.getId());
			monitorsVO.setSubject_id(subjectVO.getSubject_id());
			monitorsVO = monitorsService.getMonitors(monitorsVO);
				
			if (monitorsVO != null)
			{
				model.addAttribute("m_vo" , monitorsVO);
				
				AnswersVO answersVO = new AnswersVO();
				
				answersVO.setMember_id(mem.getId());
				answersVO.setSubject_id(subjectVO.getSubject_id());
				
				model.addAttribute("a_list" , answersService.getAnswerList(answersVO));
				
			}
		}
		
		return "front/monitor/monitor/view.default";
	}
	
	
	@RequestMapping(value="delete.do" , method=RequestMethod.POST)	
	public @ResponseBody Map<String, Object> delete(@ModelAttribute AnswersVO answersVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
				
		if (answersService.deleteAnswers(answersVO) > 0) {
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		
		return resultMap;			
	}
	
}
