package seoul.admin.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import seoul.admin.service.MonitorApplyService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.SubjectVO;
//import util.BaseUtil;

@Controller
@RequestMapping("/admin/subject/money")
public class SubjectMoneyController {
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private SubjectInfoService subjectinfoService;
	
	@Autowired
	private MonitorApplyService monitorApplyService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute MonitorApplyVO monitorApplyVO) throws Exception{
		
		monitorApplyVO.setQuery("subject_id = '"+monitorApplyVO.getSubject_id()+"'");
		
		List<MonitorApplyVO> list = monitorApplyService.getMonitorApplyList(monitorApplyVO);
		
		SubjectVO subjectVO  = new SubjectVO();
		
		subjectVO.setSubject_id(monitorApplyVO.getSubject_id());
		
		model.addAttribute("s_vo" , subjectinfoService.getSubject(subjectVO));
		
		model.addAttribute("list" , list);				
		model.addAttribute("vo", monitorApplyVO);
		model.addAttribute("page", monitorApplyVO.getPagingVO());

		return "admin/subjects/money/s_list.admin";
	}
	
	
	@RequestMapping("all_list.do")
	public String all_list(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		
		List<SubjectVO> list = subjectService.getSubjectMoneyList(subjectVO);
		
		model.addAttribute("list2", list);
		model.addAttribute("list" , subjectService.getSubjectMoneyList(subjectVO));
				
		model.addAttribute("vo", subjectVO);
		model.addAttribute("page", subjectVO.getPagingVO());

		return "admin/subjects/money/list.admin";
	}
	
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		
		
		model.addAttribute("list", subjectService.getSubjectList(subjectVO));
		model.addAttribute("vo", subjectVO);
		model.addAttribute("page", subjectVO.getPagingVO());

		return "admin/subjects/money/view.admin";
	}
}
