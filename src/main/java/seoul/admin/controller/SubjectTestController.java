package seoul.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//import org.json.simple.parser.ParseException;

/*import com.mysql.jdbc.log.Log4JLogger;*/



import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.service.SubjectInfoService;
//import seoul.admin.service.SubjectService;
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

		List<QuestionVO> list =  questionService.getQuestionList(questionVO);
		
		model.addAttribute("list2", list);
		model.addAttribute("list", questionService.getQuestionList(questionVO));
		model.addAttribute("headertitle", subjectInfoService.getSubject(subjectVO));
		
		return "admin/subjects/test/list.testform";
	}
	
	/******************************************
	 * 
	 * 작성자 :JINX
	 * 함수용도 : 테스트리스트 페이지의 다음 항목으로 이동하는데 사용됨.
	 * 특이사항 : 
	 *        - 해당 함수안에서 [질의응답]테이블에 대한 insert or update 가 일어남.
	 *        - 이미 저장된 질의응답 자료를 select 문을 사용해 VO 형태를 가져온다.
	 *        - 비교문을 통해 8가지 유형의 조건을 본다.
	 *        - 
	********************************************/
		
	public String questionArrMaker(QuestionVO questionVO)
	{
		// subject_id를 사용하여 select 질의를 날려서 찾아야함.
		// 위 객체안에 subject_id 값은 들어있다. 
		// 질의어는 where subject_id and member_id
		// 
		
		//String retText = "";
		
		return ""+"|" ;
	}
	
	public String answerMaker(String answer)
	{
		// 초기에 시작할때 응답 테이블에서 answers 문자열을 집어와야한다. 
		// 불러온문자열에서 어펜드하는 형식으로 가야한다.
		
		String retText = "@";
		
		String temp[] = answer.split("&");
		
		temp[0] = temp[0].replace("type=", "");
		temp[1] = temp[1].replace("q_num=", "");
		// : 기호로 응답 번호 저장구분
		temp[2] = temp[2].replace("answers=", ":");
		temp[3] = temp[3].replace("desText=", "");
		
		
		for (int i = 0; i < temp.length-1 ; i ++)
		{			
			//1. 질문타입
			//2. 질문번호   ex : S2
			//3. 응답 번호 ( 척도형은 이스케이프문자, 를 사용하여 구분 )
			//4. 서술형 답변 
			
			retText += temp[i]; 
		}

		// ******** 나눌때 ************
		// @ : 구문
		// S~T : 삽입타입
		// X의숫자 : 응답 번호  ( 척도형은 , 로 구분하여 다수 )
		// # : 서술형 응답
		// & : 첨부파일 형태 
		// | 질의 구분 


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
		
		// 용어가 혼동된다. 별수없이 쓰긴하지만 나중에 네이밍을 바꿔서 해당 번호와 과제id 에 맞는 과제 가져오는 함수명으로 명확하게 지어주자
		previewQuestionVO = questionService.getNextQuestion(previewQuestionVO);
		
		System.out.println("JINX33");
		System.out.println(previewQuestionVO.getQuestion_id());
		
		
		model.addAttribute("vo" , previewQuestionVO);
		model.addAttribute("nextpage" , questionService.getQuestion(fromQuestionVO));
		model.addAttribute("history_arr" , history_arr);
		
		// option 리스트각 하나당 갖고있는 이미지를 객체에 다시 할당하여 넣어준다.
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

		// option 리스트각 하나당 갖고있는 이미지를 객체에 다시 할당하여 넣어준다.
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
