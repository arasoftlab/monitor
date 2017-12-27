package seoul.front.controller;

import java.net.URLDecoder;
//import java.util.Base64;
//import java.util.Base64.Decoder;
//import java.util.Base64.Encoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/*import com.mysql.jdbc.log.Log4JLogger;*/


import common.SessionContants;
import seoul.admin.service.AnswersService;
import seoul.admin.service.MonitorApplyService;
import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.service.SubjectInfoService;

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
		monitorApplyVO.setMember_id(subjectVO.getMember_id());
		
		MonitorApplyVO maVO = monitorApplyService.getMonitorApply(monitorApplyVO);
		
		//기존에 등록된 조사에대한 입금정보가 있으면 기존정보를 가져오고 없으면 새로 생성
		if(ObjectUtils.isEmpty(maVO)) {
			model.addAttribute("subjectID",subjectVO.getSubject_id() ); 
			model.addAttribute("team",subjectVO.getTeam() ); 
			model.addAttribute("member_id",subjectVO.getMember_id() );
			model.addAttribute("isApply", "0");
		}else {
			model.addAttribute("subjectID", maVO.getSubject_id() ); 
			model.addAttribute("team", maVO.getTeam() ); 
			model.addAttribute("member_id", maVO.getMember_id() );
			model.addAttribute("isApply", "1");
		}
		
		model.addAttribute("vo", monitorApplyService.getMonitorApply(monitorApplyVO));
		
		return "front/monitor/test/bank.testform";
	}
	
	@RequestMapping("bank_apply.do")
	public @ResponseBody Map<String, Object> bank_apply(Model model, 
			@ModelAttribute MonitorApplyVO monitorApplyVO,
			@RequestParam( value="isApply", defaultValue="0" ) String isApply ) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		System.out.println("isApply :" + isApply);
		
		
		//과제수가 2개이상일 경우 기존 등록된 값을 체크하여 등록되어 있으면 수정 없으면 등록
		if("0".equals(isApply)) { 		
			if (monitorApplyService.saveMonitorApply(monitorApplyVO) > 0) {
				System.out.println(" 1 :" + monitorApplyVO.toString());
				resultMap.put("idx", monitorApplyVO.getIdx());
				resultMap.put("result", "success");
			}else{
				System.out.println(" 2 :" + monitorApplyVO.toString());
				resultMap.put("result", "fail");
			}
		
		}else {
			monitorApplyVO = monitorApplyService.getMonitorApply(monitorApplyVO);
			
			if (monitorApplyService.updateMonitorApply(monitorApplyVO) > 0) {
				System.out.println(" 3 :" + monitorApplyVO.toString());
				resultMap.put("idx", monitorApplyVO.getIdx());
				resultMap.put("result", "success");
			}else{
				System.out.println(" 4 :" + monitorApplyVO.toString());
				resultMap.put("result", "fail");
			}
			
		}
		System.out.println(" mod data : " + monitorApplyVO.toString());
		
		return resultMap;
	}
	
	
	@RequestMapping("modify.do")
	public String modify(Model model, @ModelAttribute QuestionVO questionVO , SubjectVO subjectVO , AnswersVO answersVO) throws Exception{
		//List<QuestionVO> list =  questionService.getQuestionList(questionVO);
		
		subjectVO = subjectInfoService.getSubject(subjectVO);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );
		
		System.out.println("report_num : " + answersVO.getReport_num());
		
		MemberVO mem = (MemberVO)ret;

		if (mem != null)
		{
 
			model.addAttribute("m_vo", mem);
			
			answersVO.setMember_id(mem.getId());
			
			answersVO = answersService.getAnswers(answersVO);
			
			String history_params = answersVO.getAnswers();
			

			String back_temp;
			//String back_temp_arr[];
			
			if (history_params != null && history_params != "") 
			{
				String temp[] = history_params.split("[|]");
				
				back_temp = temp[temp.length-1];
				
				String now_num = back_temp.substring(back_temp.indexOf("@")+2 , back_temp.indexOf(":") );
							
				System.out.println(history_params);
				//System.out.println(deParams(history_params));
				//System.out.println(enParams(history_params));;
				model.addAttribute("history_params", history_params);
				
				model.addAttribute("now_num", now_num);
				
				model.addAttribute("now_arr", Integer.parseInt(now_num)-1);
			}
			model.addAttribute("answers_id" , answersVO.getAnswers_id());
		}

		model.addAttribute("is_payment", subjectVO.getPay_yn());

		model.addAttribute("subject_id", subjectVO.getSubject_id());
		model.addAttribute("report_num", answersVO.getReport_num());
		model.addAttribute("list", questionService.getQuestionList(questionVO));
		model.addAttribute("headertitle", subjectInfoService.getSubject(subjectVO));
		
		return "front/monitor/test/list.testform";
	}
	
	
	@RequestMapping("list.do")
	public String list(Model model, 
			@ModelAttribute QuestionVO questionVO , 
			SubjectVO subjectVO,
			@RequestParam(value="report_num", defaultValue="0") int report_num
			) throws Exception{
		//List<QuestionVO> list =  questionService.getQuestionList(questionVO);
		
		subjectVO = subjectInfoService.getSubject(subjectVO);
		
		Object ret = SessionUtil.getAttribute(SessionContants.MEMBER );
		
		MemberVO mem = (MemberVO)ret;
		AnswersVO answersVO = new  AnswersVO();
		
		System.out.println(" 초기페이지 리스트 전송전 값 체크 : " + mem.toString());
		
		if (mem != null)
		{
 
			model.addAttribute("m_vo", mem);
			
			answersVO.setSubject_id(subjectVO.getSubject_id());
			answersVO.setMember_id(mem.getId());
			answersVO.setReport_num(report_num);			
			answersVO.setQuery("temporary ='Y'");
			
			answersVO = answersService.getAnswers(answersVO);

			System.out.println(" 이전  : 이어하기시도 "  );
			
			if (ObjectUtils.isEmpty(answersVO))
			{
				System.out.println(" 이전  : 신규생성 "  );
				
				answersVO = new  AnswersVO();
				answersVO.setSubject_id(subjectVO.getSubject_id());
				answersVO.setMember_id(mem.getId());
				answersVO.setReport_num(report_num);
				answersVO.setPoll_num(mem.getPoll_num());
 
				answersService.insertAnswers(answersVO);
								
				answersVO.setQuery("temporary ='Y'");
				
				answersVO = answersService.getAnswers(answersVO);
				
			}
			
					
			System.out.println(" 이후  : " + answersVO.toString());
						
		}
		
		SubjectVO si = subjectInfoService.getSubject(subjectVO);
		System.out.println("응답값 확인 : " + answersVO.toString());
		System.out.println(" 헤더타이틀값 확인 : " + si.toString() );
		
		model.addAttribute("is_payment", subjectVO.getPay_yn());

		model.addAttribute("subject_id", subjectVO.getSubject_id());
		model.addAttribute("answers_id" , answersVO.getAnswers_id());
		model.addAttribute("report_num", report_num);
		model.addAttribute("list", questionService.getQuestionList(questionVO));
		model.addAttribute("headertitle", si);
		
		return "front/monitor/test/list.testform";
	}
 
	public String answerMaker(String answer)
	{
 
		String retText = "@";
 
		if (answer.contains("answers_") && !answer.contains("type=S") )
		{
			String temp[] = answer.split("&answers_");
			String answers_temp = "";
			String t_img_temp = "";
			
			if(answer.contains("type=O"))
			{
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
					retText += temp_o[i]; 
				}
				
				retText += ":" + o_temp;
				
			}else{
							
				for (int j=1;j < temp.length;j++)
				{
					String ans = temp[j].substring(temp[j].indexOf("=")+1);
					System.out.println(" 답변 체취 : " + temp[j]);
					//중복 서술형이 포함될 경우 아래 실행됨 #3^
					if(temp[j].contains("text_")) {
						
						String eNo = temp[j].substring(temp[j].indexOf("text_") + 5 , temp[j].indexOf("="));
						System.out.println(" text 포함일 경우 : " + eNo);
						
						ans = eNo + "^" + ans;
						System.out.println(" text 포함된 답변 : " + ans);
						j++;
					}
					
					answers_temp += "#"+ ans;
					
					System.out.println(" 작성중인 답변 : " + answers_temp);
					
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
 
					retText += temp[i]; 
				}
				
				retText += ":" + answers_temp + t_img_temp;
			}
		} else {			
			
			//단순응답중 서술형일경우 답변의 형태는 
			//type=S&q_num=1&answers_text_2=test&answers=2
			//이중 텍스트입력값을 분리함
			String tmpans = "";
			tmpans = answer.contains("type=S") ? answer.substring(0, answer.lastIndexOf("&")) : answer;
			
			System.out.println(" start : " + tmpans.toString());
			
			String temp_str = tmpans.replace("type=", "").replace("q_num=", "").replace("answers=", "").replace("&","");
			
			System.out.println(" step0 : " + temp_str);
			
			String answer_str = "";
						
			if (!answer.contains("type=B")) 
				answer_str = answer.substring(answer.indexOf("answers=")+8,answer.indexOf("answers=")+9);
			
			String temp[] = answer.split("&");  
			  
			temp[0] = temp[0].replace("type=", "");
			temp[1] = temp[1].replace("q_num=", "");
 
			//temp[2] = temp[2].replace("answers=", ":");
			
			System.out.println(" step1 : " + answer);
						
			
			for (int i = 0; i < 2 ; i ++)
			{			
 				retText += temp[i]; 
			}
			retText += ":"+answer_str;
			
			System.out.println(" step2 : " + retText);
			
			if (temp_str.contains("answers_text")) 
			{
				retText += temp_str.substring(temp_str.indexOf("answers_text"));
			}
 
			System.out.println(" step3 : " + retText);
			
			
			if (retText.contains("answers_text"))
			{
				temp = retText.split("answers_text");
				String answers_temp = "";
				
				for (int j=1;j < temp.length;j++)
				{
					if ( ("#"+temp[j].substring(temp[j].indexOf("=")+1)).length() > 2 ) 
						answers_temp += "#"+temp[j].substring(temp[j].indexOf("=")+1);
				}
				
				System.out.println(" step4 : " + answers_temp);
				
								
				if (answers_temp.length() > 2)
				{
					retText = temp[0] + answers_temp;
				}
				else
				{
					retText = temp[0];
				}
				
				System.out.println(" step5 : " + retText);
				

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
			@RequestParam(value="report_num", defaultValue="0") int report_num,
			@RequestParam(value="answers_id", defaultValue="") String answers_id ) throws Exception{
		
		
		fromQuestionVO = questionService.getQuestion(fromQuestionVO);
				
		String back_temp; 
		String back_temp_arr[]; 
		
		System.out.println(" PREVIEW DATA : " + history_arr);    //null ??
		System.out.println(" PREVIEW DATA : " + history_params); //@S1:1|@M2:#3^test|
		System.out.println(" PREVIEW DATA : " + back_num);       // 이전번호
		System.out.println(" PREVIEW DATA : " + report_num);     //조사번호
		System.out.println(" PREVIEW DATA : " + answers_id);     //응답번호
		
		//이어하기 일 경우 마지막 답변을 분리하여 적용해야 하므로 처리하는 로직
		if (!history_params.isEmpty()) 
		{
			
			String temp[] = history_params.split("\\|");
			back_temp = temp[temp.length-1];
			history_params = history_params.replace(back_temp+"|", ""); //마지막 답변 정보제거  @M2:#3^test| --> ''
			
			//@M2:#3^test
			System.out.println("1 : " + history_params);
			System.out.println("2 : " + back_temp);
			
			if (!back_temp.contains("@S") && !back_temp.contains("@M")) 
			{
				back_temp = back_temp.substring(back_temp.indexOf(":")+1);
				
				System.out.println("3-0 : " + back_temp);
			
			}
			
			if(back_temp.contains("@M")) {
				System.out.println("2 : " + back_temp);		
				//System.out.println("3-1 : " + back_temp.indexOf("^")); //true
				//System.out.println("3-1 : " + back_temp.indexOf("\\^")); //false
				//System.out.println("3-1 : " + back_temp.contains("^")); //true
				//System.out.println("3-1 : " + back_temp.contains("\\^")); //false
				
				if(back_temp.contains("^")) {
					String[] mS = back_temp.split("\\^");
					//System.out.println("3-1 : " + mS.length);
					model.addAttribute("history_answer_text", mS[1]);
					back_temp=mS[0];
					System.out.println("3-1 : " + mS[0]);
					System.out.println("3-1 : " + mS[1]);
				}
			}
			
			if(back_temp.contains("@S")){
				//String type_S_answer = back_temp.substring(back_temp.indexOf(":")+1,back_temp.indexOf(":")+2);
				//back_temp = back_temp.substring(back_temp.indexOf(":")+2);
				
				if ( back_temp.contains("#"))
				{
					String s_type_str = "";
					s_type_str = back_temp.substring(back_temp.indexOf("#"));
					back_temp_arr = s_type_str.split("#");
					model.addAttribute("history_answer_text", back_temp_arr[1]);
					back_temp = back_temp.substring(back_temp.indexOf(":")+1,back_temp.indexOf(":")+2);
					
					System.out.println("4 : " + back_temp);
				}else{
					back_temp = back_temp.substring(back_temp.indexOf(":")+1,back_temp.indexOf(":")+2);
					
					System.out.println("5 : " + back_temp);
				}
				
				System.out.println("3-3 : " + back_temp);
			}
			
			 
			if (back_temp.contains("Ω"))
			{
				back_temp_arr = back_temp.split("Ω");
				model.addAttribute("t_type_img", back_temp_arr[1]);				
				back_temp_arr = back_temp.split("#");
				back_temp_arr[1] = back_temp_arr[1].substring(0,back_temp_arr[1].indexOf("Ω"));
				model.addAttribute("history_answer", back_temp_arr);
				
				System.out.println("6 : " + back_temp_arr);
				
			}else{
			
				if (back_temp.contains("#"))
				{
					back_temp_arr = back_temp.split("#");
					model.addAttribute("history_answer", back_temp_arr);
					System.out.println("7 : " + back_temp_arr.length);
				}
				else{
				
					model.addAttribute("history_answer", back_temp);
					System.out.println("8 : " + back_temp);
				}
			}
		}
		
		
		
		QuestionVO previewQuestionVO = new QuestionVO();
		
		
		previewQuestionVO.setNext_num(back_num);
		previewQuestionVO.setSubject_id(fromQuestionVO.getSubject_id());
		
		
		// 용어가 혼동된다. 별수없이 쓰긴하지만 나중에 네이밍을 바꿔서 해당 번호와 과제id 에 맞는 과제 가져오는 함수명으로 명확하게 지어주자
		previewQuestionVO = questionService.getNextQuestion(previewQuestionVO);
				
		
		System.out.println("F PREVIEW DATA : " + history_arr);
		System.out.println("F PREVIEW DATA : " + history_params); //@S1:1|@M2:#3^test|
		System.out.println("F PREVIEW DATA : " + back_num); 
		System.out.println("F PREVIEW DATA : " + report_num);
		System.out.println("F PREVIEW DATA : " + answers_id);
		
		
		
		model.addAttribute("vo" , previewQuestionVO);
		model.addAttribute("nextpage" , questionService.getNextQuestion(fromQuestionVO));
		model.addAttribute("history_arr" , history_arr);
		model.addAttribute("history_params", history_params);
		model.addAttribute("report_num", report_num);

		
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
			@RequestParam(value="report_num"  ) int report_num,
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
		answersVO.setReport_num(report_num);
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
			@RequestParam(value="report_num", defaultValue="0") int report_num,
			@RequestParam(value="answers_id", defaultValue="") String answers_id) throws Exception{
		AnswersVO answersVO = new AnswersVO();		
		answersVO.setAnswers(answers_id);
 
		params =  URLDecoder.decode(params, "UTF-8");
		System.out.println(" history_arr : " + history_arr);
		System.out.println(" history_par : " + history_params);
		System.out.println(" params      : " + params);
		System.out.println(" bifurcation : " + bifurcation);
		System.out.println(" report_num  : " + report_num);
		System.out.println(" answers_id  : " + answers_id);
		
		// Form serialize 형태로 들어오는 형태는 !#%$%#$# 이런식으로 깨지는 url 코드 형태이며 ,
		// 한글형식이 주로 깨짐. 이걸 해결하기위해 다시 디코딩 해주는 작업
		if (!params.isEmpty()) 
		{			
			System.out.println(" 입력 파라메터의 값 : " + params);
			params = answerMaker(params);					
			history_params += params;
		}
 
		if (questionVO.getQuestion_id() !="" )		
			questionVO = questionService.getQuestion(questionVO);
		
		QuestionVO nextQuestionVO = new QuestionVO();
		
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
			
			if (questionVO.getQuestion_id() !="" )
				nextQuestionVO = questionService.getNextQuestion(nextQuestionVO);
		}
 
		answersVO.setAnswers_id(answers_id);
		answersVO.setAnswers(history_params);
		answersVO.setReport_num(report_num);
		answersVO.setTemporary("Y");	 
		answersService.updateAnswers(answersVO);

		
		
		model.addAttribute("vo" , questionVO);
		model.addAttribute("nextpage" , nextQuestionVO);
		model.addAttribute("history_arr" , history_arr);
		model.addAttribute("history_params", history_params);
		model.addAttribute("report_num", report_num);
 
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
		
		System.out.println("옵션 확인 : " + questionVO.toString());
		
		if (questionVO.getQuestion_id() !="" )
			return "front/monitor/test/"+questionVO.getType()+".ajax";
		else
			return "front/monitor/test/END.ajax";
	}
	
//	///문자열 해독
//	private static String deParams(String org) throws Exception {
//		Decoder decoder = Base64.getDecoder();
//		// 디코드
//		byte[] decodedBytes2 = decoder.decode(org);
//		String decodedString = new String(decodedBytes2, "UTF-8");
//		System.out.println(" 디코드 : " + decodedString);
//		return decodedString;
//	}
//	
//	///문자열 암호화
//	private static String enParams(String org) throws Exception{
//				
//		Encoder encoder = Base64.getEncoder();
//				
//		byte[] targetBytes = org.getBytes("UTF-8");
//		String encodedString = encoder.encodeToString(targetBytes);
//		System.out.println(" 인코드 : " + encodedString);			
//		return encodedString;
//	}
	
}
