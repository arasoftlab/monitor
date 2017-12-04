package seoul.admin.controller;

import java.io.File;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.coobird.thumbnailator.Thumbnails;
import seoul.admin.service.AnswersService;
import seoul.admin.service.OptionService;
import seoul.admin.service.QuestionService;
import seoul.admin.service.QuestionSettingsService;
import seoul.admin.service.SubjectInfoService;
import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionSettingsVO;
import seoul.admin.vo.QuestionVO;
import seoul.admin.vo.SubjectVO;
import util.BaseUtil;

@Controller
@RequestMapping("/admin/subject/answer")
public class SubjectAnswerController {
	
	//@Autowired
	//private SubjectService subjectService;
	
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
	public String view(Model model, @ModelAttribute AnswersVO answersVO, HttpServletRequest request) throws Exception{
		System.out.println(" team_num :" + answersVO.getTeam_num());
		
		SubjectVO subjectVO = new SubjectVO();
		
		subjectVO.setSubject_id(answersVO.getSubject_id());
		
		subjectVO = subjectInfoService.getSubject(subjectVO);		
		
		List<AnswersVO> answers_list = answersService.getAnswerList(answersVO);
		
		QuestionVO questionVO = new QuestionVO();
		questionVO.setSubject_id(subjectVO.getSubject_id());
		
		List<QuestionVO> q_list = questionService.getQuestionList(questionVO);
		
		for(int imageSeq = 0; imageSeq < answers_list.size(); imageSeq++) {
			AnswersVO an = new AnswersVO();
			an = answers_list.get(imageSeq);
			
			String imagePath = an.getAnswers();
			//답변에 구분자 확인이 가능할 경우 평문 그렇지 않을 경우 base64 인코딩된 텍스트
			//TODO 이 부분을 BASE64 code로 대체해야 할것 으로 보임
			//String imagePath = (an.getAnswers().indexOf("@")> -1) ? an.getAnswers(): BaseUtil.deParams(an.getAnswers());
			//an.setAnswers(URLDecoder.decode(imagePath, "UTF-8"));
			//String imagePath = BaseUtil.deParams(an.getAnswers());
			
			System.out.println(imagePath);
									
			//답변내역이 없을때 에러를 방지하기 위한 코드
			imagePath = ObjectUtils.isEmpty(imagePath)? "" : imagePath;
			
			if(imagePath.indexOf('Ω') > -1) {
			
				List<String> alist = Arrays.asList(imagePath.split("\\|"));
				
				//System.out.println(alist.size());
				
				for( int iSeq = 0; iSeq < alist.size(); iSeq++) {
					String iPath = alist.get(iSeq);
	
					if(iPath.indexOf('Ω') > -1) {
						//TODO 이미지가 포함된 경로일 경우 이미지의 썸네일을 확인하고 없으면 생성 하고 있으면 경로를 그대로 리턴한다.
						String[] ip = iPath.split("Ω");
						String rPath = ip[1].replaceAll("//", "/");
						String fExt = rPath.substring(rPath.lastIndexOf(".") + 1,  rPath.length());
						String[] iExt = {"bmp","gif","jpg","jpeg","png", "BMP", "GIF", "JPG", "JPEG", "PNG" };
						
						if(find(iExt, fExt) > -1) {
							String[] rpb = rPath.split("/");
							StringBuilder rsb = new StringBuilder();
							//rsb.append("1/" + rpb[0]); // // 공백
							//rsb.append("/" + rpb[1]);    // /monitor
							rsb.append(       rpb[2]);    //  /upload
							rsb.append("/" + "thumb");   //   /thumb
							rsb.append("/" + rpb[3]);    //   /year month
							rsb.append("/" + rpb[4]);    //   /file.jpg
							
							String u = request.getSession().getServletContext().getRealPath("/");
							//String u = "D://sts//workspace//"; / for dev
							String rp = u + rsb.toString();
							String rd = u + rpb[2] + "/thumb" + "/" + rpb[3] + "/";
							String rs = u + rpb[2] + "/" + rpb[3] + "/" + rpb[4];
							File td = new File(rd);
							// rp 파일 rd 경로 rs 원본위치
							if(!td.exists()) { //경로존재여부 
								td.mkdirs();
							}
							File ti = new File(rp);
							if(!ti.exists()) { //파일존재여부
								rp = rp.substring(0, rp.lastIndexOf(".")) + "png";
								File ci = new File(rp);
								Thumbnails.of(rs).size(150, 150).outputFormat("png").toFile(ci);
								System.out.println("make file" + ti);
							}
						}
					}
				}
			
			}
			
		}
		
		
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
	
	private int find(String[] iExt, String fExt) {
		for(int i=0; i< iExt.length; i++) {
			if(iExt[i].indexOf(fExt) > 0)
				return i;
		}
		
		return -1;
	}

	@RequestMapping("noanswer.do")
	public String noanswer(Model model, @ModelAttribute AnswersVO answersVO) throws Exception{
		
		List<AnswersVO> temp = answersService.getNoAnswerList(answersVO);
		
		SubjectVO subjectVO = new SubjectVO();
		
		subjectVO.setSubject_id(answersVO.getSubject_id());
		
		subjectVO = subjectInfoService.getSubject(subjectVO);		

		model.addAttribute("s_vo",subjectVO);
		model.addAttribute("temp", temp);
		model.addAttribute("list", answersService.getNoAnswerList(answersVO));
		model.addAttribute("vo", answersVO);
		model.addAttribute("page", answersVO.getPagingVO());

		model.addAttribute("total_cnt", answersService.getNoAnswersCnt(answersVO));
		
		return "admin/subjects/answer/noanswer.admin";
	}
	
	@RequestMapping("apply.do")
	public @ResponseBody Map<String, Object> apply(Model model, 
			@RequestParam(value="select_arr[]") List<String> arrayParams,
			@RequestParam(value="is_select") String is_select ) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		for (int i = 0 ; i < arrayParams.size() ; i++)
		{
			AnswersVO answersVO = new AnswersVO();
			
			answersVO.setAnswers_id(arrayParams.get(i));
			//answersVO.setIs_selection(is_select);
			
			System.out.println(" 동작정보 : " + is_select);
			
			if(is_select.equals("D")) {
				System.out.println("삭제:" + answersVO.getAnswers_id() );
				answersService.deleteAnswers(answersVO);
			}
		}
		
	
		resultMap.put("result", "success");
		return resultMap;
		
	}
	
}
