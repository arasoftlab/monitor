package seoul.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import seoul.admin.service.AnswersService;
import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionSettingsVO;
import seoul.admin.vo.QuestionVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

@Controller
@RequestMapping("/admin/subject/answer")
public class SubjectAnswerController {
	
	@Autowired
	private SubjectService subjectService;
	
	@Autowired
	private SubjectInfoService subjectInfoService;
	
	@Autowired
	private OptionService 	optionService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	QuestionSettingsService questionSettingsService;
	
	@Autowired
	private AnswersService answersService;
	
	@RequestMapping("view.do")
	public String view(Model model, @ModelAttribute AnswersVO answersVO) throws Exception{
		
		
		SubjectVO subjectVO = new SubjectVO();
		
		subjectVO.setSubject_id(answersVO.getSubject_id());
		
		subjectVO = subjectInfoService.getSubject(subjectVO);		
		
		List<AnswersVO> answers_list = answersService.getAnswerList(answersVO);
		
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
		 
		model.addAttribute("q_list",q_list);
		model.addAttribute("a_list",answers_list);
		
		
		model.addAttribute("list", answersService.getAnswerList(answersVO));
		model.addAttribute("vo", answersVO);
		model.addAttribute("page", answersVO.getPagingVO());
		
		model.addAttribute("s_vo",subjectVO);
		
		model.addAttribute("total_cnt", answersService.getAnswersCnt(answersVO));

		
		return "admin/subjects/answer/view.admin";
	}
	
	@RequestMapping("noanswer.do")
	public String noanswer(Model model, @ModelAttribute AnswersVO answersVO) throws Exception{
		
		List<AnswersVO> temp = answersService.getNoAnswerList(answersVO);
		
		SubjectVO subjectVO = new SubjectVO();
		
		subjectVO.setSubject_id(answersVO.getSubject_id());
		
		subjectVO = subjectInfoService.getSubject(subjectVO);		

		model.addAttribute("s_vo",subjectVO);
		
		model.addAttribute("list", answersService.getNoAnswerList(answersVO));
		model.addAttribute("vo", answersVO);
		model.addAttribute("page", answersVO.getPagingVO());

		model.addAttribute("total_cnt", answersService.getNoAnswersCnt(answersVO));
		
		return "admin/subjects/answer/noanswer.admin";
	}
}
