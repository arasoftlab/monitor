package seoul.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import seoul.admin.service.SubjectInfoService;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

@Controller
@RequestMapping("/admin/subject/info/")
public class SubjectInfoController {
	
	@Autowired
	private SubjectInfoService subjectInfoService;
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		if (subjectVO.getSubject_id().equals(""))
		{
			
		}
		else
		{
			model.addAttribute("vo", subjectInfoService.getSubject(subjectVO));
		}
		
		return "admin/subjects/info/view.admin";
	}
	
	@RequestMapping("modify.do")
	public String modify(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		
		if(!BaseUtil.isEmpty(subjectVO.getSubject_id())){
			subjectVO = subjectInfoService.getSubject(subjectVO);
		}
		
		model.addAttribute("vo", subjectVO);
		model.addAttribute("data_id" , subjectVO.getCont_uuid());
		
		
		return "admin/subjects/info/modify.admin";
	}
	
	@RequestMapping("save.do")
	public @ResponseBody Map<String, Object> save(@ModelAttribute SubjectVO subjectVO, BindingResult result) throws Exception{
		
		if(result.hasErrors()){
			for(ObjectError error: result.getAllErrors()){
				System.out.println(error.getCode());
			}
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(subjectInfoService.saveSubject(subjectVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@RequestMapping("delete.do")
	public @ResponseBody Map<String, Object> delete(@ModelAttribute SubjectVO subjectVO , BindingResult result) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//int i = 0;
				
		if(subjectInfoService.deleteSubject(subjectVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		
		
		
		return resultMap;
	}
}
