package seoul.admin.controller;

import java.util.HashMap;
//import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import seoul.admin.service.OptionService;
//import seoul.admin.service.QuestionService;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.service.SubjectService;
//import seoul.admin.vo.OptionVO;
//import seoul.admin.vo.QuestionSettingsVO;
//import seoul.admin.vo.QuestionVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

@Controller
@RequestMapping("/admin/subject/mng/")
public class SubjectMngController {
	
	@Autowired
	private SubjectInfoService subjectInfoService;
	
	//@Autowired
	//private QuestionService questionService;
	
	//@Autowired
	//private OptionService 	optionService;
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	QuestionSettingsService questionSettingsService;
	
	
	@RequestMapping("movelist.do")
	public String movelist(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		
		model.addAttribute("list", subjectService.getSubjectList(subjectVO));
		model.addAttribute("vo", subjectVO);
		
		return "admin/subjects/mng/movelist.admin";
	}
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		
		model.addAttribute("vo", subjectInfoService.getSubject(subjectVO));
		

		
		return "admin/subjects/mng/view.admin";
	}

	@RequestMapping(value= "updateEnd.do" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateEnd(@ModelAttribute SubjectVO subjectVO ,
			@RequestParam(value="close_comment", required=false) String close_comment) throws Exception{
		
		System.out.println(subjectVO.getSubject_id());
		System.out.println(subjectVO.getClose_comment());
	
		if(!BaseUtil.isEmpty(subjectVO.getSubject_id())){
			//optionService.updateOption(optionVO);			
			subjectVO = subjectInfoService.getSubject(subjectVO);
			subjectVO.setClose_comment(close_comment);
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(subjectInfoService.saveSubject(subjectVO) > 0){
			
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@RequestMapping("updateStart.do")
	public @ResponseBody Map<String, Object> updateStart(@ModelAttribute SubjectVO subjectVO ,
			@RequestParam(value="description", required=false) String description) throws Exception{
		
	
		if(!BaseUtil.isEmpty(subjectVO.getSubject_id())){
			//optionService.updateOption(optionVO);			
			subjectVO = subjectInfoService.getSubject(subjectVO);
			subjectVO.setDescription(description);
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(subjectInfoService.saveSubject(subjectVO) > 0){
			
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	/*@RequestMapping("question1.do")
	public String question1(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		model.addAttribute("vo", subjectVO);
		return "admin/subjects/mng/question1.admin";
	}*/	
}
