package seoul.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import seoul.admin.service.QuestionService;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.vo.QuestionSettingsVO;
import seoul.admin.vo.QuestionVO;
import util.BaseUtil;

@Controller
@RequestMapping("/admin/subject/mng/questionsettings/")
public class QuestionSettingsController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private QuestionSettingsService questionSettingsService;
	
	@RequestMapping(value = "insert.do" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insert(@ModelAttribute QuestionVO questionVO ) throws Exception{
		
		if(!BaseUtil.isEmpty(questionVO.getQuestionSettingsVO())){
			for(QuestionSettingsVO QuestionSettingsVO : questionVO.getQuestionSettingsVO()){
				questionSettingsService.updateQuestionSettings(QuestionSettingsVO);
			}
		}
		
		questionService.updateQuestion(questionVO);
		
		QuestionSettingsVO	questionSettingsVO = new QuestionSettingsVO(questionVO.getQuestion_id());
		
		System.out.println("JINX11");
		System.out.println(questionVO.getCont_type());
		
		questionSettingsVO.setType(questionVO.getCont_type());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(questionSettingsService.insertQuestionSettings(questionSettingsVO) > 0){
			
			resultMap.put("result", "success");
			resultMap.put("question", questionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
	
	@RequestMapping("delete.do")
	public @ResponseBody Map<String, Object> delete(@ModelAttribute QuestionSettingsVO QuestionSettingsVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(questionSettingsService.deleteQuestionSettings(QuestionSettingsVO) > 0){
			resultMap.put("result", "success");
			resultMap.put("option", QuestionSettingsVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@RequestMapping("clear.do")
	public @ResponseBody Map<String, Object> clear(@ModelAttribute QuestionVO questionVO ) throws Exception{
		/*
		if(!BaseUtil.isEmpty(questionVO.getQuestionSettingsVO())){
			for(QuestionSettingsVO QuestionSettingsVO : questionVO.getQuestionSettingsVO()){
				optionService.updateOption(QuestionSettingsVO);
			}
		}
		*/
		QuestionSettingsVO	QuestionSettingsVO = new QuestionSettingsVO(questionVO.getQuestion_id());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(questionSettingsService.clearQuestionSettings(QuestionSettingsVO) > 0){
			
			resultMap.put("result", "success");
			resultMap.put("question", questionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}
	
	@RequestMapping("move.do")
	public @ResponseBody Map<String, Object> move(@ModelAttribute QuestionSettingsVO QuestionSettingsVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(questionSettingsService.moveQuestionSettings(QuestionSettingsVO) > 0){
			resultMap.put("result", "success");
			resultMap.put("option", QuestionSettingsVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
}
