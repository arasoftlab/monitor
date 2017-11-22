package seoul.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import seoul.admin.service.SubjectService;
import seoul.admin.vo.SubjectVO;

@Controller
@RequestMapping("/admin/subject/")
public class SubjectController {
	
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		model.addAttribute("list", subjectService.getSubjectList(subjectVO));
		model.addAttribute("vo", subjectVO);
		model.addAttribute("page", subjectVO.getPagingVO());
		return "admin/subjects/list.admin";
	}
	
	
}
