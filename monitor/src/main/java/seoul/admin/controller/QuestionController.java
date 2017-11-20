package seoul.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hdf.extractor.NewOleFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionSettingsVO;
import seoul.admin.vo.QuestionVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

@Controller
@RequestMapping("/admin/subject/mng/question/")
public class QuestionController {

	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private SubjectInfoService subjectInfoService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private OptionService optionService;
	
	@Autowired
	private QuestionSettingsService questionSettingsService;
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute QuestionVO questionVO) throws Exception{
		model.addAttribute("vo", questionVO);
		model.addAttribute("list", questionService.getQuestionList(questionVO));
		return "admin/subjects/mng/question/list.ajax";
	}
	
	@RequestMapping("modify.do")
	public String modify(Model model, @ModelAttribute QuestionVO questionVO) throws Exception{
		questionVO = questionService.getQuestion(questionVO);
		model.addAttribute("vo", questionVO);
		
		// option 리스트각 하나당 갖고있는 이미지를 객체에 다시 할당하여 넣어준다.
		List <OptionVO> optionList = optionService.getOptionList(new OptionVO(questionVO.getQuestion_id()));

		for (int i=0 ; i < optionList.size() ; i++)
		{
			optionList.set(i, optionService.getOption(optionList.get(i)));   
		}
		
		model.addAttribute("optionList", optionList);
		
		// 옵션 첨부는 동영상 / 이미지 두가지 방식이기때문에 가져올때 분기한다.
		if (questionVO.getCont_type() != null)
		{
			if (questionVO.getCont_type().indexOf('V') == 0 || questionVO.getCont_type().indexOf('I') == 0) 
			{
				List <QuestionSettingsVO> settingsList = questionSettingsService.getQuestionSettingsList(new QuestionSettingsVO(questionVO.getQuestion_id() , questionVO.getCont_type()));

				for (int i=0 ; i < settingsList.size() ; i++)
				{
					settingsList.set(i, questionSettingsService.getQuestionSettings(settingsList.get(i)));   
				}
				
				model.addAttribute("settingsList", settingsList);
			}
		}
		
		model.addAttribute("prevSQuestionList", questionService.getPrevSQuestionList(questionVO));
		return "admin/subjects/mng/question/"+questionVO.getType()+".ajax";
	}

	@RequestMapping("start.do")
	public String start(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		
		model.addAttribute("vo", subjectInfoService.getSubject(subjectVO));

		QuestionVO questionVO = new QuestionVO();
		questionVO.setSubject_id(subjectVO.getSubject_id());
		
		List<QuestionVO> q_list = questionService.getQuestionList(questionVO);
		
		for (int i = 0 ; i < q_list.size() ; i++ )
		{
			// option 리스트각 하나당 갖고있는 이미지를 객체에 다시 할당하여 넣어준다.
			List <OptionVO> optionList = optionService.getOptionList(new OptionVO(q_list.get(i).getQuestion_id()));
	
			for (int j =0 ; j < optionList.size() ; j++)
			{
				optionList.set(j, optionService.getOption(optionList.get(j)));   
			}
			
			model.addAttribute("optionList", optionList);

			List <QuestionSettingsVO> settingsList = questionSettingsService.getQuestionSettingsList(new QuestionSettingsVO(q_list.get(i).getQuestion_id() , q_list.get(i).getCont_type()));
			
			// 옵션 첨부는 동영상 / 이미지 두가지 방식이기때문에 가져올때 분기한다.
			if (questionVO.getCont_type() != null)
			{
				if (questionVO.getCont_type().indexOf('V') == 0 || questionVO.getCont_type().indexOf('I') == 0) 
				{

	
					for (int z=0 ; z < settingsList.size() ; z++)
					{
						settingsList.set(z, questionSettingsService.getQuestionSettings(settingsList.get(z)));   
					}
					
					model.addAttribute("settingsList", settingsList);
					

				}
			}
			
			q_list.get(i).setQuestionSettingsVO(settingsList);			
			q_list.get(i).setOptionVO(optionList);

		}
		
		model.addAttribute("q_list" ,q_list);
		
		return "admin/subjects/mng/mng_cont.ajax";
	}
	
	@RequestMapping("end.do")
	public String end(Model model, @ModelAttribute SubjectVO subjectVO) throws Exception{
		model.addAttribute("vo", subjectInfoService.getSubject(subjectVO));
		return "admin/subjects/mng/question/END.ajax";
	}
	@RequestMapping("insert.do")
	public @ResponseBody Map<String, Object> insert(@ModelAttribute QuestionVO questionVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		if(questionService.insertQuestion(questionVO) > 0){
			resultMap.put("result", "success");
			questionVO = questionService.getQuestion(questionVO);
			resultMap.put("question", questionVO);
			
		}else{
			resultMap.put("result", "fail");
		}		
		
		return resultMap;
	}
	@RequestMapping(value="update.do" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(@ModelAttribute QuestionVO questionVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		QuestionVO question_uuid = questionService.getQuestion(questionVO);
		
		questionVO.setCont_uuid(question_uuid.getCont_uuid());
		
		if(questionService.updateQuestion(questionVO) > 0){
			if(!BaseUtil.isEmpty(questionVO.getOptionVO())){
				for(OptionVO optionVO : questionVO.getOptionVO()){
					optionService.updateOption(optionVO);
				}
			}
			if(!BaseUtil.isEmpty(questionVO.getQuestionSettingsVO()))
			{
				for(QuestionSettingsVO questionSettingsVO : questionVO.getQuestionSettingsVO()){
					questionSettingsService.updateQuestionSettings(questionSettingsVO);
				}
			}
			
			resultMap.put("result", "success");
			resultMap.put("question", questionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	@RequestMapping("delete.do")
	public @ResponseBody Map<String, Object> delete(@ModelAttribute QuestionVO questionVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(questionService.deleteQuestion(questionVO) > 0){
			resultMap.put("result", "success");
			resultMap.put("question", questionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	@RequestMapping("move.do")
	public @ResponseBody Map<String, Object> move(@ModelAttribute QuestionVO questionVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(questionService.moveQuestion(questionVO) > 0){
			resultMap.put("result", "success");
			resultMap.put("question", questionVO);
		}else{
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	@RequestMapping("copy.do")
	public @ResponseBody Map<String, Object> copy(@ModelAttribute QuestionVO questionVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		questionVO = questionService.getQuestion(questionVO);
		
		// 퀘스쳔 VO 가 깊은 복사 개념이라 인서트 함수에 들어가는순간 IDX 값이 바뀌어서 나온다. 
		// 따라서 이전 options / question_setting 값을 들고 올라면 오리지날 IDX 를 따로 저장해야한다. 
		String original_qID = questionVO.getQuestion_id();
		
		if(questionService.insertQuestion(questionVO) > 0){
			
			List <OptionVO> optionList = optionService.getOptionList(new OptionVO(original_qID));	
			
			for (int i= 0 ; i < optionList.size() ; i++)
			{
				optionList.get(i).setQuestion_id(questionVO.getQuestion_id());
				optionService.insertOption(optionList.get(i));
			}
			
			
			resultMap.put("result", "success");
			questionVO = questionService.getQuestion(questionVO);
			resultMap.put("question", questionVO);
			
		}else{
			resultMap.put("result", "fail");
		}				
		
		/*
		if(questionService.insertQuestion(questionVO) > 0){
			resultMap.put("result", "success");
			questionVO = questionService.getQuestion(questionVO);
			resultMap.put("question", questionVO);
			
		}else{
			resultMap.put("result", "fail");
		}		
		*/
		return resultMap;
	}
}
