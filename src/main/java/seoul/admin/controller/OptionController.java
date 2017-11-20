package seoul.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionVO;
import util.BaseUtil;

@Controller
@RequestMapping("/admin/subject/mng/option/")
public class OptionController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private OptionService optionService;
	
	@RequestMapping(value = "insert.do" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insert(@ModelAttribute QuestionVO questionVO ) throws Exception{
		
		if(!BaseUtil.isEmpty(questionVO.getOptionVO())){
			for(OptionVO optionVO : questionVO.getOptionVO()){
				optionService.updateOption(optionVO);
			}
		}
		
		questionService.updateQuestion(questionVO);
		
		OptionVO	optionVO = new OptionVO(questionVO.getQuestion_id());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(optionService.insertOption(optionVO) > 0){
			
			resultMap.put("result", "success");
			resultMap.put("question", questionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
	// 척도형 인서트 
	@RequestMapping(value = "insertR.do" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insertR(@ModelAttribute QuestionVO questionVO ,@RequestParam(value="form", required=false) int form) throws Exception{
		
		if(!BaseUtil.isEmpty(questionVO.getOptionVO())){
			for(OptionVO optionVO : questionVO.getOptionVO()){
				optionService.updateOption(optionVO);
			}
		}

		questionService.updateQuestion(questionVO);
		
		OptionVO optionVO;
		
		if (form > 0) 
			optionVO = new OptionVO(questionVO.getQuestion_id() ,form );
		else
			optionVO = new OptionVO(questionVO.getQuestion_id());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(optionService.insertOption(optionVO) > 0){
			
			resultMap.put("result", "success");
			resultMap.put("question", questionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
	
	@RequestMapping("delete.do")
	public @ResponseBody Map<String, Object> delete(@ModelAttribute OptionVO optionVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(optionService.deleteOption(optionVO) > 0){
			resultMap.put("result", "success");
			resultMap.put("option", optionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@RequestMapping("clear.do")
	public @ResponseBody Map<String, Object> clear(@ModelAttribute QuestionVO questionVO ) throws Exception{
		/*
		if(!BaseUtil.isEmpty(questionVO.getOptionVO())){
			for(OptionVO optionVO : questionVO.getOptionVO()){
				optionService.updateOption(optionVO);
			}
		}
		*/
		OptionVO	optionVO = new OptionVO(questionVO.getQuestion_id());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(optionService.clearOption(optionVO) > 0){
			
			resultMap.put("result", "success");
			resultMap.put("question", questionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}
	
	@RequestMapping("move.do")
	public @ResponseBody Map<String, Object> move(@ModelAttribute OptionVO optionVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(optionService.moveOption(optionVO) > 0){
			resultMap.put("result", "success");
			resultMap.put("option", optionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
