package seoul.front.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/*import com.mysql.jdbc.log.Log4JLogger;*/
















import common.SessionContants;
import seoul.admin.service.AnswersService;
import seoul.admin.service.MonitorApplyService;
import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.service.SubjectService;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionSettingsVO;
import seoul.admin.vo.QuestionVO;
import seoul.admin.vo.SubjectVO;
import seoul.member.MemberVO;
import util.SessionUtil;

@Controller
@RequestMapping("/front/subject/")
public class MonitorSubjectController {
	
	int onEnter = 0;
	
	@Autowired
	private SubjectInfoService subjectInfoService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private OptionService optionService;

	@Autowired
	private AnswersService answersService;
	
	@Autowired
	private QuestionSettingsService 	questionSettingsService;
	
	@Autowired
	private MonitorApplyService 	monitorApplyService;	
	
	
	@RequestMapping("bank.do")
	public String bank(Model model, @ModelAttribute MonitorApplyVO subjectVO) throws Exception{
		
		MonitorApplyVO monitorApplyVO = new MonitorApplyVO();
		
		monitorApplyVO.setSubject_id(subjectVO.getSubject_id());			
				
		model.addAttribute("subjectID",subjectVO.getSubject_id() ); 
		model.addAttribute("team",subjectVO.getTeam() ); 
		model.addAttribute("member_id",subjectVO.getMember_id() ); 
		model.addAttribute("vo", monitorApplyService.getMonitorApply(monitorApplyVO));
		
		return "front/monitor/test/bank.testform";
	}
	
	@RequestMapping("bank_apply.do")
	public @ResponseBody Map<String, Object> bank_apply(Model model, @ModelAttribute MonitorApplyVO monitorApplyVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
						
		if (monitorApplyService.saveMonitorApply(monitorApplyVO) > 0) {

			resultMap.put("idx", monitorApplyVO.getIdx());
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		
		
		return resultMap;
	}
	
	
	@RequestMapping("modify.do")
	public String modify(Model model, @ModelAttribute QuestionVO questionVO , SubjectVO subjectVO , AnswersVO answersVO) throws Exception{
		List<QuestionVO> list =  questionService.getQuestionList(questionVO);
		
		subjectVO = subjectInfoService.getSubject(subjectVO);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );
		
		MemberVO mem = (MemberVO)ret;

		if (mem != null)
		{
			// 해당 과제응답항목에 대한 회원아이디 / 과제명 / 과제 완료여부 ( 중복 과제 응답시 ???) 

			model.addAttribute("m_vo", mem);
			
			answersVO.setMember_id(mem.getId());
			
			answersVO = answersService.getAnswers(answersVO);
			
			String history_params = answersVO.getAnswers();

			String back_temp;
			String back_temp_arr[];
			
			if (history_params != null && history_params != "") 
			{
				String temp[] = history_params.split("[|]");
				
				back_temp = temp[temp.length-1];
				
				String now_num = back_temp.substring(back_temp.indexOf("@")+2 , back_temp.indexOf(":") );
							
				model.addAttribute("history_params", history_params);
				
				model.addAttribute("now_num", now_num);
				
				model.addAttribute("now_arr", Integer.parseInt(now_num)-1);
			}
			model.addAttribute("answers_id" , answersVO.getAnswers_id());
		}

		model.addAttribute("is_payment", subjectVO.getPay_yn());

		model.addAttribute("subject_id", subjectVO.getSubject_id());
		model.addAttribute("list", questionService.getQuestionList(questionVO));
		model.addAttribute("headertitle", subjectInfoService.getSubject(subjectVO));
		
		return "front/monitor/test/list.testform";
	}
	
	
	@RequestMapping("list.do")
	public String list(Model model, @ModelAttribute QuestionVO questionVO , SubjectVO subjectVO) throws Exception{
		List<QuestionVO> list =  questionService.getQuestionList(questionVO);
		
		subjectVO = subjectInfoService.getSubject(subjectVO);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );
		
		MemberVO mem = (MemberVO)ret;
		AnswersVO answersVO = new  AnswersVO();
		
		if (mem != null)
		{
			// 해당 과제응답항목에 대한 회원아이디 / 과제명 / 과제 완료여부 ( 중복 과제 응답시 ???)
			
			model.addAttribute("m_vo", mem);
			
			answersVO.setSubject_id(subjectVO.getSubject_id());
			answersVO.setMember_id(mem.getId());
						
			answersVO.setQuery("temporary ='Y'");
			
			answersVO = answersService.getAnswers(answersVO);

			
			if (answersVO==null)
			{
				answersVO = new  AnswersVO();
				answersVO.setSubject_id(subjectVO.getSubject_id());
				answersVO.setMember_id(mem.getId());
				
				answersVO.setPoll_num(mem.getPoll_num());
				
				// 최초 인서트 
				answersService.insertAnswers(answersVO);
								
				answersVO.setQuery("temporary ='Y'");
				
				answersVO = answersService.getAnswers(answersVO);
				
			}
			
		}
		model.addAttribute("is_payment", subjectVO.getPay_yn());

		model.addAttribute("subject_id", subjectVO.getSubject_id());
		model.addAttribute("answers_id" , answersVO.getAnswers_id());
		model.addAttribute("list", questionService.getQuestionList(questionVO));
		model.addAttribute("headertitle", subjectInfoService.getSubject(subjectVO));
		
		return "front/monitor/test/list.testform";
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
	
	public String answerMaker(String answer)
	{
		// 초기에 시작할때 응답 테이블에서 answers 문자열을 집어와야한다. 
		// 불러온문자열에서 어펜드하는 형식으로 가야한다.
		
		String retText = "@";
		
		// answers_X 패턴을 쓰는 문자열인지 확인.
		// 서술형 포함 
		
		// 단일형 말고
		if (answer.contains("answers_") && !answer.contains("type=S"))
		{
			String temp[] = answer.split("&answers_");
			String answers_temp = "";
			String t_img_temp = "";
			
			if(answer.contains("type=O"))
			{
//				String temp_str = answer.replace("type=", "").replace("q_num=", "").replace("answers=", "").replace("&","");
				
				String temp_str = answer.replace("type=", "").replace("q_num=", "");
				
				//temp_str = temp_str.substring(0 , temp_str.indexOf("answers_"));
				
				String answer_str = temp_str.substring(0, temp_str.indexOf("answers_"));
				
				
				String temp_o[] = answer.split("&");  
				  
				temp_o[0] = temp_o[0].replace("type=", "");
				temp_o[1] = temp_o[1].replace("q_num=", "");
				
				String o_answer_arr[] = temp_o[2].replace("answers=","").split(",");
				
				String o_temp="";
				
				for (int i = 0; i < o_answer_arr.length ; i ++)
				{
					o_temp+= "#"+o_answer_arr[i];
				}
								
				
				for (int i = 0; i < 2 ; i ++)
				{			
					//1. 질문타입
					//2. 질문번호   ex : S2
					//3. 응답 번호 ( 척도형은 이스케이프문자, 를 사용하여 구분 )
					//4. 서술형 답변 
					
					retText += temp_o[i]; 
				}
				
				retText += ":" + o_temp;
				
			}
			else{
				
			
				for (int j=1;j < temp.length;j++)
				{
					answers_temp += "#"+temp[j].substring(temp[j].indexOf("=")+1);
				}
	
				if (answer.contains("type=T"))
				{
					t_img_temp = answer.substring(answer.indexOf("&files") ).replace("&files=", "Ω");
					
					if (t_img_temp.length() < 4 ) 
					{
						t_img_temp = "";
					}
					answers_temp = answers_temp.substring(0,answers_temp.indexOf("&files"));
				}
				
				answer = answer.substring(0 , answer.indexOf("&answers_") );
				
				temp = answer.split("&");
	
				temp[0] = temp[0].replace("type=", "");
				temp[1] = temp[1].replace("q_num=", "");
				
	
				
				for (int i = 0; i < temp.length ; i ++)
				{			
					//1. 질문타입
					//2. 질문번호   ex : S2
					//3. 응답 번호 ( 척도형은 이스케이프문자, 를 사용하여 구분 )
					//4. 서술형 답변 
					
					retText += temp[i]; 
				}
				
				retText += ":" + answers_temp + t_img_temp;
			}
		}
		else{			
			
			String temp_str = answer.replace("type=", "").replace("q_num=", "").replace("answers=", "").replace("&","");
			
			
			String answer_str = "";
			
			
			if (!answer.contains("type=B")) 
				answer_str = answer.substring(answer.indexOf("answers=")+8,answer.indexOf("answers=")+9);
			
			String temp[] = answer.split("&");  
			  
			temp[0] = temp[0].replace("type=", "");
			temp[1] = temp[1].replace("q_num=", "");
			// : 기호로 응답 번호 저장구분
			//temp[2] = temp[2].replace("answers=", ":");
			
			
			for (int i = 0; i < 2 ; i ++)
			{			
				//1. 질문타입
				//2. 질문번호   ex : S2
				//3. 응답 번호 ( 척도형은 이스케이프문자, 를 사용하여 구분 )
				//4. 서술형 답변 
				
				retText += temp[i]; 
			}
			retText += ":"+answer_str;
			
			if (temp_str.contains("answers_text")) 
			{
				retText += temp_str.substring(temp_str.indexOf("answers_text"));
			}
			// ******** 나눌때 ************
			// @ : 구문
			// S~T : 삽입타입
			// X의숫자 : 응답 번호  ( 척도형은 , 로 구분하여 다수 )
			// # : 서술형 응답 , 연속된 응답의 형태 ( 척도 , 서열 ) 
			// & : 첨부파일 형태 
			// | 질의 구분 
			
			if (retText.contains("answers_text"))
			{
				temp = retText.split("answers_text");
				String answers_temp = "";
				
				for (int j=1;j < temp.length;j++)
				{
					if ( ("#"+temp[j].substring(temp[j].indexOf("=")+1)).length() > 2 ) 
						answers_temp += "#"+temp[j].substring(temp[j].indexOf("=")+1);
				}
				
				if (answers_temp.length() > 2)
				{
					retText = temp[0] + answers_temp;
				}
				else
				{
					retText = temp[0];
				}

			}
			
		}

		return retText + "|";
	}
	
	@RequestMapping(value="previewpage.do" , method=RequestMethod.POST)
	public String previewpage(Model model, 
			@ModelAttribute QuestionVO fromQuestionVO,
			@RequestParam(value="history_arr", defaultValue="") String history_arr,
			@RequestParam(value="history_params", defaultValue="") String history_params,
			@RequestParam(value="back_num", defaultValue="") int back_num,
			@RequestParam(value="answers_id", defaultValue="") String answers_id ) throws Exception{
		
		
		fromQuestionVO = questionService.getQuestion(fromQuestionVO);
				
		String back_temp; 
		String back_temp_arr[]; 
		
		if (!history_params.isEmpty()) 
		{
			String temp[] = history_params.split("[|]");
			
			back_temp = temp[temp.length-1];
			
			history_params = history_params.replace(back_temp+"|", "");
			
			if (!back_temp.contains("@S")) 
			{
				back_temp = back_temp.substring(back_temp.indexOf(":")+1);
			}
			else   // 단일형 응답은 서술형 텍스트가 있어서 좀 특이하게 처리해준다.
			{
				//String type_S_answer = back_temp.substring(back_temp.indexOf(":")+1,back_temp.indexOf(":")+2);
				//back_temp = back_temp.substring(back_temp.indexOf(":")+2);
				
				if ( back_temp.contains("#"))
				{
					String s_type_str = "";
					s_type_str = back_temp.substring(back_temp.indexOf("#"));
					
					back_temp_arr = s_type_str.split("#");
					
					model.addAttribute("history_answer_text", back_temp_arr[1]);
					
					back_temp = back_temp.substring(back_temp.indexOf(":")+1,back_temp.indexOf(":")+2);
				}else{
					back_temp = back_temp.substring(back_temp.indexOf(":")+1,back_temp.indexOf(":")+2);
				}
				//model.addAttribute("history_S_answer", type_S_answer);
			}
			// 서열 , 중복 형은 ',' 문자로 나눠지는데 @O or @M 로 찾으면 될거같다. 
			
			
			// 이건 첨부파일형의 이미지 첨부다.
			if (back_temp.contains("Ω"))
			{
				back_temp_arr = back_temp.split("Ω");
				
				model.addAttribute("t_type_img", back_temp_arr[1]);				

				back_temp_arr = back_temp.split("#");
				
				back_temp_arr[1] = back_temp_arr[1].substring(0,back_temp_arr[1].indexOf("Ω"));
				
				model.addAttribute("history_answer", back_temp_arr);
			}else{
			
				if (back_temp.contains("#"))
				{
					back_temp_arr = back_temp.split("#");
					
					model.addAttribute("history_answer", back_temp_arr);
					
				}
				else{
				
					model.addAttribute("history_answer", back_temp);
				}
			}
		}
		
		QuestionVO previewQuestionVO = new QuestionVO();
		
		
		previewQuestionVO.setNext_num(back_num);
		previewQuestionVO.setSubject_id(fromQuestionVO.getSubject_id());
		
		
		// 용어가 혼동된다. 별수없이 쓰긴하지만 나중에 네이밍을 바꿔서 해당 번호와 과제id 에 맞는 과제 가져오는 함수명으로 명확하게 지어주자
		previewQuestionVO = questionService.getNextQuestion(previewQuestionVO);
				
		
		model.addAttribute("vo" , previewQuestionVO);
		model.addAttribute("nextpage" , questionService.getQuestion(fromQuestionVO));
		model.addAttribute("history_arr" , history_arr);
		model.addAttribute("history_params", history_params);

		
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
		
		
		
		return "front/monitor/test/"+previewQuestionVO.getType()+".ajax";
	}
	
	
	@RequestMapping(value="complete.do" , method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> complete(Model model, 
			@RequestParam(value="history_params", defaultValue="") String history_params,
			@RequestParam(value="params", defaultValue="") String params , 
			@RequestParam(value="answers_id", defaultValue="") String answers_id) throws Exception{
			
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		params =  URLDecoder.decode(params, "UTF-8");
		
		if (!params.isEmpty()) 
		{
			params = answerMaker(params);		
			
			history_params += params;
			
		}
		
		AnswersVO answersVO = new AnswersVO();		
		answersVO.setAnswers_id(answers_id);
		answersVO.setAnswers(history_params);
		
		answersVO.setTemporary("N");
		
		if(answersService.updateAnswers(answersVO) > 0){
			resultMap.put("result", "success");
		}else{
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value="nextpage.do" , method=RequestMethod.POST)
	public String nextpage(Model model, 
			@ModelAttribute QuestionVO questionVO,
			@RequestParam(value="history_arr", defaultValue="") String history_arr,
			@RequestParam(value="history_params", defaultValue="") String history_params,
			@RequestParam(value="params", defaultValue="") String params , 
			@RequestParam(value="bifurcation", defaultValue="") int bifurcation,
			@RequestParam(value="answers_id", defaultValue="") String answers_id) throws Exception{
		AnswersVO answersVO = new AnswersVO();		
		answersVO.setAnswers(answers_id);
		
		// Form serialize 형태로 들어오는 형태는 !#%$%#$# 이런식으로 깨지는 url 코드 형태이며 ,
		// 한글형식이 주로 깨짐. 이걸 해결하기위해 다시 디코딩 해주는 작업

		params =  URLDecoder.decode(params, "UTF-8");
		
		if (!params.isEmpty()) 
		{
			params = answerMaker(params);		
			
			history_params += params;
		}
		
		// 마지막 문항에서 question_id 값을 반환하지 않기에 체크 
		if (questionVO.getQuestion_id() !="" )		
			questionVO = questionService.getQuestion(questionVO);
		
		QuestionVO nextQuestionVO = new QuestionVO();
		
		String str ="";
		
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
			
			if (questionVO.getQuestion_id() !="" )
				nextQuestionVO = questionService.getNextQuestion(nextQuestionVO);
		}
		
		// 요구분석 결과 next 시 매번 저장하는구조로 변경.
		answersVO.setAnswers_id(answers_id);
		answersVO.setAnswers(history_params);
		
		answersVO.setTemporary("Y");	// 중간 저장 형태는 과제가 종료시켜지기 전까지는 무조건 Y 			
		answersService.updateAnswers(answersVO);

		
		
		model.addAttribute("vo" , questionVO);
		model.addAttribute("nextpage" , nextQuestionVO);
		model.addAttribute("history_arr" , history_arr);
		model.addAttribute("history_params", history_params);

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
		
		if (questionVO.getQuestion_id() !="" )
			return "front/monitor/test/"+questionVO.getType()+".ajax";
		else
			return "front/monitor/test/END.ajax";
	}
	
}
