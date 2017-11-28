package seoul.admin.controller;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
			System.out.println("전체응답:" + imagePath);
			
			//String[] alist = imagePath.split("\\|");

			List<String> alist = Arrays.asList(imagePath.split("\\|"));
			
			System.out.println(alist.size());
			/*
			for( int iSeq = 0; iSeq < alist.size(); iSeq++) {
				String iPath = alist.get(iSeq);
				System.out.println(" 기존답변 :" + iPath);
				if(iPath.indexOf('Ω') > -1) {
					//TODO 이미지가 포함된 경로일 경우 이미지의 썸네일을 확인하고 없으면 생성 하고 있으면 경로를 그대로 리턴한다.
					System.out.println(" 답변분석 : " + iPath);
					String[] ip = iPath.split("Ω");
					String rPath = ip[1].replaceAll("//", "/");
					System.out.println(" 답변분석 : " + iPath);
					String[] rpb = rPath.split("/");
					StringBuilder rsb = new StringBuilder();
					//rsb.append("1/" + rpb[0]); // /
					//rsb.append("/" + rpb[1]);    // /upload
					rsb.append(       rpb[2]);    // upload
					rsb.append("/" + "thumb");   // /thumb
					rsb.append("/" + rpb[3]);    // year month
					rsb.append("/" + rpb[4]);    // file.jpg
					String u = request.getSession().getServletContext().getRealPath("/");
					String rp = u + rsb.toString();
					String rd = u + rpb[2] + "/thumb" + "/" + rpb[3] + "/";
					String rs = u + rpb[2] + "/" + rpb[3] + "/" + rpb[4];
					File td = new File(rd);
					System.out.println("thumb path: " + rd);
					System.out.println("thumb file: " + rp);
					System.out.println("upload    : " + rs);
					if(!td.exists()) { //경로존재여부 
						td.mkdirs();
					}
					File ti = new File(rp);
					if(!ti.exists()) { //파일존재여부
						Thumbnails.of(rs).size(150, 150).outputFormat("png").toFile(ti);
					}
					
				}
			}
			*/
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
}
