package seoul.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/*import com.mysql.jdbc.log.Log4JLogger;*/



import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionSettingsVO;
import seoul.admin.vo.QuestionVO;
import seoul.admin.vo.SubjectVO;

@Controller
@RequestMapping("/admin/subject/test/")
public class SubjectTestController {
	
	
	@Autowired
	private SubjectInfoService subjectInfoService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private OptionService optionService;
	
	@Autowired
	private QuestionSettingsService 	questionSettingsService;
	

	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute QuestionVO questionVO , SubjectVO subjectVO) throws Exception{
		//model.addAttribute("vo", questionVO);

		//List<QuestionVO> list =  questionService.getQuestionList(questionVO);
		System.out.println(questionVO.toString());
		System.out.println(subjectVO.toString());
		
		model.addAttribute("list", questionService.getQuestionList(questionVO));
		model.addAttribute("headertitle", subjectInfoService.getSubject(subjectVO));
		
		return "admin/subjects/test/list.admintestform";
	}
	
 
	public String questionArrMaker(QuestionVO questionVO)
	{
 
		
		return ""+"|" ;
	}
	
	public String answerMaker(String answer)
	{
 
		String retText = "@";
		
		String temp[] = answer.split("&");
		
		temp[0] = temp[0].replace("type=", "");
		temp[1] = temp[1].replace("q_num=", "");
 
		temp[2] = temp[2].replace("answers=", ":");
		temp[3] = temp[3].replace("desText=", "");
		
		
		for (int i = 0; i < temp.length-1 ; i ++)
		{			
 
			retText += temp[i]; 
		}
 
		return retText + "|";
	}
	
	@RequestMapping(value="previewpage.do" , method=RequestMethod.POST)
	public String previewpage(Model model, 
			@ModelAttribute QuestionVO fromQuestionVO,
			@RequestParam(value="history_arr", defaultValue="") String history_arr,
			@RequestParam(value="back_num", defaultValue="") int back_num) throws Exception{
		
		
		fromQuestionVO = questionService.getQuestion(fromQuestionVO);
		
		System.out.println("JINX11");		

		System.out.println(history_arr);
		
		
		QuestionVO previewQuestionVO = new QuestionVO();
		
		System.out.println("JINX11");
		System.out.println(back_num);
		
		previewQuestionVO.setNext_num(back_num);
		previewQuestionVO.setSubject_id(fromQuestionVO.getSubject_id());
		System.out.println("JINX22");
 
		previewQuestionVO = questionService.getNextQuestion(previewQuestionVO);
		
		System.out.println("JINX33");
		System.out.println(previewQuestionVO.getQuestion_id());
		
		
		model.addAttribute("vo" , previewQuestionVO);
		model.addAttribute("nextpage" , questionService.getQuestion(fromQuestionVO));
		model.addAttribute("history_arr" , history_arr);
 
		List <OptionVO> optionList = optionService.getOptionList(new OptionVO(previewQuestionVO.getQuestion_id()));

		for (int i=0 ; i < optionList.size() ; i++)
		{
			optionList.set(i, optionService.getOption(optionList.get(i)));   
		}
		
		model.addAttribute("optionList", optionList);

		if (previewQuestionVO.getCont_type() != null)
		{
			if (previewQuestionVO.getCont_type().indexOf('V') == 0 || previewQuestionVO.getCont_type().indexOf('I') == 0) 
			{
				List <QuestionSettingsVO> settingsList = questionSettingsService.getQuestionSettingsList(new QuestionSettingsVO(previewQuestionVO.getQuestion_id() , previewQuestionVO.getCont_type()));

				for (int i=0 ; i < settingsList.size() ; i++)
				{
					settingsList.set(i, questionSettingsService.getQuestionSettings(settingsList.get(i)));   
				}
				
				model.addAttribute("settingsList", settingsList);
			}
		}
		
		
		
		return "admin/subjects/test/"+previewQuestionVO.getType()+".ajax";
	}
	
	@RequestMapping(value="nextpage.do" , method=RequestMethod.POST)
	public String nextpage(Model model, 
			@ModelAttribute QuestionVO questionVO,
			@RequestParam(value="history_arr", defaultValue="") String history_arr,
			@RequestParam(value="params", defaultValue="") String params , 
			@RequestParam(value="bifurcation", defaultValue="") int bifurcation) throws Exception{
		
		if (!params.isEmpty()) 
		{
//			System.out.println(answerMaker(params));		

			System.out.println("jinx2016");
			System.out.println(params);
		}
				
		questionVO = questionService.getQuestion(questionVO);
/*		
		OptionVO optionVO = new OptionVO();		
		
		optionVO.setQuestion_id(questionVO.getSubject_id()); 
*/		
		
		QuestionVO nextQuestionVO = new QuestionVO();
		
		System.out.println("JINX55");
		System.out.println(bifurcation);
		//String str ="";
		
		if (bifurcation != 0)
		{
			if ( bifurcation == 2016)
			{
				questionVO.setType("END");
			}
			else{		
				questionVO.setNext_num(bifurcation);
				questionVO = questionService.getNextQuestion(questionVO);

				nextQuestionVO.setNext_num(questionVO.getNext_num());
				nextQuestionVO.setSubject_id(questionVO.getSubject_id());	
				nextQuestionVO = questionService.getNextQuestion(nextQuestionVO);
				
			}
		}
		else {
			nextQuestionVO.setNext_num(questionVO.getNext_num());
			nextQuestionVO.setSubject_id(questionVO.getSubject_id());	
			nextQuestionVO = questionService.getNextQuestion(nextQuestionVO);
		}

		
		/*
		if (nextQuestionVO == null)
		{
			System.out.println("123");
			questionVO.setType("END");			
		}
		 */
		
		model.addAttribute("vo" , questionVO);
		model.addAttribute("nextpage" , nextQuestionVO);
		model.addAttribute("history_arr" , history_arr);
 
		List <OptionVO> optionList = optionService.getOptionList(new OptionVO(questionVO.getQuestion_id()));

		for (int i=0 ; i < optionList.size() ; i++)
		{
			optionList.set(i, optionService.getOption(optionList.get(i)));   
		}
		
		model.addAttribute("optionList", optionList);
		
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
						
		//model.addAttribute("data", questionService.getQuestion(questionVO));
		
		return "admin/subjects/test/"+questionVO.getType()+".ajax";
		//return "admin/subjects/test/S.ajax";
	}
	
}
